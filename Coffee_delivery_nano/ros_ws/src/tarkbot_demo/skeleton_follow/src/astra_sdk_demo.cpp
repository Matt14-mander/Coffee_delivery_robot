// This file is part of the Orbbec Astra SDK [https://orbbec3d.com]
// Copyright (c) 2015-2017 Orbbec 3D
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// 
// Be excellent to each other.
#include <astra/capi/astra.h>
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <key_handler.h>
#include <ros/ros.h>
#include <skeleton_follow/astra_sdk_body.h>
#include <skeleton_follow/astra_sdk_maskdata.h>
#include <skeleton_follow/astra_sdk_bodynumber.h>
#include <sensor_msgs/Image.h>
#include <vector>

ros::Publisher bodylist_Pub;

ros::Publisher image_Pub;
ros::Publisher mask_Pub;

void show_out(astra_colorframe_t colorFrame)
{
    sensor_msgs::Image picture_msgs;

    astra_image_metadata_t metadata;
    astra_rgb_pixel_t* colorData_rgb;

    uint32_t colorByteLength;

    astra_colorframe_get_data_rgb_ptr(colorFrame, &colorData_rgb, &colorByteLength);

    astra_colorframe_get_metadata(colorFrame, &metadata);

    int width = metadata.width;
    int height = metadata.height;
    size_t index = ((width * (height / 2)) + (width / 2));

    astra_frame_index_t frameIndex;
    astra_colorframe_get_frameindex(colorFrame, &frameIndex);

    astra_rgb_pixel_t middle = colorData_rgb[index];
    printf("color frameIndex: %d  r: %d    g: %d    b: %d \n", frameIndex, (int)(middle.r), (int)(middle.g), (int)(middle.b));
    picture_msgs.header.seq = frameIndex;
    picture_msgs.height = metadata.height/2;
    picture_msgs.width = metadata.width/2;
    picture_msgs.encoding = "rgb8";
    picture_msgs.is_bigendian = 0;
    picture_msgs.step = picture_msgs.width * 3;
    picture_msgs.header.frame_id = "cam";
    for (int i = 0; i < metadata.height * metadata.width; i++)
    {
        if( i%2 == 1  || (int(i/640))%2 == 1) continue;

        picture_msgs.data.push_back(colorData_rgb[i].r);
        picture_msgs.data.push_back(colorData_rgb[i].g);
        picture_msgs.data.push_back(colorData_rgb[i].b);
    }

    image_Pub.publish(picture_msgs);
    
}



void astra_sdk_boy_mask(astra_bodyframe_t bodyFrame)
{

    skeleton_follow::astra_sdk_maskdata astra_mask_msgs;
    astra_bodymask_t bodyMask;

    const astra_status_t rc = astra_bodyframe_bodymask(bodyFrame, &bodyMask);
    if (rc != ASTRA_STATUS_SUCCESS)
    {
        printf("Error %d in astra_bodyframe_bodymask()\n", rc);
        return;
    }


    const int32_t centerIndex = bodyMask.width / 2 + bodyMask.width * bodyMask.height / 2;
    printf("Body mask: width: %d height: %d center value: %d\n",
        bodyMask.width,
        bodyMask.height,
        bodyMask.data[centerIndex]);
    int j = 0;
    for (int i = 0; i < bodyMask.height * bodyMask.width; i++)
    {
        if( i%2 == 1  || (int(i/640))%2 == 1) continue;
        astra_mask_msgs.data[j] = bodyMask.data[i];
        j++;
    }

    mask_Pub.publish(astra_mask_msgs);


}

void show_bodyframe_info(astra_bodyframe_t bodyFrame)
{
    astra_bodyframe_info_t info;

    const astra_status_t rc = astra_bodyframe_info(bodyFrame, &info);
    if (rc != ASTRA_STATUS_SUCCESS)
    {
        printf("Error %d in astra_bodyframe_info()\n", rc);
        return;
    }
    const int32_t width = info.width;
    const int32_t height = info.height;

    printf("BodyFrame info: Width: %d Height: %d\n",
        width,
        height);
}


void show_the_attitude(const int32_t bodyId, const astra_joint_t* joint)
{
    // jointType is one of ASTRA_JOINT_* which exists for each joint type
    const astra_joint_type_t jointType = joint->type;

    const astra_joint_status_t jointStatus = joint->status;

    const astra_vector3f_t* worldPos = &joint->worldPosition;

    const astra_vector2f_t* depthPos = &joint->depthPosition;

    printf("Body %u Joint %d status %d @ world (%.1f, %.1f, %.1f) depth (%.1f, %.1f)\n",
           bodyId,
           jointType,
           jointStatus,
           worldPos->x,
           worldPos->y,
           worldPos->z,
           depthPos->x,
           depthPos->y);
}


void show_body(astra_bodyframe_t bodyFrame)
{
    int i;
    astra_body_list_t bodyList;
    skeleton_follow::astra_sdk_bodynumber astra_sdk_bodylist_msg;
    const astra_status_t rc = astra_bodyframe_body_list(bodyFrame, &bodyList);
    if (rc != ASTRA_STATUS_SUCCESS)
    {
        printf("Error %d in astra_bodyframe_body_list()\n", rc);
        return;
    }
    astra_sdk_bodylist_msg.count = bodyList.count;
    for(i = 0; i < bodyList.count; ++i)
    {   

        astra_body_t* body = &bodyList.bodies[i];

        // Pixels in the body mask with the same value as bodyId are
        // from the same body.
        astra_sdk_bodylist_msg.bodies[i].bodyid = body->id;
        //printf("+++++++++++++++bodyId = %d\n", bodyId);
        const astra_vector3f_t* centerOfMass = &body->centerOfMass;
        astra_sdk_bodylist_msg.bodies[i].centerOfMass.x = centerOfMass->x;
        astra_sdk_bodylist_msg.bodies[i].centerOfMass.y = centerOfMass->y;
        astra_sdk_bodylist_msg.bodies[i].centerOfMass.z = centerOfMass->z;
        printf("+++++++++++++++++++++centerOfMass->z = %.1f\n", centerOfMass->z);
        for(int j = 0; j < 19; ++j)
        { 
          const astra_joint_t* joint = &body->joints[j];
          astra_sdk_bodylist_msg.bodies[i].joints[j].type = joint->type ;
          const astra_vector2f_t* depthPosition = &joint->depthPosition;
          astra_sdk_bodylist_msg.bodies[i].joints[j].depthPosition.x = depthPosition->x ;
          astra_sdk_bodylist_msg.bodies[i].joints[j].depthPosition.y = depthPosition->y ;
          const astra_vector3f_t* worldPosition = &joint->worldPosition;
          astra_sdk_bodylist_msg.bodies[i].joints[j].worldPosition.x = worldPosition->x ;
          astra_sdk_bodylist_msg.bodies[i].joints[j].worldPosition.y = worldPosition->y ;
          astra_sdk_bodylist_msg.bodies[i].joints[j].worldPosition.z = worldPosition->z ;
        }

    }
    bodylist_Pub.publish(astra_sdk_bodylist_msg);
}

void show_bodyframe(astra_bodyframe_t bodyFrame)
{

    astra_sdk_boy_mask(bodyFrame);

    show_body(bodyFrame);
}

int main(int argc, char* argv[])
{
    bool body_stream;
    bool rgb_stream;
    ros::init(argc, argv, "astra_sdk_demo"); 
    ros::NodeHandle node("~"); 
    node.param<bool>("rgb_stream", rgb_stream, false);
    node.param<bool>("body_stream", body_stream, true);
    set_key_handler();
    astra_initialize();
    const char* licenseString = "<INSERT LICENSE KEY HERE>";
    orbbec_body_tracking_set_license(licenseString);

    astra_streamsetconnection_t sensor;

    astra_streamset_open("device/default", &sensor);

    astra_reader_t reader;
    astra_reader_create(sensor, &reader);

    astra_bodystream_t bodyStream;
    astra_reader_get_bodystream(reader, &bodyStream);

    astra_depthstream_t colorStream;
    astra_reader_get_colorstream(reader, &colorStream);

    if (body_stream)
    {
        bodylist_Pub = node.advertise<skeleton_follow::astra_sdk_bodynumber>("/astra_sdk/bodynumber", 1);   
        mask_Pub = node.advertise<skeleton_follow::astra_sdk_maskdata>("/astra_sdk/mask", 1);
        astra_stream_start(bodyStream);
    }
    
    if (rgb_stream)
    {
        image_Pub = node.advertise<sensor_msgs::Image>("/astra_sdk/image", 1);
        astra_stream_start(colorStream);
    }
    do
    {
        astra_update();
        astra_reader_frame_t frame;
        astra_status_t rc = astra_reader_open_frame(reader, 0, &frame);

        if (rc == ASTRA_STATUS_SUCCESS)
        {
            if (body_stream)
            {
                astra_bodyframe_t bodyFrame;
                astra_frame_get_bodyframe(frame, &bodyFrame);

                astra_frame_index_t frameIndex;
                astra_bodyframe_get_frameindex(bodyFrame, &frameIndex);
                printf("Frame index: %d\n", frameIndex);

                show_bodyframe(bodyFrame);
            }
            printf("----------------------------\n");
            if (rgb_stream)
            {
                astra_colorframe_t colorFrame;
                astra_frame_get_colorframe(frame, &colorFrame);
                show_out(colorFrame);
            }
            astra_reader_close_frame(&frame);
        }

    } while (shouldContinue);

    astra_reader_destroy(&reader);
    astra_streamset_close(&sensor);

    astra_terminate();
}

// Generated by gencpp from file astra_camera/SetMirrorResponse.msg
// DO NOT EDIT!


#ifndef ASTRA_CAMERA_MESSAGE_SETMIRRORRESPONSE_H
#define ASTRA_CAMERA_MESSAGE_SETMIRRORRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace astra_camera
{
template <class ContainerAllocator>
struct SetMirrorResponse_
{
  typedef SetMirrorResponse_<ContainerAllocator> Type;

  SetMirrorResponse_()
    {
    }
  SetMirrorResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::astra_camera::SetMirrorResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::astra_camera::SetMirrorResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SetMirrorResponse_

typedef ::astra_camera::SetMirrorResponse_<std::allocator<void> > SetMirrorResponse;

typedef boost::shared_ptr< ::astra_camera::SetMirrorResponse > SetMirrorResponsePtr;
typedef boost::shared_ptr< ::astra_camera::SetMirrorResponse const> SetMirrorResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::astra_camera::SetMirrorResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace astra_camera

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::astra_camera::SetMirrorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::astra_camera::SetMirrorResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::astra_camera::SetMirrorResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::astra_camera::SetMirrorResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "astra_camera/SetMirrorResponse";
  }

  static const char* value(const ::astra_camera::SetMirrorResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::astra_camera::SetMirrorResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetMirrorResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::astra_camera::SetMirrorResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::astra_camera::SetMirrorResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // ASTRA_CAMERA_MESSAGE_SETMIRRORRESPONSE_H

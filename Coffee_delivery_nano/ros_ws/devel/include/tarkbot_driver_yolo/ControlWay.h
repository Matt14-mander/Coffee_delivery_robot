// Generated by gencpp from file tarkbot_driver_yolo/ControlWay.msg
// DO NOT EDIT!


#ifndef TARKBOT_DRIVER_YOLO_MESSAGE_CONTROLWAY_H
#define TARKBOT_DRIVER_YOLO_MESSAGE_CONTROLWAY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tarkbot_driver_yolo
{
template <class ContainerAllocator>
struct ControlWay_
{
  typedef ControlWay_<ContainerAllocator> Type;

  ControlWay_()
    : mask_x_left(0.0)
    , mask_x_right(0.0)
    , mask_y_top(0.0)
    , mask_y_bot(0.0)
    , center_target(0.0)
    , vel_x(0.0)
    , vel_y_P(0.0)
    , vel_y_D(0.0)
    , vel_z_P(0.0)
    , vel_z_D(0.0)
    , en(0)  {
    }
  ControlWay_(const ContainerAllocator& _alloc)
    : mask_x_left(0.0)
    , mask_x_right(0.0)
    , mask_y_top(0.0)
    , mask_y_bot(0.0)
    , center_target(0.0)
    , vel_x(0.0)
    , vel_y_P(0.0)
    , vel_y_D(0.0)
    , vel_z_P(0.0)
    , vel_z_D(0.0)
    , en(0)  {
  (void)_alloc;
    }



   typedef float _mask_x_left_type;
  _mask_x_left_type mask_x_left;

   typedef float _mask_x_right_type;
  _mask_x_right_type mask_x_right;

   typedef float _mask_y_top_type;
  _mask_y_top_type mask_y_top;

   typedef float _mask_y_bot_type;
  _mask_y_bot_type mask_y_bot;

   typedef float _center_target_type;
  _center_target_type center_target;

   typedef float _vel_x_type;
  _vel_x_type vel_x;

   typedef float _vel_y_P_type;
  _vel_y_P_type vel_y_P;

   typedef float _vel_y_D_type;
  _vel_y_D_type vel_y_D;

   typedef float _vel_z_P_type;
  _vel_z_P_type vel_z_P;

   typedef float _vel_z_D_type;
  _vel_z_D_type vel_z_D;

   typedef int8_t _en_type;
  _en_type en;





  typedef boost::shared_ptr< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> const> ConstPtr;

}; // struct ControlWay_

typedef ::tarkbot_driver_yolo::ControlWay_<std::allocator<void> > ControlWay;

typedef boost::shared_ptr< ::tarkbot_driver_yolo::ControlWay > ControlWayPtr;
typedef boost::shared_ptr< ::tarkbot_driver_yolo::ControlWay const> ControlWayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator1> & lhs, const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator2> & rhs)
{
  return lhs.mask_x_left == rhs.mask_x_left &&
    lhs.mask_x_right == rhs.mask_x_right &&
    lhs.mask_y_top == rhs.mask_y_top &&
    lhs.mask_y_bot == rhs.mask_y_bot &&
    lhs.center_target == rhs.center_target &&
    lhs.vel_x == rhs.vel_x &&
    lhs.vel_y_P == rhs.vel_y_P &&
    lhs.vel_y_D == rhs.vel_y_D &&
    lhs.vel_z_P == rhs.vel_z_P &&
    lhs.vel_z_D == rhs.vel_z_D &&
    lhs.en == rhs.en;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator1> & lhs, const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace tarkbot_driver_yolo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8c848fda070f270966c6dcd98dd08d58";
  }

  static const char* value(const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8c848fda070f2709ULL;
  static const uint64_t static_value2 = 0x66c6dcd98dd08d58ULL;
};

template<class ContainerAllocator>
struct DataType< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tarkbot_driver_yolo/ControlWay";
  }

  static const char* value(const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 mask_x_left\n"
"\n"
"float32 mask_x_right\n"
"\n"
"float32 mask_y_top\n"
"\n"
"float32 mask_y_bot\n"
"\n"
"float32 center_target\n"
"\n"
"float32 vel_x\n"
"\n"
"float32 vel_y_P\n"
"\n"
"float32 vel_y_D\n"
"\n"
"float32 vel_z_P\n"
"\n"
"float32 vel_z_D\n"
"\n"
"int8 en\n"
;
  }

  static const char* value(const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mask_x_left);
      stream.next(m.mask_x_right);
      stream.next(m.mask_y_top);
      stream.next(m.mask_y_bot);
      stream.next(m.center_target);
      stream.next(m.vel_x);
      stream.next(m.vel_y_P);
      stream.next(m.vel_y_D);
      stream.next(m.vel_z_P);
      stream.next(m.vel_z_D);
      stream.next(m.en);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ControlWay_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tarkbot_driver_yolo::ControlWay_<ContainerAllocator>& v)
  {
    s << indent << "mask_x_left: ";
    Printer<float>::stream(s, indent + "  ", v.mask_x_left);
    s << indent << "mask_x_right: ";
    Printer<float>::stream(s, indent + "  ", v.mask_x_right);
    s << indent << "mask_y_top: ";
    Printer<float>::stream(s, indent + "  ", v.mask_y_top);
    s << indent << "mask_y_bot: ";
    Printer<float>::stream(s, indent + "  ", v.mask_y_bot);
    s << indent << "center_target: ";
    Printer<float>::stream(s, indent + "  ", v.center_target);
    s << indent << "vel_x: ";
    Printer<float>::stream(s, indent + "  ", v.vel_x);
    s << indent << "vel_y_P: ";
    Printer<float>::stream(s, indent + "  ", v.vel_y_P);
    s << indent << "vel_y_D: ";
    Printer<float>::stream(s, indent + "  ", v.vel_y_D);
    s << indent << "vel_z_P: ";
    Printer<float>::stream(s, indent + "  ", v.vel_z_P);
    s << indent << "vel_z_D: ";
    Printer<float>::stream(s, indent + "  ", v.vel_z_D);
    s << indent << "en: ";
    Printer<int8_t>::stream(s, indent + "  ", v.en);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TARKBOT_DRIVER_YOLO_MESSAGE_CONTROLWAY_H

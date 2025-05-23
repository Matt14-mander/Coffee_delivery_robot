// Generated by gencpp from file skeleton_follow/astra_sdk_rgb.msg
// DO NOT EDIT!


#ifndef SKELETON_FOLLOW_MESSAGE_ASTRA_SDK_RGB_H
#define SKELETON_FOLLOW_MESSAGE_ASTRA_SDK_RGB_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace skeleton_follow
{
template <class ContainerAllocator>
struct astra_sdk_rgb_
{
  typedef astra_sdk_rgb_<ContainerAllocator> Type;

  astra_sdk_rgb_()
    : r(0)
    , g(0)
    , b(0)  {
    }
  astra_sdk_rgb_(const ContainerAllocator& _alloc)
    : r(0)
    , g(0)
    , b(0)  {
  (void)_alloc;
    }



   typedef uint8_t _r_type;
  _r_type r;

   typedef uint8_t _g_type;
  _g_type g;

   typedef uint8_t _b_type;
  _b_type b;





  typedef boost::shared_ptr< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> const> ConstPtr;

}; // struct astra_sdk_rgb_

typedef ::skeleton_follow::astra_sdk_rgb_<std::allocator<void> > astra_sdk_rgb;

typedef boost::shared_ptr< ::skeleton_follow::astra_sdk_rgb > astra_sdk_rgbPtr;
typedef boost::shared_ptr< ::skeleton_follow::astra_sdk_rgb const> astra_sdk_rgbConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator1> & lhs, const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator2> & rhs)
{
  return lhs.r == rhs.r &&
    lhs.g == rhs.g &&
    lhs.b == rhs.b;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator1> & lhs, const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace skeleton_follow

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
{
  static const char* value()
  {
    return "353891e354491c51aabe32df673fb446";
  }

  static const char* value(const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x353891e354491c51ULL;
  static const uint64_t static_value2 = 0xaabe32df673fb446ULL;
};

template<class ContainerAllocator>
struct DataType< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
{
  static const char* value()
  {
    return "skeleton_follow/astra_sdk_rgb";
  }

  static const char* value(const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 r\n"
"uint8 g\n"
"uint8 b\n"
;
  }

  static const char* value(const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.r);
      stream.next(m.g);
      stream.next(m.b);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct astra_sdk_rgb_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::skeleton_follow::astra_sdk_rgb_<ContainerAllocator>& v)
  {
    s << indent << "r: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.r);
    s << indent << "g: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.g);
    s << indent << "b: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.b);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SKELETON_FOLLOW_MESSAGE_ASTRA_SDK_RGB_H

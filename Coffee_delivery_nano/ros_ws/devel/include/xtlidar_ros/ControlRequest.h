// Generated by gencpp from file xtlidar_ros/ControlRequest.msg
// DO NOT EDIT!


#ifndef XTLIDAR_ROS_MESSAGE_CONTROLREQUEST_H
#define XTLIDAR_ROS_MESSAGE_CONTROLREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace xtlidar_ros
{
template <class ContainerAllocator>
struct ControlRequest_
{
  typedef ControlRequest_<ContainerAllocator> Type;

  ControlRequest_()
    : index(0)  {
    }
  ControlRequest_(const ContainerAllocator& _alloc)
    : index(0)  {
  (void)_alloc;
    }



   typedef int64_t _index_type;
  _index_type index;





  typedef boost::shared_ptr< ::xtlidar_ros::ControlRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::xtlidar_ros::ControlRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ControlRequest_

typedef ::xtlidar_ros::ControlRequest_<std::allocator<void> > ControlRequest;

typedef boost::shared_ptr< ::xtlidar_ros::ControlRequest > ControlRequestPtr;
typedef boost::shared_ptr< ::xtlidar_ros::ControlRequest const> ControlRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::xtlidar_ros::ControlRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::xtlidar_ros::ControlRequest_<ContainerAllocator1> & lhs, const ::xtlidar_ros::ControlRequest_<ContainerAllocator2> & rhs)
{
  return lhs.index == rhs.index;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::xtlidar_ros::ControlRequest_<ContainerAllocator1> & lhs, const ::xtlidar_ros::ControlRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace xtlidar_ros

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::xtlidar_ros::ControlRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::xtlidar_ros::ControlRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xtlidar_ros::ControlRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6a92c772b35d41f76733d8eb9779b0e1";
  }

  static const char* value(const ::xtlidar_ros::ControlRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6a92c772b35d41f7ULL;
  static const uint64_t static_value2 = 0x6733d8eb9779b0e1ULL;
};

template<class ContainerAllocator>
struct DataType< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "xtlidar_ros/ControlRequest";
  }

  static const char* value(const ::xtlidar_ros::ControlRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 index\n"
;
  }

  static const char* value(const ::xtlidar_ros::ControlRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.index);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ControlRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::xtlidar_ros::ControlRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::xtlidar_ros::ControlRequest_<ContainerAllocator>& v)
  {
    s << indent << "index: ";
    Printer<int64_t>::stream(s, indent + "  ", v.index);
  }
};

} // namespace message_operations
} // namespace ros

#endif // XTLIDAR_ROS_MESSAGE_CONTROLREQUEST_H

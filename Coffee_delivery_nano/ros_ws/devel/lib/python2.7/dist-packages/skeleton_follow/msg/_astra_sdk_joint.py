# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from skeleton_follow/astra_sdk_joint.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import skeleton_follow.msg

class astra_sdk_joint(genpy.Message):
  _md5sum = "e4de40bc4d9da2df315d3755d4261051"
  _type = "skeleton_follow/astra_sdk_joint"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int8 type
astra_sdk_vector2f depthPosition
astra_sdk_vector3f worldPosition
================================================================================
MSG: skeleton_follow/astra_sdk_vector2f
float32 x
float32 y
================================================================================
MSG: skeleton_follow/astra_sdk_vector3f
float32 x
float32 y
float32 z"""
  __slots__ = ['type','depthPosition','worldPosition']
  _slot_types = ['int8','skeleton_follow/astra_sdk_vector2f','skeleton_follow/astra_sdk_vector3f']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       type,depthPosition,worldPosition

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(astra_sdk_joint, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.type is None:
        self.type = 0
      if self.depthPosition is None:
        self.depthPosition = skeleton_follow.msg.astra_sdk_vector2f()
      if self.worldPosition is None:
        self.worldPosition = skeleton_follow.msg.astra_sdk_vector3f()
    else:
      self.type = 0
      self.depthPosition = skeleton_follow.msg.astra_sdk_vector2f()
      self.worldPosition = skeleton_follow.msg.astra_sdk_vector3f()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_b5f().pack(_x.type, _x.depthPosition.x, _x.depthPosition.y, _x.worldPosition.x, _x.worldPosition.y, _x.worldPosition.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.depthPosition is None:
        self.depthPosition = skeleton_follow.msg.astra_sdk_vector2f()
      if self.worldPosition is None:
        self.worldPosition = skeleton_follow.msg.astra_sdk_vector3f()
      end = 0
      _x = self
      start = end
      end += 21
      (_x.type, _x.depthPosition.x, _x.depthPosition.y, _x.worldPosition.x, _x.worldPosition.y, _x.worldPosition.z,) = _get_struct_b5f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_b5f().pack(_x.type, _x.depthPosition.x, _x.depthPosition.y, _x.worldPosition.x, _x.worldPosition.y, _x.worldPosition.z))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.depthPosition is None:
        self.depthPosition = skeleton_follow.msg.astra_sdk_vector2f()
      if self.worldPosition is None:
        self.worldPosition = skeleton_follow.msg.astra_sdk_vector3f()
      end = 0
      _x = self
      start = end
      end += 21
      (_x.type, _x.depthPosition.x, _x.depthPosition.y, _x.worldPosition.x, _x.worldPosition.y, _x.worldPosition.z,) = _get_struct_b5f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_b5f = None
def _get_struct_b5f():
    global _struct_b5f
    if _struct_b5f is None:
        _struct_b5f = struct.Struct("<b5f")
    return _struct_b5f

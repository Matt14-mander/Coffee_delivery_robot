# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tarkbot_yolov5/ObjectArray.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy
import tarkbot_yolov5.msg

class ObjectArray(genpy.Message):
  _md5sum = "5c74c52b301e4b25679f3941c4f6f23f"
  _type = "tarkbot_yolov5/ObjectArray"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """tarkbot_yolov5/Object[] data

================================================================================
MSG: tarkbot_yolov5/Object
string frame_id
time stamp
float32 scores
float32 ptx
float32 pty
float32 distw
float32 disth
float32 centerx
float32 centery
"""
  __slots__ = ['data']
  _slot_types = ['tarkbot_yolov5/Object[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       data

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ObjectArray, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.data is None:
        self.data = []
    else:
      self.data = []

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
      length = len(self.data)
      buff.write(_struct_I.pack(length))
      for val1 in self.data:
        _x = val1.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _v1 = val1.stamp
        _x = _v1
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = val1
        buff.write(_get_struct_7f().pack(_x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery))
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
      if self.data is None:
        self.data = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.data = []
      for i in range(0, length):
        val1 = tarkbot_yolov5.msg.Object()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.frame_id = str[start:end]
        _v2 = val1.stamp
        _x = _v2
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        _x = val1
        start = end
        end += 28
        (_x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery,) = _get_struct_7f().unpack(str[start:end])
        self.data.append(val1)
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
      length = len(self.data)
      buff.write(_struct_I.pack(length))
      for val1 in self.data:
        _x = val1.frame_id
        length = len(_x)
        if python3 or type(_x) == unicode:
          _x = _x.encode('utf-8')
          length = len(_x)
        buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
        _v3 = val1.stamp
        _x = _v3
        buff.write(_get_struct_2I().pack(_x.secs, _x.nsecs))
        _x = val1
        buff.write(_get_struct_7f().pack(_x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery))
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
      if self.data is None:
        self.data = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.data = []
      for i in range(0, length):
        val1 = tarkbot_yolov5.msg.Object()
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1.frame_id = str[start:end].decode('utf-8', 'rosmsg')
        else:
          val1.frame_id = str[start:end]
        _v4 = val1.stamp
        _x = _v4
        start = end
        end += 8
        (_x.secs, _x.nsecs,) = _get_struct_2I().unpack(str[start:end])
        _x = val1
        start = end
        end += 28
        (_x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery,) = _get_struct_7f().unpack(str[start:end])
        self.data.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I = None
def _get_struct_2I():
    global _struct_2I
    if _struct_2I is None:
        _struct_2I = struct.Struct("<2I")
    return _struct_2I
_struct_7f = None
def _get_struct_7f():
    global _struct_7f
    if _struct_7f is None:
        _struct_7f = struct.Struct("<7f")
    return _struct_7f

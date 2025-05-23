# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from tarkbot_yolov5/Object.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import genpy

class Object(genpy.Message):
  _md5sum = "ed563213df8d0c63d0090b5a0b306f53"
  _type = "tarkbot_yolov5/Object"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """string frame_id
time stamp
float32 scores
float32 ptx
float32 pty
float32 distw
float32 disth
float32 centerx
float32 centery
"""
  __slots__ = ['frame_id','stamp','scores','ptx','pty','distw','disth','centerx','centery']
  _slot_types = ['string','time','float32','float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       frame_id,stamp,scores,ptx,pty,distw,disth,centerx,centery

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Object, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.frame_id is None:
        self.frame_id = ''
      if self.stamp is None:
        self.stamp = genpy.Time()
      if self.scores is None:
        self.scores = 0.
      if self.ptx is None:
        self.ptx = 0.
      if self.pty is None:
        self.pty = 0.
      if self.distw is None:
        self.distw = 0.
      if self.disth is None:
        self.disth = 0.
      if self.centerx is None:
        self.centerx = 0.
      if self.centery is None:
        self.centery = 0.
    else:
      self.frame_id = ''
      self.stamp = genpy.Time()
      self.scores = 0.
      self.ptx = 0.
      self.pty = 0.
      self.distw = 0.
      self.disth = 0.
      self.centerx = 0.
      self.centery = 0.

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
      _x = self.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I7f().pack(_x.stamp.secs, _x.stamp.nsecs, _x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery))
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
      if self.stamp is None:
        self.stamp = genpy.Time()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.frame_id = str[start:end]
      _x = self
      start = end
      end += 36
      (_x.stamp.secs, _x.stamp.nsecs, _x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery,) = _get_struct_2I7f().unpack(str[start:end])
      self.stamp.canon()
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
      _x = self.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_2I7f().pack(_x.stamp.secs, _x.stamp.nsecs, _x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery))
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
      if self.stamp is None:
        self.stamp = genpy.Time()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.frame_id = str[start:end]
      _x = self
      start = end
      end += 36
      (_x.stamp.secs, _x.stamp.nsecs, _x.scores, _x.ptx, _x.pty, _x.distw, _x.disth, _x.centerx, _x.centery,) = _get_struct_2I7f().unpack(str[start:end])
      self.stamp.canon()
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2I7f = None
def _get_struct_2I7f():
    global _struct_2I7f
    if _struct_2I7f is None:
        _struct_2I7f = struct.Struct("<2I7f")
    return _struct_2I7f

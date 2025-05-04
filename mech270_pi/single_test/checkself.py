from pymycobot import MechArm270
from pymycobot import PI_PORT, PI_BAUD

mc = MechArm270(PI_PORT, PI_BAUD)
# mc = MechArm270('/dev/ttyAMA0', 1000000)

print(mc.get_system_version())
print(mc.is_controller_connected())
print(mc.get_angles())
print(mc.get_coords())

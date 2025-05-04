from pymycobot import MechArm270
from pymycobot import PI_PORT, PI_BAUD

mc = MechArm270(PI_PORT, PI_BAUD)

print('放松机械臂关节')
mc.release_all_servos()
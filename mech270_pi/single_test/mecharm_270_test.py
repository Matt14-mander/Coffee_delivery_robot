# 示例
from pymycobot import MechArm270

mc = MechArm270('/dev/ttyAMA0', 1000000)

# 获取所有关节当前的角度
angles = mc.get_angles()
print(angles)

# 将 1关节移动到 40，速度设置为 20
mc.send_angle(1, 40, 20)


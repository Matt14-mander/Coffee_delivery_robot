import pygame
import sys
import time
from pymycobot import MechArm270

mc = MechArm270('/dev/ttyAMA0', 1000000)
init_angles=[0, -74, 27, 2.5, 42, -8]
mc.send_angles(init_angles,50)
pygame.init()
pygame.joystick.init()
button_pressed = False
hat_pressed=False
previous_state = [0,0,0,0,0,0] 

def joy_handler():
    global button_pressed
    global hat_pressed
    global previous_state
    if event.type == pygame.JOYAXISMOTION:
        axis = event.axis  
        value = round(event.value, 2)  
        if abs(value) > 0.1:  
            flag = True
            previous_state[axis] = value  
            if axis==0 and value==-1.00:
                mc.jog_coord(2,1,10)
            elif axis==0 and value==1.00:
                mc.jog_coord(2,0,10)
            if axis==1 and value==1.00:
                mc.jog_coord(1,0,10)
            elif axis==1 and value==-1.00:
                mc.jog_coord(1,1,10)
            if axis==2 and value==1.00:
                mc.jog_angle(6,0,10)
            elif axis==2 and value==-1.00:
                mc.jog_angle(6,1,10)                    
            if axis==3 and value==1.00:
                mc.jog_coord(3,0,10)
            elif axis==3 and value==-1.00:
                mc.jog_coord(3,1,10)
        else:
            if previous_state[axis] != 0:
                mc.stop()
                mc.stop()
                mc.stop()

                previous_state[axis] = 0  

    if event.type == pygame.JOYBUTTONDOWN:
        if joystick.get_button(3)==1:
            mc.set_gripper_state(0,100)
        if joystick.get_button(0)==1:
            mc.set_gripper_state(1,100)

    if event.type == pygame.JOYHATMOTION:
        hat_value = joystick.get_hat(0) 
        if hat_value ==(0,-1):
            mc.jog_angle(5,0,10)
        elif hat_value ==(0,1):
            mc.jog_angle(5,1,10)
        elif hat_value ==(-1,0):
            mc.jog_angle(4,1,10)
        elif hat_value ==(1,0):
            mc.jog_angle(4,0,10)
        if hat_value != (0, 0):
            hat_pressed = True
        else:
            if hat_pressed: 
                mc.stop()
                mc.stop()
                mc.stop()
                hat_pressed = False  

if pygame.joystick.get_count() > 0:
    joystick = pygame.joystick.Joystick(0) 
    joystick.init()
else:
    print("没有检测到手柄")
    pygame.quit()
    sys.exit()
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False       
        joy_handler()
pygame.quit()
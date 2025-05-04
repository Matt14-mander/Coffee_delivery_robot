import sys
import os
sys.path.append(os.path.dirname(__file__))
from pymycobot import MechArm270

if __name__ == "__main__":
    mc = MechArm270('/dev/ttyAMA0', 1000000)
    _sp = input('Please input speed(0-100):')
    try:
        sp = int(_sp)
    except Exception:
        print('Error: invalid speed, speed is default: 80')
        sp = 80

    while not False:
        coords_str = input('Please input coords, like ("175,0,238.7,-178.02,87.44,-177.76"):')
        try:
            coords_str_l = coords_str.split(',')
            if len(coords_str_l) != 6:
                raise Exception('')
            coords = [float(i) for i in coords_str_l]
        except Exception:
            print('Error: invalid coords string.')
            continue

        mc.send_coords(coords, sp)


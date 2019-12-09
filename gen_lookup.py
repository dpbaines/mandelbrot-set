import colorsys
import re
import math

f = open("colour_lookup", "w")

def hsv2rgb(h,s,v):
    return tuple(round(i * 255) for i in colorsys.hsv_to_rgb(h,s,v))

for i in range(512):

    a = 0.0117
    b = 190
    x1 = -b*math.exp(-a*i)+b
    
    norm = i/512
    value = hsv2rgb(norm, 1, 1)
    binvalue = re.split('b', bin(i))[1].zfill(9)

    rgb = hsv2rgb(norm, 1, 1)
    bit4 = tuple(  ("4'b" + re.split('b', bin(math.floor(t/16)) )[1].zfill(4)) for t in rgb)

    f.write("9'b"+ binvalue+ ": {red_r, green_r, blue_r} = {"+ bit4[0]+ ", "+ bit4[1]+ ", "+ bit4[2]+ "};\n")
    print('9b'+ binvalue+ ": {red_r, green_r, blue_r} = {"+ bit4[0]+ ", "+ bit4[1]+ ", "+ bit4[2]+ "};")
	
f.close()
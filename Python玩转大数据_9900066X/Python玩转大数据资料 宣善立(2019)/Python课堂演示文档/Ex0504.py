# -*- coding:utf-8 -*-
# EX0504.py

import math

fp = open("sinlist.dat","w+")


for i in range(360):
    fp.write(str(math.sin(i * math.pi / 180))+'\n')

x = eval(input('输入角度：'))

x = int(x) % 360

fp.seek(0)
y  = fp.readlines()

fy = float(y[x])
print('sin({:2d}) = {:>6.5f}'.format(x,fy))

fp.close()




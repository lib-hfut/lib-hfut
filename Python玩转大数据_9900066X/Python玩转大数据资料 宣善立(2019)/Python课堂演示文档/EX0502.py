# -*- coding:utf-8 -*-
# EX0501.py

fName = input('请输入文件名：')

fp = open(fName,"r")

for fLine in fp.readlines():
    print(fLine)

fp.close()

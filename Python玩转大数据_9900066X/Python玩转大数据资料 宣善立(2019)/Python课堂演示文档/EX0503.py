# -*- coding:utf-8 -*-
# EX0503.py

fName = input('请输入文件名：')

fp = open(fName,"w+")
lst = ['我本将心向明月,','\n','奈何明月照沟渠。']
fp.writelines(lst)

#fp.seek(0)
for line in fp:
   print(line)

fp.close()

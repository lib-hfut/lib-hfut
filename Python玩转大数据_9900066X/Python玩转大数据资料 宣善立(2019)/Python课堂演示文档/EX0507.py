# -*- coding:utf-8 -*-
#EX0507.py

import json
fIn = open("price2016.csv", "r")
ls = []
for line in fIn:
    line = line.replace("\n","")
    ls.append(line.split(','))
fIn.close()
#print(ls)
fOut = open("price2016.json", "w")
for i in range(1,len(ls)):
    ls[i] = dict(zip(ls[0], ls[i]))
    #print(ls[i])
json.dump(ls[1:],fOut, indent=4,)
fOut.close()

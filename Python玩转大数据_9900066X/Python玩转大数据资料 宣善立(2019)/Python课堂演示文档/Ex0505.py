# -*- coding:utf-8 -*-
# EX0505.py

def getData(fpd):
    lst = []
    for line in fpd:
        line = line.replace("\n"," ")
        lst.append(line.split(','))
    return lst
try:
    fp = open("price2016.csv","r")
    lst = getData(fp)
    for ls in lst:
        print(ls)
    fp.close()
except:
    print("File open error!")

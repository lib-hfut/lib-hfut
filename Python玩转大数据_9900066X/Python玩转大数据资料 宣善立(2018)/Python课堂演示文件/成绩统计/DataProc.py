# -*- coding:utf-8 -*-
#This is a Python program proc. data

import pandas as Pd
import numpy as NuP
import matplotlib.pyplot as Plt

import xlwt as ExWr
import os

DataEx = Pd.read_excel("成绩.xlsx")
#print(DataEx)
#Pre Processing data

#print(DataEx)
DataEx = DataEx.dropna(axis=0)
#print(DataEx)

lstTotalScore = list()
lstFinalTest = list(DataEx[u'期末考试'])
lstNomTest = list(DataEx[u'课堂测试'])
lstWorkTest = list(DataEx[u'作业撰写'])

Num = len(lstFinalTest)
for i in range(Num):
    lstTotalScore.append(0.5 *  lstFinalTest[i] + 0.3 * lstNomTest[i] + 0.2 * lstWorkTest[i])
#print(lstTotalScore)

#insert colunm
DataEx.insert(5,"总分",lstTotalScore,allow_duplicates= False)

fTMax = max(lstTotalScore)
print("最高分 = ",format(fTMax,"7.0f"))
fMin = min(lstTotalScore)
print("\n最低分 = ",format(fMin,"7.0f"))
print("\n分距 = ",format(fTMax - fMin,"7.0f"))

lstfMean = list(DataEx.mean())
lstfMean.pop(0)
print(lstfMean)
print("\n均值 = ",format(lstfMean[0],"7.0f"))


lstfStd = list(DataEx.std())
print("\n标准差 = ",format(lstfStd[1],"7.0f"))

DataEx = DataEx.sort_values(by="总分",ascending = False)
print(DataEx)

x = range(Num)
y1 = lstTotalScore
y2 = lstFinalTest
y3 = lstNomTest
y4 = lstWorkTest

Plt.plot(x,y1,'b--',label = "总分")
Plt.plot(x,y2,'r--',label = "期末")
Plt.plot(x,y3,'g--',label = "测验")
Plt.plot(x,y3,'y--',label = "作业")
Plt.show()

Fig = Plt.figure()
DFig = Fig.add_subplot(111)

DFig.set_title("Data scatter")
DFig.set_xlabel('ID')
DFig.set_ylabel('Score')

DFig.scatter(x,y1,c = 'r',marker='*')
DFig.scatter(x,y2,c = 'b',marker='.')
DFig.scatter(x,y3,c = 'g',marker='.')
Plt.show()

Plt.hist(y1,100)
Plt.show()

'''
#Statics
lstStaSeg = list([0,0,0,0,0])
lstStaName = ['<60','60~69','70~79','80~89','90~100']
lstSize = []
for i in range(Num):
    if lstTotalScore[i] < 60:
        lstStaSeg[0] += 1
    elif lstTotalScore[i] <70:
        lstStaSeg[1] += 1
    elif lstTotalScore[i] <80:
        lstStaSeg[2] += 1
    elif lstTotalScore[i] <90:
        lstStaSeg[3] += 1
    else:
        lstStaSeg[4] += 1
#end of for

for i in range(5):
    lstStaSeg[i] = lstStaSeg[i] * 100 / Num
#end of for

colors =['red','yellow','pink','green','blue']
explode = [0,0,0.1,0,0]

Plt.pie(lstStaSeg,explode = explode,labels=lstStaName,colors = colors,autopct='%1.1f%%',shadow= True,startangle=90)
Plt.axis('equal')
Plt.show()
'''
#Write to Excel
OutEx = ExWr.Workbook()
Table = OutEx.add_sheet(u"统计表")

lstStID = list(DataEx[u"学号"])

Table.write(0,0,u"学号")
Table.write(0,1,u"期末考试")
Table.write(0,2,u"课堂测验")
Table.write(0,3,u"作业撰写")
Table.write(0,4,u"总分")

i = 1
for x in lstStID:
    Table.write(i,0,lstStID[i-1])
    Table.write(i,1,lstFinalTest[i-1])
    Table.write(i,2, lstNomTest[i - 1])
    Table.write(i,3, lstWorkTest[i - 1])
    Table.write(i,4, lstTotalScore[i - 1])
    i = i + 1
Table.write(i,0,"平均分")
Table.write(i,4,lstfMean[0])


OutEx.save(r"x.xls")
#Save .csv
Out = open("x1.csv","wt")

for i in range(Num):
    strLine = str(lstStID[i])+','+str(lstTotalScore[i])+ '\n'
    Out.write(strLine)
Out.close()

# -*- coding:utf-8 -*-
#Demo of spider

import requests as myReq
from bs4 import  BeautifulSoup as myBSoup
import re
import pandas as myPd
import numpy  as myNp
import xlwt as myExWr
import matplotlib.pyplot as myPlt

#City Name list
cityNames = ['北京','上海','广州','深圳','拉萨','西宁','昆明','武汉','长春','唐山','成都','乌鲁木齐','合肥','宣城']
dataPdF = myPd.DataFrame
#for cityName in cityNames:
OutEx = myExWr.Workbook()
Table = OutEx.add_sheet(u"环境质量表")
Table.write(0,0,u"城市")
Table.write(0,1,u"日期时间")
Table.write(0,2,u"测试点")
Table.write(0,3,u"AQI")
Table.write(0,4,u"空气质量")
Table.write(0,5,u"首要污染物")
Table.write(0,6,u"PM2.5")
Table.write(0,7,u"PM10")
Table.write(0,8,u"CO")
Table.write(0,9,u"NO2")
Table.write(0,10,u"O3/h")
Table.write(0,11,u"SO2")
i = 1
for cityName in cityNames:
    LiWeb = myReq.get('http://www.pm25.in/'+cityName)
    #conect to URL "http://www.pm25.in"
    strData = LiWeb.text
    pMData = re.findall('<td>(.*?)</td>',strData,re.S)
    #print(pMData)
    timeDate = re.findall('\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}',strData,re.S)
    print(timeDate)
    lstCityData = []
    lstCityData.append(cityName)
    lstCityData.append(timeDate[0])
    lstCityData.append(pMData[0:10])
    Table.write(i,0,cityName)
    Table.write(i,1,timeDate[0])
    for j in range(10):
        Table.write(i,2+j,pMData[j])
    i += 1
    print(lstCityData)
    #print(pMData)
    #print(timeDate)
OutEx.save(r"D:\resource\Pm2.xls")
DataEx = myPd.read_excel("D:\\resource\\Pm2.xls")
DataEx = DataEx.replace('_','0.0')

print(DataEx)

myPlt.figure(figsize=(14,10))
myPlt.rcParams['font.family'] = 'SimHei'
myPlt.rcParams['font.sans-serif'] = ['SimHei']
myPlt.title('城市PM2.5')
myPlt.xlabel('城市')
myPlt.ylabel('PM2.5含量')
myPlt.stem(range(14),DataEx['PM2.5'],'-')
myPlt.xticks(range(14),['北京','上海','广州','深圳','拉萨','西宁','昆明','武汉','长春','唐山','成都','乌鲁木齐','合肥','宣城'])

myPlt.show()



#MySoup = BeautifulSoup(LiWeb.text,"html.parser")
#   print(LiWeb.status_code)
#   print(LiWeb.encoding)
#   LiWeb.encoding = 'utf-8'
#   print(LiWeb.encoding)

#print(strData)
#print(MySoup.p)






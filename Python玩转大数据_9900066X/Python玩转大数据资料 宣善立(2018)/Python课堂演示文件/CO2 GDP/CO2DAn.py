#CO2 & GDP Data analysis Figure
#-*- coding: utf-8 -*-

import  pandas as Pd
import matplotlib.pyplot as Plt
import numpy as Np
import  xlwt as ExWr
import os
import math


#Read Source data
ExDataCo2 = Pd.read_excel(r"HisCo2.xls")
ExDataGDP = Pd.read_excel(r"HisGDP.xlsx")
#print(ExData)
ExDataCo2 = ExDataCo2.fillna(0)

lstCHNCO2 =list(ExDataCo2.iloc[41,:])
lstUSACO2 = list(ExDataCo2.iloc[252,:])
lstEUCO2 = list(ExDataCo2.iloc[74,:])
lstJPNCO2 = list(ExDataCo2.iloc[120,:])

lstCHNGDP = list(ExDataGDP.iloc[74])
lstCHNGDP = lstCHNGDP[4:]

lstUSAGDP = list(ExDataGDP.iloc[237])
lstUSAGDP = lstUSAGDP[4:]

lstEUGDP = list(ExDataGDP.iloc[8])
lstEUGDP = lstEUGDP[4:]

lstJPNGDP = list(ExDataGDP.iloc[129])
lstJPNGDP = lstJPNGDP[4:]

#lstUSAGDP = list(ExDataGDP)


lstCHNGDP.pop()
lstUSAGDP.pop()
lstEUGDP.pop()
lstJPNGDP.pop()


print(lstUSAGDP)

lstCHNCO2 = lstCHNCO2[4:]
lstUSACO2 = lstUSACO2[4:]
lstEUCO2 = lstEUCO2[4:]
lstJPNCO2 = lstJPNCO2[4:]


while lstUSACO2[-1] == 0:
    lstUSACO2.pop()
    lstCHNCO2.pop()
    lstEUCO2.pop()
    lstJPNCO2.pop()


#lgBase = 10
for i in range(len(lstCHNGDP)):
    lstCHNGDP[i] /= 1e6#math.log(lstCHNGDP[i],lgBase)
    lstUSAGDP[i] /= 1e6 #math.log(lstUSAGDP[i],lgBase)
    lstEUGDP[i]  /= 1e6 #math.log(lstEUGDP[i],lgBase)
    lstJPNGDP[i] /= 1e6#math.log(lstJPNGDP[i],lgBase)

    #lstCHNCO2[i] = math.log(lstCHNCO2[i], lgBase)
    #lstUSACO2[i] = math.log(lstUSACO2[i], lgBase)
    #lstEUCO2[i] = math.log(lstEUCO2[i],lgBase)
    #lstJPNCO2[i] = math.log(lstJPNCO2[i],lgBase)


Num = len(lstUSACO2)
#print(Num)

Plt.figure(figsize=(14,10))
Plt.rcParams['font.family'] = 'SimHei'
Plt.rcParams['font.sans-serif'] = ['SimHei']

Plt.title('二氧化碳排放&GDP表')
Plt.xlabel('年份')
Plt.ylabel('CO2及GDP')


lstYear = list(range(1960,1960+Num))
#print(lstYear)

x = lstYear
yCHNCo2 = lstCHNCO2
yUSACo2 = lstUSACO2
yEUCo2 = lstEUCO2
yJPNCo2 = lstJPNCO2

yCHNGdp = lstCHNGDP
yUSAGdp = lstUSAGDP
yEUGdp = lstEUGDP
yJPNGdp = lstJPNGDP

Plt.plot(x, yCHNCo2, 'r', label="中国")
Plt.plot(x, yCHNGdp, 'r--', label="CHNGDP")

Plt.plot(x, yUSACo2, 'b', label="美国")
Plt.plot(x, yUSAGdp, 'b--', label="USAGDP")

Plt.plot(x, yEUCo2, 'g', label="欧盟")
Plt.plot(x, yEUGdp, 'g--', label="EUGDP")

Plt.plot(x, yJPNCo2, 'y', label="日本")
Plt.plot(x, yJPNGdp, 'y--', label="JPGDP")

Plt.legend()
Plt.savefig(r'Co2chn.jpg')
Plt.show()



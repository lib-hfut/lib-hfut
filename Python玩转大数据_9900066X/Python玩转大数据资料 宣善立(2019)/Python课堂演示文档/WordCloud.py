# -*- coding:utf-8 -*-

import requests as Req
from bs4 import  BeautifulSoup as BSoup
import re as Re
import matplotlib.pyplot as Plt
import jieba as Jb
from wordcloud import WordCloud as WCloud
from wordcloud import ImageColorGenerator as ImgCG
from PIL import Image
import numpy as Np

URL = 'http://www.gov.cn/zhuanti/2018lh/2018zfgzbg/zfgzbg.htm'

#connect to URL
URLObj = Req.get(URL)
URLObj.encoding = 'utf-8'
strData = URLObj.text

#myData = Re.findall(r'<p style="text-indent: 2em; font-family: 宋体; font-size: 12pt;">(.*?)</p>',strData,Re.S | Re.M)
#print(myData)

mySoup = BSoup(strData,"html.parser")
SData = mySoup.find_all('p')

lstData = []

for p in SData:
    if len(p) == 0:
        continue
    else:
        lstData.append(p.string)

ProData = [str for str in lstData if str not in ['',' ',None]]

print(ProData)

TData = ''.join(ProData)

JbText = Jb.lcut(TData)
JbDict = "/".join(JbText)
#print(JbDict)

myImg = Plt.imread(r'd:\resource\timg11.jpg')

myWordCloud = WCloud(font_path=r"D:\resource\FZXKTJW.ttf", 
    background_color='white',max_font_size=100,max_words=2000,
    mask = myImg)
myWordCloud.generate(JbDict)

myImg_color = ImgCG(myImg)
myWordCloud.recolor(color_func = myImg_color)

myWordCloud.to_file(r"D:\resource\Wcdemo.png")

Plt.figure("词云图",figsize=(8,6))
Plt.imshow(myWordCloud)
Plt.axis("off")
Plt.show()




# -*- coding:utf-8 -*-
# EX0501.py

textFile = open(r"d:\resource\EX0501s.txt","rt")  #t表示文本文件方式
print(textFile.readline())
textFile.close()
binFile = open(r"d:\resource\EX0501s.txt","rb")   #r表示二进制文件方式
print(binFile.readline())
binFile.close()

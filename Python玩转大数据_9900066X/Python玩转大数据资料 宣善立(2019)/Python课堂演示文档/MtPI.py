from random import random
from math import sqrt
from time import clock
import turtle as myTu

n = int(input("请输入十进制整数量级:"))

darts = 10 ** n

hits = 0

myTu.bgcolor("white")

myTu.speed(10)
myTu.hideturtle()

myTu.penup()

myTu.goto(-250,-250)
myTu.pencolor("red")
myTu.pensize(2)
myTu.pendown()

myTu.goto(250,-250)
myTu.goto(250,250)
myTu.goto(-250,250)
myTu.goto(-250,-250)
myTu.penup()
myTu.goto(-250,250)
myTu.pendown()

myTu.circle(-500,90)

myTu.penup()
myTu.goto(-155,270)

myTu.write(u"蒙特卡罗法计算圆周率",font = ("Times",24,"bold"))

start = clock()
for i in range(1, darts):
    x, y = random(), random()
    myTu.penup()
    myTu.goto(500*x-250, 500*y-250)
    dist = sqrt(x ** 2 + y ** 2)

    if dist <= 1.0:
        hits = hits + 1
        myTu.dot("blue")
    else:
       myTu.dot("pink")

pi = 4 * hits / darts

myTu.pencolor("gray")
myTu.goto(260,0)
myTu.write('PI = {:<7.2f}'.format(pi),font = ("Times",16,"bold"))
myTu.goto(260,-20)

myTu.write('Time = {:<5.2f}'.format(clock()- start) ,font = ("Times",16,"bold"))

print(pi)


myTu.done()



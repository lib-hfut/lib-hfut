from random import random
from math import sqrt
from time import clock
import turtle

n = int(input("请输入十进制整数量级:"))

darts = 10 ** n
hits = 0
clock()
turtle.bgcolor("black")
turtle.pencolor("black")
turtle.speed(0)
turtle.hideturtle()
for i in range(1, darts):
    x, y = random(), random()
    turtle.penup()
    turtle.goto(500*x-250, 500*y-250)
    dist = sqrt(x ** 2 + y ** 2)

    if dist <= 1.0:
        hits = hits + 1
        turtle.dot("blue")
    else:
        turtle.dot("white")

pi = 4 * hits / darts
print(pi)

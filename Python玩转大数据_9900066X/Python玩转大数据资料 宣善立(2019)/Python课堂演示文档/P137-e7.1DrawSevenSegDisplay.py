#e7.1SevenSegDisplay.py
import turtle
import datetime

def drawLine(draw):   #绘制单段数码管
    '''Draw one Segment'''
    turtle.pendown() if draw else turtle.penup()
    turtle.fd(40)
    turtle.right(90)

def drawDigit(digit): #根据数字绘制七段数码管
    '''Draw seven Segment'''
    drawLine(True) if digit in [2,3,4,5,6,8,9] else drawLine(False)
    drawLine(True) if digit in [0,1,3,4,5,6,7,8,9] else drawLine(False)
    drawLine(True) if digit in [0,2,3,5,6,8,9] else drawLine(False)
    drawLine(True) if digit in [0,2,6,8] else drawLine(False)
    turtle.left(90)
    drawLine(True) if digit in [0,4,5,6,8,9] else drawLine(False)
    drawLine(True) if digit in [0,2,3,5,6,7,8,9] else drawLine(False)
    drawLine(True) if digit in [0,1,2,3,4,7,8,9] else drawLine(False)
    turtle.left(180)
    turtle.penup()
    turtle.fd(30)

def drawDate(date):  #获得要输出的数字
    for i in date:
        drawDigit(eval(i))  #注意: 通过eval()函数将数字变为整数

def main():
    turtle.setup(800, 350, 200, 200)#width=800,height=800, startx=100, starty=100
    turtle.penup()
    turtle.fd(-300)
    turtle.pensize(7)
    turtle.pencolor("red")
    drawDate(datetime.datetime.now().strftime('%Y%m%d'))
    turtle.hideturtle()
    turtle.done()

main()

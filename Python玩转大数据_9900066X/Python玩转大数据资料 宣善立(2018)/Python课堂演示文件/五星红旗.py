import turtle
import math

#移动到国旗的左上角
turtle.up()
turtle.goto(-300,200)
turtle.down()

#绘制国旗的红色背景矩形
turtle.color("red")
turtle.begin_fill()
turtle.forward(600)
turtle.right(90)
turtle.forward(400)
turtle.right(90)
turtle.forward(600)
turtle.right(90)
turtle.forward(400)
turtle.end_fill()

#定义绘制星星的函数
def drawstar(x,y,r,angle):
    #x,y是星星的中心点的横坐标和纵坐标
    #r是五角星外接圆的半径
    #angle是五角星尖角的朝向
    turtle.up()
    turtle.goto(x,y)
    turtle.setheading(angle)
    turtle.fd(r)
    turtle.down()
    #求五角星的边长
    l=r*math.sin(math.radians(36))/math.sin(math.radians(126))
    #正式绘制五角星
    turtle.begin_fill()
    turtle.right(180-18)
    for i in [1,2,3,4,5]:
        turtle.fd(l)
        turtle.left(72)
        turtle.fd(l)
        turtle.right(144)
    turtle.end_fill()

#绘制中央的大星星
turtle.color("yellow")
drawstar(-200,100,60,90)

#绘制周围的小星星
drawstar(-100,160,20,math.degrees(math.atan(-60/-100))+180)
drawstar(-60,120,20,math.degrees(math.atan(-20/-140))+180)
drawstar(-60,60,20,math.degrees(math.atan(40/-140))+180)
drawstar(-100,20,20,math.degrees(math.atan(80/-100))+180)

#绘制完毕
turtle.hideturtle()
turtle.done()

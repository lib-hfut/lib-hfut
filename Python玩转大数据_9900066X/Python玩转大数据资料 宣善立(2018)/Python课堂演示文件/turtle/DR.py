import turtle
import time

t = turtle.Pen()
t.pensize(2)
turtle.bgcolor("black")
turtle.speed("fastest")
sides = 8
colors = ["red", "yellow","purple","blue"]
for x in range(100):
    t.color(colors[x % 4])
    t.forward(x * 3 / sides + x)
    t.left(360 / sides + 1)
    t.width(x * sides/ 200)
time.sleep(30)
turtle.mainloop()

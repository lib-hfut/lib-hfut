#Class Demo

from CircleFromGeometricObject import Circle
from RectangleFromGeometricObject import Rectangle
from GeometricObject import GeometricObject

def main():
    myC1 = Circle(2)
    myR1 = Rectangle(2,3)
    print(myC1.getArea())
    print(myR1.getColor())
    myC1.setColor("green")
    print(myC1.getColor())
    print(myR1.getColor())
#end of main

if __name__ == '__main__':
    main()
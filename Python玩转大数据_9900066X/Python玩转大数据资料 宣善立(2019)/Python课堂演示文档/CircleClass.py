#define class

import math

class Circle:
    __classname = 'Circle'
    def __init__(self,radius = 1):
        self.__radius = radius

    def getPerimeter(self):
        return 2.0 * self.__radius * math.pi

    def getArea(self):
        return self.__radius * self.__radius * math.pi

#end of class

#This py is a solution of quadratic
import cmath
import math
import sys


def get_float(msg, allow_zero):
    x = None
    while x is None:
        try:
            x = float(input(msg))
            if not allow_zero and abs(x) < sys.float_info.epsilon:
                print('Zero is not allowed!')
                x = None
        except ValueError as err:
            print(err)
    return x
#end of get_float

print("ax\N{SUPERSCRIPT TWO} + bx + c = 0")
a = get_float('Enter a:',False)
b = get_float('Enter b:',True)
c = get_float('Enter c:',True)

dis = b * b - 4 * a * c

if dis == 0:
    x1 = -b/(2.0 * a)
else:
    if dis > 0:
        root = math.sqrt(dis)
    else:
        root = cmath.sqrt(dis)

    x1 = (-b + root)/(2 * a)
    x2 = (-b - root)/(2 * a)

equation = ("{0}x\N{SUPERSCRIPT TWO} + {1}x + {2} = 0""\N{RIGHTWARDS ARROW}x = {3}" ).format(a,b,c,x1)
if x2 is not None:
    equation += "or x = {0}".format(x2)
print(equation)

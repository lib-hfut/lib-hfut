# CH3ex2

def Fact(n):
    if n == 0 or n == 1:
        return 1
    return (n * Fact(n - 1))
#end of Fact

m = eval(input('Input a integer:'))
fact = Fact(m)
print('{0:>5d}! = {1:^30,d}'.format(m,fact))
    

def isPrime(n):
    ''' Test argument n is a prime'''
    for j in range(2,n // 2 + 1):
        if n %  j == 0:
            return False
    else:
        return True
#end of isPrime

a = eval(input("Input a integer:"))
if isPrime(a):
    print("{0:^5d}is a prime!\n".format(a))
else:
    print("{0:^5d}is not a prime!\n".format(a))
    


        

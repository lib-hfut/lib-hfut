import math

def isPrime(n):
    h = math.sqrt(float(n))
    for i in range(2,int(h) + 1):
        if n % i == 0:
            return False
    else:
        return True
#end of isPrime

def isPalindrome(n):
    m = 0
    k = n
    while k > 0:
        m = m * 10 + k % 10
        k //= 10
    if m == n:
        return True
    else:
        return False
#end of isPalindrome

i = 0
n = 2
while i <= 100:
    if isPalindrome(n) and isPrime(n):
        i += 1
        print(n)
    n += 1
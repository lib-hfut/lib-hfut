#e10.2CalHamlet.py
excludes = {"the","and","of","you","a","i","my","in"}

def getText():
    txt = open("hamlet.txt", "r").read()
    txt = txt.lower()
    for ch in '!"#$%&()*+,-./:;<=>?@[\\]^_‘{|}~':
        txt = txt.replace(ch, " ")   #将文本中特殊字符替换为空格
    return txt
#end of getText

hamletTxt = getText()
print(type(hamletTxt))

words  = hamletTxt.split()
print(words)

counts = {}
for word in words:			
    counts[word] = counts.get(word,0) + 1
for word in excludes:
    del(counts[word])    
items = list(counts.items())
items.sort(key=lambda x:x[1], reverse=True) 
for i in range(10):
    word, count = items[i]
    print ("{0:<10}{1:>5}".format(word, count))

#分析小说中汉字出现率最多的前20个
fname=input("请输入文件名：")
f1=open(fname,'r',encoding="utf-8").read()
for ch in ' ，。“‘’”：！、《》；？　」「…":':
    f1=f1.replace(ch,"")
f1=f1.replace("\n","")
words={}
for w in f1:
    words[w]=words.get(w,0)+1
its=list(words.items())
its.sort(key=lambda x:x[1],reverse=True)
for i in range(10):
    word,count=its[i]
    print("{0:<10}{1:>5}".format(word,count))


    

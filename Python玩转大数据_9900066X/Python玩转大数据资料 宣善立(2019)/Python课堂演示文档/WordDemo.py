#--coding utf-8 -- 

import jieba

txt = open('d:\\resource\\说剑.txt','r',encoding = 'utf-8').read()

words =  jieba.lcut(txt)


print(words)

dic={}
exp={'的','了','“','”','在','对','。','!','?','」','「','…','<','>'}

keys=set(words)-exp

for i in keys:
    if len(i)>1:
        dic[i]=words.count(i)
wa=list(dic.items())
wa.sort(key=lambda x:x[1],reverse=True)

print ('字符\t词频')
print ('=============')
for i in range(20):
    print(wa[i])

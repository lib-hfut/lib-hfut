#----- file name EX0201.py ----------

Height,Weight = eval(input(u'请以,分隔输入身高（m）和体重（kg）：'))

BMI = Weight / (Height * Height)

if BMI < 18.5:
    IntStr = '偏瘦'
elif BMI < 25:
    IntStr = '正常'
elif BMI < 30:
    IntStr = '偏胖'
else:
    IntStr = '肥胖'
if BMI < 18.5:
    CivStr = '偏瘦'
elif BMI < 24:
    CivStr = '正常'
elif BMI < 28:
    CivtStr = '偏胖'
else:
    CivStr = '肥胖'

print("外国人BMI指标：{0}\n中国人BMI指标：{1}\n".format(IntStr,CivStr))

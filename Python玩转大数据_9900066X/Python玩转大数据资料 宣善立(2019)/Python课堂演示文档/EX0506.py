#EX0506.py

fIn = open("price2016.csv", "r")
fOut = open("price2016out.csv", "w")

ls = []
for line in fIn:
    line = line.replace("\n","")
    ls.append(line.split(","))
print(ls)
for i in range(len(ls)):
    for j in range(len(ls[i])):
        if ls[i][j].replace(".","").isnumeric():
            ls[i][j] = "{:.2}%".format(float(ls[i][j])/100)

for row in ls:
    print(row)
    fOut.write(",".join(row)+"\n")

fIn.close()
fOut.close()

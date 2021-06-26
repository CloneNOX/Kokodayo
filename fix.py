file = []
count = 1
with open('databaseInit.sql', "r") as f:
    lines = f.readlines()
    for l in lines:
        if '.png' in l:
            l1 = l[0:-4]
            lChange = l1 + str(count) + "),\n"
            file.append(lChange)
            count += 1
        else:
            file.append(l)

with open('test.sql', "w") as f:
    for l in file:
        f.write(l)
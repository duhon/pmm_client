#!/bin/bash

result=0
while  [ $result == 0 ]; do
	sleep 10
	pmm-admin uninstall
	echo -e "\nWaiting PMM Server: pmm_server"
	pmm-admin config --server pmm_server
	if [ $? == 0 ]; then result=1; fi
	
done

while  [ $result == 1 ]; do	
	echo -e "\nWaiting PMM Server sync: pmm_server"
	pmm-admin add mysql --host db
	if [ $? == 0 ]; then result=0; fi
	sleep 10
done
tail -f /dev/null
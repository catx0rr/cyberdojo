#!/bin/bash

ip_addr=172.16.10.100

function scan_port
{

	top10=(20 21 22 23 25 80 110 139 443 445 3389)

	# scan the arraylist and redirect to tcp check if ports are opened

	for i in "${top10[@]}"; do (echo > /dev/tcp/$ip_addr/"$i") \
	> /dev/null 2>&1 && echo "Port is open: $i" \
	|| echo "Port is closed: $i" ; done
}

function main
{
	scan_port
}

main

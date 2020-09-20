#!/bin/bash

subnet="172.16.10"

function scan_hosts_ports
{
	top10=(20 21 22 23 25 80 110 139 443 445 3389)

	for i in $(seq 1 254); do
		for port in "${top10[@]}"; do
			(echo > /dev/tcp/"$subnet.$i/$port") > /dev/null 2>&1 \
			&& echo "Host $subnet.$i has $port open" || \
			echo "Host $subnet.$i has $port closed" &
		done
	done
}

function main
{
	scan_hosts_ports
}

main

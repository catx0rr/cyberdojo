#!/bin/bash

# Etner network address then sweep the network

function read_input
{
	read -p "Enter Network Address: " addr

	if [[ $addr =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		NET=$(echo $addr | cut -d'.' -f1-3)

	else
		read_input
	fi
}

function ping_sweep
{
	echo -e "Scanning for live hosts.."
	for i in {1..254}; do ping -c1 $NET.$i | tr \\n ' ' | awk '/1 received/ {print $2}' & done
}

function main
{
	read_input
	ping_sweep
}

main

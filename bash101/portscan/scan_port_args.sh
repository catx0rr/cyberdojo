#!/bin/bash

usage='
./scan_port_args.sh [ip] [startport] [endport]

EX: ./scan_port_args.sh 10.10.10.1 1 1000
'

ip=$1
start=$2
end=$3

function check_args
{
	if [ -z "$1" ] && [ -z "$2" ] && [ -z "$3" ]; then
		echo "$usage"
		exit 1
	fi
}

function scan_port_args
{
	for i in $(seq $start $end) ; do (echo > /dev/tcp/$ip/"$i") \
	> /dev/null 2>&1 && echo "Port is open: $i" \
	|| echo "Port is closed: $i"; done
}

function main
{
	check_args
	scan_port_args
}

main

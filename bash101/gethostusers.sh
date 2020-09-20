#!/bin/bash

function get_host_users
{
	echo -e "Fetching passwd info..\n"
	cat /etc/passwd | grep -e '[0-9]\{4\}:[0-9]\{4\}' \
	| awk -F: '{print "(user)="$1 " (uid)="$3 " (guid)="$4}'
}

function main 
{
    get_host_users
}

main

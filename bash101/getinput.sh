#!/bin/bash

function get_input
{
	read -p "Enter Your Name: " username

	if [[ $username != 'War' ]]; then
		echo "Exiting.. shell script."
	else 
		echo "Welcome $username"
	fi
}

function main 
{
	get_input
}

main

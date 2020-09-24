#!/bin/bash

#
#
#	╦═╗┌─┐┌─┐┌─┐┌┐┌ ┌─┐┬ ┬
#	╠╦╝├┤ │  │ ││││ └─┐├─┤
#	╩╚═└─┘└─┘└─┘┘└┘o└─┘┴ ┴
#
# | CyberDojo |
#
# Author: catx0rr 
# Github: https://github.com/catx0rr/cyberdojo/tree/master/recon.sh
#
# Disclaimer: 
#	This script is for educational purposes only. Use at your own discretion
#	I cannot be held responsilbe for any damages caused. Usage of these tools 
#	to attack sites, networks, domain is illegal without mutual consent.
#	I have no liability for any misuse. 
#
#
#

path=$(dirname `which $0`)

. $path/src/bnr
. $path/src/lib
. $path/src/proc
. $path/conf/enum.conf


function main
{
	show_banner
	show_menu
}

main

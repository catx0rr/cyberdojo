#!/bin/bash

function get_info 
{
    echo -e " Hostname: $(hostname)\n \
IP Address: $(ifconfig | grep inet | head -n1 | awk -F' ' '{print $2}')\n \
Operating System:$(hostnamectl | grep "Operating System" | cut -d':' -f2)\n \
Kernel:$(hostnamectl | grep Kernel | cut -d':' -f2)\n \
Architecture:$(hostnamectl | grep Architecture | cut -d':' -f2)"
}

function main 
{
  get_info
}

main


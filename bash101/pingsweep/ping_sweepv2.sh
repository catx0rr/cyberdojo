#!/bin/bash

#Find the IP address and sweep the subnet for live hosts

NETWORK=$(ifconfig | grep -o -e '[0-9]\{1,3\}\.[0-9]\{1,3\}.[0-9]\{1,3\}' | head -n1)

function ping_sweep
{
        echo -e "Scanning for live hosts.."
        for i in {1..254}; do ping -c 1 $NETWORK.$i | tr \\n ' ' | awk '/1 received/ {print $2}' & done
}

function main
{
        ping_sweep
}

main

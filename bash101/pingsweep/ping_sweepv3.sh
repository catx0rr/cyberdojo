#!/bin/bash

# Get the IP address, sweep the network and option to save in a file

function get_host_ip
{
        # first network interface
        IP=$(ifconfig | grep -o -e '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -n1)
        echo -e "Fetching IP address..

IP Address: $IP\n"
        sleep 1
        NETWORK=$(echo $IP | cut -d'.' -f1-3)
}


function ping_sweep
{
        echo -e "Scanning for live hosts.."
        for i in {1..254}; do ping -c 1 $NETWORK.$i | tr \\n ' ' | awk '/1 received/ {print $2}' & done
}

function save_to_file
{
        echo
        read -p "Do you want to save the scan result?(y/N): " opt

        case $opt in
                [yY][eE][sS]|[Yy])
                        read -p "Enter output file name: " name
                        ping_sweep 2>&1 >> $name.txt
                        exit 0
                        ;;

                [nN][oO]|[nN])
                        echo "Exiting script.."
                        exit 0
                        ;;
                *)
                        save_to_file
                        ;;
        esac
}

function main
{
        get_host_ip
        ping_sweep
        save_to_file
}

main

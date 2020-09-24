#!/bin/bash

function get_domain
{
	read -p "Target Domain: " dom

	if [[ $dom =~ ^([A-Za-z0-9_-])+(\.[A-Za-z]{2,5})+(\.[A-Za-z]{2,5})?$ ]]; then
		DOM=$dom
	else
		get_domain
	fi
}

function download_index
{
	mkdir -p one-for-all/$DOM
	wget $DOM -O one-for-all/$DOM/$DOM.html -q
}

function get_subdomain_ips
{
	# Subdomains
	echo -e "\nSubdomains:"
	grep -o '[A-Za-z0-9_\.-]'*$DOM one-for-all/$DOM/$DOM.html | sort -u \
	| tee -a one-for-all/$DOM/subdomains.$DOM.txt

	# Subdomain host IPs
	echo -e "\nIP Addresses:"
	for url in $(cat one-for-all/$DOM/subdomains.$DOM.txt); do host $url; done \
	| grep "has address " | awk '{print $4}'| sort -u \
	| tee -a one-for-all/$DOM/ipadd.$DOM.txt
}

function main
{
	get_domain
	download_index
	get_subdomain_ips
}

main

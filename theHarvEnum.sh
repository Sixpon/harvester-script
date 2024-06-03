#!/bin/bash

#get-target-url
read -p "TARGET URL: " target

#check-directory
if [ -d "$target" ]; then
	echo "$target directory does exist, no need to create new."
else
	mkdir $target
	echo "created $target directory for output."

fi


#harvester-sources
sources=(
    "anubis" "baidu" "bevigil" "binaryedge" "bing" "bingapi"
    "bufferoverun" "censys" "certspotter"
    "criminalip" "crtsh" "dnsdumpster" "duckduckgo"
    "fullhunt" "github-code" "hackertarget" "hunter"
    "hunterhow" "intelx" "netlas" "onyphe" "otx"
    "pentesttools" "projectdiscovery" "rapiddns"
    "rocketreach" "securityTrails" "sitedossier"
    "subdomaincenter" "subdomainfinderc99" "threatminer"
    "tomba" "urlscan" "virustotal" "yahoo" "zoomeye"
)

for i in "${sources[@]}"; do
    echo "Running: theHarvester -d \"$target\" -b \"$i\" -f \"${i}_${target}\""
    theHarvester -d "$target" -b "$i" -f "${target}/${i}_${target}"
done

#!/bin/bash


for pid in $(ps -axo pid)
do
    file="/proc/"$pid"/status"
    
    memory=$(awk '$1=="VmSize:"{ print $2 }' $file)
    echo "ProcessID:$pid : Memory:$memory"
    
done | sort -n -t ":" -k4 | tail -n 1



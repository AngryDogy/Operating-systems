#!/bin/bash

begin_data=()
end_data=()
pids=()
cmdline=()
for pid in $(ps -axo pid)
do
    file1="/proc/$pid/io"
    file2="/proc/$pid/cmdline"
    if [[ -r $file1 ]]
    then
	begin_data[$pid]=$(awk '$1=="rchar:"{print $2}' $file1)
	cmdline[$pid]=$(awk '{print $0}' $file2 | tr -d '\0')
	pids[$pid]=$pid
    fi

done
sleep 5

for pid in "${pids[@]}"
do
    file1="/proc/$pid/io"
    end_data[$pid]=$(awk '$1=="rchar:"{print $2}' $file1)
    
done
for pid in "${pids[@]}"
do
    diff=$(echo "${end_data[$pid]} - ${begin_data[$pid]}" | bc)
    echo "Pid:$pid : $diff : ${cmdline[$pid]}"
    
done | sort -n -t ":" -k3 | tail -n 3
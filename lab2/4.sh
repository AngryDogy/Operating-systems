#!/bin/bash
output="4out"

for pid in $(ps -axo pid)
do
    file1="/proc/"$pid"/status"
    file2="/proc/"$pid"/sched"
    ppid=$(awk '$1=="PPid:"{print $2}' $file1)
    sum_exec_runtime=$(awk '$1=="se.sum_exec_runtime"{print $3}' $file2)
    nr_switches=$(awk '$1=="nr_switches"{print $3}' $file2)
    av_run_time=$(bc <<< "scale=5;$sum_exec_runtime/$nr_switches" | sed -e 's/^\./0./' -e 's/^-\./-0./')
    echo "ProcessID:$pid : Parent_ProcessID:$ppid : Average_Sleeping_Time:$av_run_time"
    
done | sort -n -t ":" -k4 > $output
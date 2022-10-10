#!/bin/bash
#ps -elf | awk '$2=="Z"{ print $4 }'
data=()
data=$(ps -elf | awk '$2=="Z"{print $5}')
for pid in ${data[@]}
do
    kill $pid
    echo "$pid was killed!"
done
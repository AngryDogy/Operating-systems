#!/bin/bash
reportPath="/home/angrydog/os/lab5/report.log"
if [[ -f $reportPath ]]
then
    touch $reportPath
fi
> $reportPath
i=0
arr=()
while true; do
    for (( val=0; val<10; val++ ))
    do
        arr+=($val)
    done
    let i=$i+1
    if (( $i % 100000 == 0 )); then
        echo "Array size: ${#arr[*]}" >> $reportPath
    fi

done
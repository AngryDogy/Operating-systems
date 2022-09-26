#!/bin/bash
ar=($1 $2 $3)
max=${ar[0]}
for i in ${ar[@]}
do
    if [[ $max -lt $i ]]
    then
	max=$i
    fi
done
echo $max
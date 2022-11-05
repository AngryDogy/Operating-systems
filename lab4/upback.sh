#!/bin/bash
user="angrydog"
restore="/home/$user/restore"
currentDate=$(date +'%Y-%m-%d')
currentDir="-"
minDiff=10000000
mapfile -t dirs <<< "$(find /home/angrydog -name "Backup-****-**-**" -type d | awk '{print $0}')"

for (( i = 0; i < ${#dirs[@]}; i++)); do
    date=$(echo ${dirs[$i]} | cut -c23-32)
    diff=$(( ($(date -d $currentDate +%s) - $(date -d $date +%s)) / 86400 ))
    if [[ $diff -lt $minDiff  ]]
    then
        minDiff=$diff
        currentDir=${dirs[$i]}
    fi
done
editedFiles=()
cd $currentDir
for file in $(ls *.****-**-**)
do
    editedFiles+=($file)
    echo $file
done
for file in $(ls)
do
    ignore="false"
    for check in ${editedFiles[@]}; do
        if [[ $file == $check ]]
        then
            ignore="true"
        fi
    done
    if [[ $ignore == "false" ]]
    then
        cp "$currentDir/$file" $restore
    fi
done
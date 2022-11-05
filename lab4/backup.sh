#!/bin/bash
currentDate=$(date +'%Y-%m-%d')
user=angrydog
mapfile -t dirs <<< "$(find /home/angrydog -name "Backup-****-**-**" -type d | awk '{print $0}')"
currentDir="-"
report="/home/$user/backup-report"
source="/home/$user/source"
if [[ ! -f $report ]] 
then
    touch $report
fi
for (( i = 0; i < ${#dirs[@]}; i++)); do
    date=$(echo ${dirs[$i]} | cut -c23-32)
    diff=$(( ($(date -d $currentDate +%s) - $(date -d $date +%s)) / 86400 ))
    if [[ $diff -le 7  ]]
    then
        currentDir=${dirs[$i]}
    fi
done
if [[ $currentDir == "-" ]]
then
    mkdir "/home/$user/Backup-$currentDate"
    currentDir="/home/$user/Backup-$currentDate"
    echo "A new backup directory was created: $currentDir ; Date: $(date)" >> $report
    echo "Files which were copied: " >> $report
    for file in $(ls $source)
    do
        path="$source/$file"
        cp $path "$currentDir/$file"
        echo $path >> $report
    done
    echo "End" >> $report
else
    newFiles=()
    editedFiles=()
    editedNewNames=()
    check="-"
    for file in $(ls $source)
    do
        path="$source/$file"
        if [[ -f "$currentDir/$file" ]]
        then
            weight=$(wc -c $path | awk '{print $1}')
            weightCopy=$(wc -c "$currentDir/$file" | awk '{print $1}')
            if [[ $weight -ne $weightCopy ]]
            then
                mv "$currentDir/$file" "$currentDir/$file.$currentDate"
                cp $path "$currentDir/$file"
                editedFiles+=("$path")
                editedNewNames+=("$currentDir/$file.$currentDate")
                check="+"

            fi
        else
            check="+"
            newFiles+=($path)
        fi
    done
    if [[ $check == "+" ]]
    then
        echo "Directory $currentDir was changed ; Date: $(date)" >> $report
        for i in ${newFiles[@]}; do
            echo $i >> $report
        done
        for (( i = 0; i < ${#editedFiles[@]}; i++)); do
            echo "${editedFiles[$i]} ${editedNewNames[$i]}" >> $report
        done
    fi
fi 
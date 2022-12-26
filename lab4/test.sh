#!/bin/bash
user="angrydog"
restore="/home/$user/restore"
rm /home/$user/restore/*
mapfile -t dirs <<< "$(find /home/angrydog -name "Backup-****-**-**" -type d | awk '{print $0}')"
for dir in ${dirs[@]}; do
    cd $dir
    dirName=$(echo $dir | awk -F/ '{print $4}' )
    editedFiles=()
    for file in $(ls *.****-**-**)
    do
        editedFiles+=($file)
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
            cp "$dir/$file" "$restore/$file.$dirName"
        fi
    done
     
done
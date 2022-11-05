#!/bin/bash
filename=$1
mapfile -t logpaths <<< "$(cat /home/angrydog/trash.log | grep "$filename" | awk '{print $7}')"
mapfile -t loglinks <<< "$(cat /home/angrydog/trash.log | grep "$filename" | awk '{print $15}')"
for (( i = 0; i < ${#logpaths[@]}; i++)); do
    if [[ ! -f "/home/angrydog/.trash/${loglinks[$i]}" ]]
    then
        continue
    fi
    echo "File path: ${logpaths[$i]}"
    read -p "Do you want to recover this file (y/n)?" choice
    case "$choice" in 
         y|Y ) 
                directory=$(dirname ${logpaths[$i]})
                if [[ ! -d "$directory" ]]
                then
                    echo "The previous directory doens't exist! The file will be recovered in the home directory!"
                    directory="/home/angrydog"
                fi
                wayToRecover="$directory/$filename"
                if [[ -f $wayToRecover ]]
                then
                    read -p "Another file already has this name in the directory! Please choose another name: " name
                    filename=$name
                    wayToRecover="$directory/$filename"
                fi
                ln -P "/home/angrydog/.trash/${loglinks[$i]}" $wayToRecover
                rm "/home/angrydog/.trash/${loglinks[$i]}"
         ;;
        n|N ) echo .
         ;;
        * ) echo "invalid";;
    esac
done

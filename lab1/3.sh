#!/bin/bash
PS3="Please enter your choice: "
options=("Nano" "Vi" "Links" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Nano")
	    nano
	    break
	    ;;
	"Vi")
	    vi
	    ;;
	"Links")
	    links
	    break
	    ;;
	"Quit")
	    echo "Quit"
	    break
	    ;;
	*) echo "Invalid option";;
    esac
done

#!/bin/bash

while true; do
    val=$(ps -A --format pid,pcpu | awk '
    BEGIN{

        sum = 0
    }
    {
         if ($2 != "%CPU")
        {
            sum = sum + $2
        }
    }
    END{
        print sum
    }
    ')
    echo $val
    result=$(echo $val | awk '{
        if ($0 >= 50.0)
        {
            print 1
        }
        else
        {
            print 0
        }
    }')
    if [[ $result == "1" ]]
    then
        pid=$(ps -A --format pid,pcpu --sort=pcpu | tail -n 1 | awk '{print $1}')
        ni=$(ps -A --format pid,pcpu,ni --sort=pcpu | tail -n 1 | awk '{print $3}')
        let newNi=$ni+1
        sudo renice $newNi -p $pid
        echo "Priority of process $pid was decreased to $newNi"        
    fi
done
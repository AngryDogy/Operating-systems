#!/bin/bash
file=$1
awk 'BEGIN{} {line[NR]=$0} END{
    for (i = NR; i > 0; i = i - 1)
    {
	print line[i]
    }
	    
}' $file | rev



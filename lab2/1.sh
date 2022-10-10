#!/bin/bash
output="1out"
ps a -u angrydog --format pid,command | awk '$1!="PID"{print $1":"$2}' | wc -l > $output
ps a -u angrydog --format pid,command | awk '$1!="PID"{print $1":"$2}' >> $output

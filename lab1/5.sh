#!/bin/bash
path="/var/log/syslog"
file="info.log"
touch $file
awk '$6 == "<info>" {print}' $path > $file

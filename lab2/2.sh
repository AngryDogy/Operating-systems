#!/bin/bash
output="2out"
ps -A --format pid,command | grep "/sbin/" | awk '{print $1}' > $output
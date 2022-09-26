#!/bin/bash
path="/etc/passwd"
awk -F: '{print $3, $1}' $path | sort -n
#!/bin/bash
ps -A --format pid,start_time --sort=start_time | tail -n 1
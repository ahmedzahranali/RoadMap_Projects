#!/bin/bash

for cmd in top free df ps awk; do
	if ! command -v "$cmd" $> /dev/null; then
		echo "CRITICAL: Required command '$cmd' is not installed."
		exit 1
	fi
done

cpu_usage=$(top -bn1 2> /dev/null | grep -i '^%cpu' | awk '{print 100 - $8 }')
mem_usage=$(free -m 2> /dev/null | grep -i 'Mem:' | awk '{printf "Free: %sMB / Used: %sMB (%.2f%%)", $4, $3, ($3/$2)*100 }')
disk_usage=$(df -h / 2> /dev/null | awk 'NR==2 {printf "Free: %sB / Used %sB %s", $4, $3, $5 }')
cpu_most=$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu 2> /dev/null | head -n 6)
mem_most=$(ps -eo pid,ppid,cmd,%mem --sort=-%mem 2> /dev/null | head -n 6)

printf "\n===================================\n"
printf "        SERVER PERFORMANCE STATS    \n"
printf "===================================\n"

printf "%-20s %s%%\n" "Total CPU Usage:" "$cpu_usage"
printf "%-20s %s\n" "Memory Details:" "$mem_usage"
printf "%-20s %s\n\n" "Disk Details:" "$disk_usage"
printf "%s\n" "----Top_5_processes by cpu----"; printf "%s\n\n" "$cpu_most"
printf "%s\n" "----Top_5_processes by mem----"; printf "%s\n\n" "$mem_most"

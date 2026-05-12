#!/bin/bash

log_file=$1

if [ "$#" -eq 0 ]; then
	echo "Error: you must provide a log file to analyze!"
	echo "Usage: ./nginx_log_analyser.sh <path_to_log_file>"
	exit 1
fi

if [ ! -f "$log_file" ]; then
	echo "Error: the file '$log_file' does not exist!"
	exit 1
fi

ip_top5=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -rn | head -n 5)
path_top5=$(awk '{print $7}' "$log_file" | sort | uniq -c | sort -rn | head -n 5)
status_top5=$(awk '{print $9}' "$log_file" | sort | uniq -c | sort -rn | head -n 5)
agent_top5=$(awk -F '"' '{print $6}' "$log_file" | sort | uniq -c | sort -rn | head -n 5)


printf "\nThe_top_5_IPs.\n%s\n" "${ip_top5}"
printf "\nThe_top_5_requested_paths.\n%s\n" "${path_top5}"
printf "\nThe_top_5_response_status_codes.\n%s\n" "${status_top5}"
printf "\nThe_top_5_user_agents.\n%s\n" "${agent_top5}"

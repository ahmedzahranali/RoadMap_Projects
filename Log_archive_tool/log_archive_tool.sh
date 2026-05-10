#!/bin/bash

log_directory=$1

if [ "$#" -eq 0 ]; then
	echo "Error: You must provide a log directory!"
	echo "Usage: ./log_archive_tool <name>"
	exit 1
fi

if [ ! -d "$log_directory" ]; then
	echo "Error: That folder does not exist!"
	exit 1
fi

time_stamp=$(date +%Y%m%d_%H%M%S)

archive_dir="${log_directory}/archive"

mkdir -p ${archive_dir}

archive_name=${archive_dir}/logs_archive_${time_stamp}.tar.gz

tar -czvf ${archive_name} ${log_directory}

echo "Archived the directory ${log_directory} on ${time_stamp} with the name of ${archive_name}." >> ${archive_dir}/archive_log.txt

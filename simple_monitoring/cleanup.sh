#!/bin/bash


if [ "$EUID" -ne 0 ]; then
	echo "Error cleanup requires root privilages."
	echo "Usage: sudo ./cleanup.sh"
	exit 1
fi

echo "Starting netdata teardown process..."

UNINSTALLER="/opt/netdata/usr/libexec/netdata/netdata-uninstaller.sh"

if [ -f "$UNINSTALLER" ]; then
	echo "Removing netdata."
	$UNINSTALLER --yes --env /opt/netdata/etc/netdata/.environment

	echo "netdata service removed."
else
	echo "Uninstaller not found, netdata may already be removed."

	if [ -d "/opt/netdata" ]; then
		echo "Removing remaining /opt/netdata directory..."
		rm -rf /opt/netdata
	fi
fi


echo "Sweeping up unused OS dependencies..."
apt-get autoremove -y > /dev/null

echo "Your system is completely clean."
exit 0

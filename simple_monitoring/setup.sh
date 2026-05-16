#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Error: this script must be ran with sudo or as root."
	echo "Usage: sudo ./setup.sh"
	exit 1
fi

MONITORING_PORT=19999

PORT_CHECK=$(sudo ss -tlnp | grep -w ":$MONITORING_PORT")

if [ -n "$PORT_CHECK" ]; then
        echo "Error port $MONITORING_PORT is already in use."
        PROCESS_NAME=$(echo "$PORT_CHECK" | grep -oP '(?<=").*(?=")')
        echo "Detected process: $PROCESS_NAME"

        echo "Please stop this process or change the port in this script before continuing."
        exit 1
fi

echo "Root privileges confirmed, Proceeding with the installation..." 


if command -v netdata &> /dev/null; then
	echo "Netdata is already installed, Skipping installation."
else
	echo "Netdata not found, Starting installation..."
	wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh 
	sh /tmp/netdata-kickstart.sh --dont-wait --non-interactive
fi

if [ $? -eq 0 ]; then
	echo "Netdata instalation was successful."
else
	echo "Wasn't able to install netdata check connection."
	exit 1
fi

if sudo ufw status | grep -q "Status: active"; then
	echo "UFW is active, Opening port $MONITORING_PORT..."
	sudo ufw allow "$MONITORING_PORT/tcp" comment 'Allowed netdata dashboard.'
else
	echo "UFW is inactive or not installed. Skipping firewall configuration."
fi

if systemctl is-active --quiet netdata; then
	echo "Netdata isready to go."
else
	echo "Netdata service failed to start, checking logs..."
	sudo journalctl -u netdata --no-pager | tail -n 20
	exit 1
fi

sleep 3

HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:19999)

if [ "$HTTP_STATUS" -eq 200 ]; then
	echo "Netdata dashboard is accessable at http://localhost:19999"
else
	echo "Netdata dashcoard returned status: $HTTP_STATUS"
	exit 1
fi


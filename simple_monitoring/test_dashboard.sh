#!/bin/bash

TIMEOUT=${1:-60}
CORES=${2:-4}

if [ -z "$1" ]; then
	echo "Since no values were entered the default ones are 60s timeout and 4 cpu cores"
	echo "To customize timeout and cores, Usage is ./test_dashboard <timeout> <cores>"
fi

if command -v stress &> /dev/null; then
	echo "The stress tool is already installed."
else
	echo "Tool 'stress' not found, Installing now..."
	sudo apt-get update
	sudo apt-get install -y stress
fi

echo "Open your dashboard now: http://localhost:19999"
echo "Starting load in 5 seconds... Press Ctrl+C to abort."

sleep 5


echo "Spiking $CORES cores for $TIMEOUT seconds..."
stress --cpu "$CORES" --timeout "${TIMEOUT}s"

echo "Stess test complete."
exit 0



#!/bin/sh

args="$(cat "$1" | xargs)"

targets="$(cat "$2" | xargs)"

while [ 1 ]
do
	echo "starting instaloader run"
    instaloader $args $targets
    
    if [[ -z "${SLEEP_DURATION}" ]]; then
    	echo "single run complete"
        break
    else
    	echo "sleeping for ${SLEEP_DURATION} seconds"
    	sleep "${SLEEP_DURATION}"
    fi
done

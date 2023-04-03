#!/bin/bash
# 
# To install this on Ventura 13.2
# ln -s ~/bin/autolights.sh /usr/local/bin/autolights.sh 
# ln -s ~/bin/com.tashian.autolights.plist ~/Library/LaunchAgents
# 

LIGHT_ADDR=keylight

i_am_at_home() {
  ip_addresses=$(ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}')
  for ip in $ip_addresses; do
    if [[ $ip == 10.20.* ]]; then
      # Return true (0) if the IP starts with "10.20"
      return 0
    fi
  done
  # Return false (1) if none of the IPs start with "10.20"
  return 1
}

# Begin looking at the system log via the steam sub-command. Using a --predicate and filtering by the correct and pull out the camera event 
log stream --predicate 'subsystem == "com.apple.UVCExtension" and composedMessage contains "Post PowerLog"' | while read line; do
  
  # The camera start event has been caught and is set to 'On', turn the light on
  if echo "$line" | grep -q "= On"; then

    if i_am_at_home; then 
		#Light 1 - set to on
		curl --location --request PUT "http://${LIGHT_ADDR}:9123/elgato/lights" --header 'Content-Type: application/json' --data-raw '{"lights":[{"brightness":40,"temperature":280,"on":1}],"numberOfLights":1}'
	fi

  fi

  # If we catch a camera stop event, turn the light off.
  if echo "$line" | grep -q "= Off"; then
	
    if i_am_at_home; then	  
		#Light 1 - set to off
		curl --location --request PUT "http://${LIGHT_ADDR}:9123/elgato/lights" --header 'Content-Type: application/json' --data-raw '{"lights":[{"brightness":40,"temperature":280,"on":0}],"numberOfLights":2}'
	fi

  fi
done

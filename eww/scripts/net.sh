#!/bin/sh

if [ "$(nmcli | rg ^wlp.*connected | awk '{ print $2 }')" == "connected" ]; then
	echo "󰤨 "
else
	echo "󰤯 "
fi

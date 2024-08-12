#!/bin/sh

if [ "$(nmcli g | grep connected |awk '{ print $1 }')" == "connected" ]; then
	echo "󰤨 "
else
	echo "󰤯 "
fi

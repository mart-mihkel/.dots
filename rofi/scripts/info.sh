#!/bin/sh

_workspaces() {
	buf=""
	wmctrl -d | awk '{ print $1 " " $2 }' | while read -r number status; do
		icon=""

		if [ "$status" == "*" ]; then
			icon=""
		fi

		buf+="$icon "
		if [ $number == 8 ]; then
			echo "  Workspaces: $buf"
		fi
	done
}

_wireless() {
	status=$(nmcli | rg ^wlp.*connected | awk '{ print $2 }')
	name=$(nmcli | rg ^wlp.*connected | awk '{ print $4 }')

	if [ $status == "connected" ]; then
		echo "󰤨  Wi-Fi: $name"
	else
		echo "󰤯  Wi-Fi: offline"
	fi
}

_bluetooth() {
	mac=$(bluetoothctl devices | awk 'NR == 1 { print $2 }')
	status=$(bluetoothctl info $mac | rg Connected: | awk '{ print $2 }')

	if [ "$status" == "yes" ]; then
		name=$(bluetoothctl devices | awk 'NR == 1 { print $3 }')
		battery=$(bluetoothctl info $mac | rg Battery | awk '{ print $4 "%" }' | tr -d '()')
		echo "  Bluetooth: $name 󰥈  $battery"
	else
		echo "  Bluetooth: not connected"
	fi
}

_battery() {
	bat=/sys/class/power_supply/BAT0/capacity

	if [ -f $bat ]; then
		echo "󰁹  Battery: $bat"
	fi
}

_volume() {
	echo "  Volume: $(pamixer --get-volume-human)"
}

_date() {
	echo "  Time: $(date '+%H:%M %b %d. %Y')"
}

_workspaces
_wireless
_bluetooth
_battery
_volume
_date

#!/bin/sh

IFS="," read -ra info <<< "$ROFI_INFO"

if [[ "${info[0]}" == "wifi" ]]; then
	if [[ -n "${info[1]}" ]]; then
		_="$(nmcli device wifi connect ${info[1]})"
		exit 0
	fi

	nmcli -f SSID,SIGNAL device wifi list | tail -n +2 | while read -r ssid signal; do
		echo -e "󰤨  $ssid $signal/100\0info\x1fwifi,$ssid"
	done
	exit 0
fi

if [[ "${info[0]}" == "bluetooth" ]]; then
	if [[ -n "${info[1]}" ]]; then
		_="$(bluetoothctl connect ${info[1]})"
		exit 0
	fi

	bluetoothctl devices | while read -r dev mac name; do
		echo -e "  $name\0info\x1fbluetooth,$mac"
	done
	exit 0
fi

if [[ "${info[0]}" == "audio" ]]; then
	if [[ -n "${info[1]}" ]]; then
		_="$(pacmd set-default-sink ${info[1]})"
		exit 0
	fi

	pacmd list-sinks | rg 'name: <' | awk '{ print $2 }' | tr -d '<>' | while read -r sink; do
		echo -e "   $sink\0info\x1faudio,$sink"
	done
	exit 0
fi

ws_buf=""
wmctrl -d | awk '{ print $1 " " $2 }' | while read -r number status; do
	icon=""

	if [[ "$status" == "*" ]]; then
		icon=""
	fi

	ws_buf+="$icon "
	if [[ "$number" == 8 ]]; then
		echo "  $ws_buf"
	fi
done

status="$(nmcli | rg ^wlp.*connected | awk '{ print $2 }')"
if [[ "$status" == "connected" ]]; then
	name="$(nmcli | rg ^wlp.*connected | awk '{ print $4 }')"
	echo -e "󰤨  $name\0info\x1fwifi"
else
	echo -e "󰤯  Offline\0info\x1fwifi"
fi

mac="$(bluetoothctl devices | awk 'NR == 1 { print $2 }')"
status="$(bluetoothctl info $mac | rg Connected: | awk '{ print $2 }')"
if [[ "$status" == "yes" ]]; then
	name="$(bluetoothctl devices | awk 'NR == 1 { print $3 }')"
	battery="$(bluetoothctl info $mac | rg Battery | awk '{ print $4 "%" }' | tr -d '()')"
	echo -e "  $name\0info\x1fbluetooth"
	echo "󰥈  $battery"
else
	echo -e "  Not connected\0info\x1fbluetooth"
fi

bat="/sys/class/power_supply/BAT0/capacity"
if [[ -f "$bat" ]]; then
	capacity="$(cat $bat)"
	echo "󰁹  $capacity%"
fi

echo -e "  $(pamixer --get-volume-human)\0info\x1faudio"

echo "  $(date '+%H:%M %b %d. %Y')"

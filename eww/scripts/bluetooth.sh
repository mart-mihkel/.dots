!#/bin/sh

num=$(bluetoothctl devices | awk 'NR == 1 { print $2 }')
status=$(bluetoothctl info $num | grep Connected: | awk '{ print $2 }')

if [ "$status" == "yes" ]; then
	echo ""
else
	echo ""
fi

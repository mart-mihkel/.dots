#!/bin/sh

buf=""
wmctrl -d | awk '{ print $1 " " $2 }' | while read -r number status; do
	class="ws-inactive"
	icon=""

	if [ "$status" == "*" ]; then
		class="ws-active"
		icon=""
	fi

	buf+=$'\n'
	buf+="(label :class '$class' :text '$icon')"

	if [ "$number" == "3" ]; then
		echo "(box :spacing 20 $buf)"
	fi
done


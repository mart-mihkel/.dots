xrandr --output HDMI-1 --auto --same-as eDP-1
xrandr --output HDMI-2 --auto --same-as eDP-1
xrandr --output DP-1 --auto --same-as eDP-1
xrandr --output DP-2 --auto --same-as eDP-1

xset r rate 256 32
exec i3

# Change the keyboard keys
if [ -f "/home/mzc/.xmodmap" ]; then
    /usr/bin/xmodmap "/home/mzc/.xmodmap" 2>/dev/null
fi

ibus-daemon -x -r -d

unclutter &

while true
do
    feh --bg-scale "$(find ~/.wallpapers | shuf -n 1)"
    sleep 15m
done &

exec xmonad

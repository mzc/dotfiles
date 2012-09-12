# Change the keyboard keys
if [ -f "$HOME/.xmodmap" ]; then
    /usr/bin/xmodmap "$HOME/.xmodmap" 2>/dev/null
fi

ibus-daemon -x -r -d

unclutter &

while true
do
    feh --bg-scale "$(find ~/.wallpapers | shuf -n 1)"
    sleep 15m
done &

keynav &

exec xmonad

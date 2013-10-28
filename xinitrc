if [ -f "$HOME/.bash_profile" ]; then
    . "$HOME/.bash_profile"
fi

ibus-daemon -xrd

setxkbmap -option ctrl:swapcaps &
unclutter &
keynav &
synclient TouchpadOff=1

while true
do
    feh --bg-scale "$(find ~/.wallpapers | shuf -n 1)"
    sleep 15m
done &

exec xmonad

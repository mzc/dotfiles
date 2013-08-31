if [ -f "$HOME/.bash_profile" ]; then
    . "$HOME/.bash_profile"
fi

if [ -f "$HOME/.xmodmap" ]; then
    /usr/bin/xmodmap "$HOME/.xmodmap" 2>/dev/null
fi

# Arch's ibus conflicts with xmodmap, using scim instead
lsb_release --id | grep arch
if [ $? -eq 0 ]; then
    export XMODIFIERS=@im=SCIM
    export GTK_IM_MODULE="scim"
    export QT_IM_MODULE="scim"
    scim -d
else
    ibus-daemon -xrd
fi

unclutter &
keynav &
synclient TouchpadOff=1

while true
do
    feh --bg-scale "$(find ~/.wallpapers | shuf -n 1)"
    sleep 15m
done &

exec xmonad

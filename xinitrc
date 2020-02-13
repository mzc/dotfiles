if [ -f "$HOME/.bash_profile" ]; then
    . "$HOME/.bash_profile"
fi

export LC_CTYPE="en_US.UTF-8"
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

fcitx &

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

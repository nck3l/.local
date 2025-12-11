#!/bin/bash
# icons depend on nerdfonts being installed

#network() {
#wire="$(ip a | grep enp0s25 | grep inet | wc -l)"
#wifi="$(ip a | grep wlp2s0 | grep inet | wc -l)"

#if [ $wire = 1 ]; then
#    echo "  "
#elif [ $wifi = 1 ]; then
#    echo "  $(iwcfg wlp2s0 | awk -F"[ =]+" '/Quality/{print $4}')"
#else
#    echo " "
#fi
#}

vpn() {
wire="$(ip a | grep enp0s25 | grep inet | wc -l)"
wifi="$(ip a | grep wlp2s0 | grep inet | wc -l)"

if [ $(cat /sys/class/net/tun0/operstate) = 'unknown' ]; then
    if [ $wire = 1 ]; then
        echo "󰯄"
    elif [ $wifi = 1 ]; then
        echo "󱚿"
    fi
else
    echo ""
fi
}

echo "$(vpn)"

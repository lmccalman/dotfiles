#!/bin/bash

function control_c {
    echo -en "\n## Caught SIGINT; Killing torrent clients... \n"
    killall --wait transmission-gtk
    echo -en "\n## Killed torrent clients, grace period... \n"
    sleep 5
    exit $?
}

trap control_c SIGINT
trap control_c SIGTERM

openvpn --config /etc/openvpn/client/de72.nordvpn.com.udp1194.ovpn --auth-user-pass /home/lb/.nordauth &
sleep infinity

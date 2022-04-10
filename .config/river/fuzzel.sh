#!/bin/sh
fuzzel -f cozette:size=10 -T alacritty -w 64 -b 002b36ff -t 839496ff \
	-m dc322fff -s 073642ff -B 2 -r 0 -C 839496ff $@ <&0 

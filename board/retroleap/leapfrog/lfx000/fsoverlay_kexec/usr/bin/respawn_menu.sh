#!/bin/sh

# Really any file to indicate lf1000 will do. 
# This will eventually need to be expanded to account for leappad1.
# The configs for didj and explorer are slightly different due to different button layouts + button count.

if [[ -f /sys/bus/platform/drivers/lf1000-gpio/bind ]]; then
	didj_board_id="3"
	if [ "$didj_board_id" == "$(cat /sys/devices/platform/lf1000-gpio/board_id)" ] ;then
		CONFIG=/configs/retroarch.cfg.didj
	else
		CONFIG=/configs/retroarch.cfg.leapsterexplorer
	fi
fi

valencia=$(fbset | grep 480x272)
if [[ $? == 0 ]]; then
    CONFIG=/configs/retroarch.cfg.leappad2
	#HACK: No gmenunx support on the leappads yet (not enough buttons!)
	touch /flags/boot_to_retroarch
fi

rio=$(fbset | grep 1024x600)
if [[ $? == 0 ]]; then
	#HACK: No gmenunx support on the leappads yet (not enough buttons!)
    CONFIG=/configs/retroarch.cfg.leappadultra
	touch /flags/boot_to_retroarch
fi

# Set minimum free memory (mainly for Didj - fixes crashes in gpsp)
echo 1596 > /proc/sys/vm/min_free_kbytes

export HOME=/configs
# TODO: Figure out why tslib can't detect this automatically as it'll probably be different for lf1000.
export TSLIB_TSDEVICE=/dev/input/event1

if [[ ! -f "/configs/.config/retroarch/retroarch.cfg" ]];
then
	mkdir -p /configs/.config/retroarch
	cp $CONFIG /configs/.config/retroarch/retroarch.cfg
fi

if
	  echo 1 > /sys/devices/platform/lf2000-fb.0/graphics/fb1/blank
	  echo 1 > /sys/devices/platform/lf2000-fb.0/graphics/fb2/blank
	  echo 0 > /sys/devices/platform/lf2000-fb.0/graphics/fb0/blank
	  export SDL_NOMOUSE=1
	  kexecboot
	done
fi
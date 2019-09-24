#!/bin/bash
clear
echo "      ------------------------------------------------- "
echo "      -           ***cpu_programming-tool***          - "
echo "      --------------------------------------------------"
echo ""
echo "                   ARE YOU ESD SAFE!?? "
echo ""
sleep 2s
echo "    CHECK LIST... "
echo "    1) Check that the power supply if turned off ..."
echo "    2) Connect usb serial and J-Tag cables to baseboard base..."
echo "    3) Insert cpu board with jumper "
echo "    4) Connect ethernet cable"
sleep 2s
echo ""
echo "    ...DO NOT connect USB cable to the PC at this point!,if you did, disconnect them before continue, Procced when ready. "
echo ""
sleep 1s
read -n 1 -s -r -p  "Proceed [y/n]? " CONT
if [ "$CONT" = "y" ];
then
	sleep 1s
else 
	exit
fi
clear
echo ""
echo "      The program will hang for a few seconds while resetting USB ports for" 
echo "      first time use..."
sleep 1s
echo ""
sudo pkill -9 openocd & 
sleep 1s
sudo pkill -9 openocd &
echo ""
sleep 10s
echo    " ...Connect USB J-tag to PC NOW! "
sleep 5s
echo ""
read -n 1 -s -r -p  " ...Continue [y/n]? " CONT
if [ "$CONT" = "y" ];
then
	sleep 1s
else
	exit
fi
echo ""
echo " ...Expect some 'RMMOD ERRORS' on screen next,this is OK"
sleep 3s
echo " "
sudo rmmod ftdi_sio &
sleep 1s
sudo rmmod ftdi_sio 
sleep 3s
echo ""
echo " ...Connect the USB serial cable to PC Now!..."
sleep 7s
echo ""
echo ""
read -n 1 -s -r -p " ...Continue [y/n]? " CONT
if [ "$CONT" = "y" ]; 
then
	sleep 1s
else
	exit
fi
echo "..."
sleep 1s
echo "......"
sleep 1s
echo "........."
sleep 2s
echo "............"
echo ""
gnome-terminal -x sudo screen /dev/yi-serial-b 115200 &
echo ""
clear
cd /home/electronics/ynda-bringup/cpu-c-uboot/current

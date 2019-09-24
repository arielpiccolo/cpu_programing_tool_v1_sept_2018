
#!/bin/bash
clear
echo "      ------------------------------------------------- "
echo "      -           ***cpu_programming-tool***          - "
echo "      --------------------------------------------------"
echo ""
echo "                   ARE YOU ESD SAFE?? "
echo ""
sleep 2s
echo "    1) Check that the power supply if turned off ..."
sleep 1s
echo "    2) Connect usb serial and J-Tag cables to baseboard base..."
sleep 1s
echo "    3) Insert cpu board with jumper "
sleep 1s
echo "    4) Connect ethernet cable"
sleep 1s
echo ""
echo "      ...DO NOT connect any USB cable to the PC at this point!,if you did, disconnect them before continue, Procced when ready. "
echo ""
echo ""
sleep 1s
read -p "Proceed [y/n]? " CONT
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
sleep 1s
echo    " ...Connect USB J-tag to PC NOW! "
sleep 1s
echo ""
read -p " ...Continue [y/n]? " CONT
if [ "$CONT" = "y" ];
then
	sleep 1s
else
	exit
fi
echo ""
echo " ...Expect some 'RMMOD ERRORS' on screen next,this is OK"
sleep 1s
echo " "
sudo rmmod ftdi_sio &
sleep 1s
sudo rmmod ftdi_sio 
sudo rmmod ftdi_sio 
sleep 1s
echo ""
echo " ...Connect the USB serial cable to PC Now!..."
sleep 2s
echo ""
echo ""
read -p " ...Continue [y/n]? " CONT
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
sleep 1s
echo ""
gnome-terminal -x cd /home/electronics/ynda-bringup/cpu-c-uboot/current
exec bash
gnome-terminal -x sudo screen /dev/yi-serial-b 115200

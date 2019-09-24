NEW PROCEDURE FOR CPU PROGRAMMING NOV 2018 (CHEAT SHEET)

(Terminal 1)
sudo screen /dev/yi-serial-b 115200
(Terminal 2)      <<<<------  ## AFTER 1 BOARD IS DONE REPEAT FROM HERE.
cd /home/electronics/ynda-bringup/cpu-c-uboot/current
sudo openocd -f ../../openocd.conf/openocd-marvell-olimex-usb-ocdh.cfg
(Terminal 3) 
telnet localhost 4444
SWITCH POWER ON
halt
ynic_load_uboot
(you may occasionally need to run these commands more than once)
## INTERRUPT THE BOOT IN TERMINAL 1!
setenv ethaddr b4:30:c0:00:00:00 
boot
* Wait for boot
* Log in as root : 1234
## Burn bootloader
cat ynda-bringup/cpu-c-uboot/current/u-boot.kwb > /dev/mtd0
## Check bootloader version:
ynda-bringup/bin/ynda-dump-uboot-version
## update MAC address and run
## update last digits and date
/srv/ynda/ynda-bringup/bin/ynda-eeprom-cpu --write b4:30:c0:00:00:XX 2018 11  
## to check new MAC
hd /sys/bus/i2c/devices/0-0050/eeprom       

(Terminal 2)   
## Ctrl + ^Z  to stop process.
## remove JTAG usb cable from JTAG end.
RUN :sudo pkill -9 openocd 

## Verify that board boots by turning power off and on again.

## Finish the process by turning power off.

….NEXT:
FOLLOW THE NEXT INSTRUCTIONS STEP-BY-STEP!!! TO RESET BEFORE DOING NEXT BOARD.

## REMOVE BOARD, APPLY MAC ADDRESS AND CODE STICKERS  REMOVE JUMPER. 
## RE-CONNECT JTAG
## INSERT NEW BOARD WITH JUMPER.
 ## REPEAT FROM  ## Starting openocd (Terminal 2)




TROUBLESHOOTING. 

* To check if you can see the serial console cable, run:
ls /dev/yi-serial*
* If you don't see anything, unplug the cable and run:
sudo rmmod ftdi_sio
* Replug the cable and re-check.
* Note down which yi-serial-* you are using, then start screen:

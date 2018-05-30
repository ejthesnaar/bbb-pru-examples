# bbb-pru-examples

PRU Examples for Beaglebone Black/Green boards.

Examples are developed and tested on the Debian 9.3 2018-03-05 4GB SD IoT image that can be found [here](https://beagleboard.org/latest-images "BeagleBoard.org - latest-images").  This image contains the REMOTEPROC and RPMsg drivers, as well as the TI PRU Code Generation Tools (PRU_CGT) already installed.

## lib and include

These folders include the headers and the compiled library from v5.1.0 of the PRU Software Support Package from TI that can be found at [here](https://git.ti.com/pru-software-support-package/pru-software-support-package/trees/v5.1.0 "TI PRU Software Support Package v5.1.0").

## Examples

### 1_halloworld

This folder contains the hallo world PRU example.  This is based on the [pru_blinky](https://github.com/ZeekHuge/BeagleScope/tree/port_to_4.4.12-ti-r31%2B/examples/firmware_exmples/pru_blinky "ZeekHuge BeagleScope git repo") example from Zubeen Tolani's BeagleScope project.  This example toggles pin 25 on header 9 at 1 Hz.

1. Connect a 470 ohm resistor and an LED between P9_25 and P9_3.
2. Run `.\run_pru.sh` to run the example.  

### 2_rpmsg

This folder contains the hallo world PRU RPMsg example.  This is based on the lab 5 from the [TI PRU Training: Hand-on Labs](http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs#LAB_5:_RPMsg_Communication_between_ARM_and_PRU "TI PRU Training: Hand-on Labs").  This example toggles pin 25 on header 9 at 10 Hz and echo's back messages sent to the PRU from either kernel space (not in the scope of this example), user space via sysfs or user space via an application using the RPMsg driver.  

1. Connect a 470 ohm resistor and an LED between P9_25 and P9_3.  
2. Run `.\run_pru.sh` located in `pru` to run the example.  
3. Send message to PRU using sysfs `sudo sh -c 'echo Hallo > /dev/rpmsg_pru30`
4. Send message to PRU using sysfs `sudo sh -c 'echo World > /dev/rpmsg_pru30`
5. Read messages from PRU using sysfs `cat /dev/rpmsg_pru30` (use ctrl + c to exit)
6. Run `sudo .\rpmsg_userspace.sh` located in `userspace` to communicate between the PRU and user space application

Assignment 1-1:
- Create bash script to perform following tasks:
+ Receive input from a file + File path is the input for this script
+ The script can be run any where in the system as the Linux Command
+ Change the value at Col 3 with following requirement:
* If the number is larger than
5 -> Change this number to "L" character
* If the number is smaller than 6 -> Change this number to
"S" character
+ Search for the longest streak of the letter "L" or "S"
+ Print out the longest streak with its lastest index

Assignment 2:
1. Create a simple linux kernel module perform following actions:
- The kernel module is a SPI device driver.
- You just need to probe the driver into kernel.
2. Create a script include:
- Auto setup a yocto environment + Provide: bblayers.conf, local.conf
- Auto create a recipes to build the kernel with your driver created in (1)
Target: After this script done, you will have the yocto environment that can build your kernel module with bitbake
+ Select Linux Distribution's attributes:
- Kernel version: 5.10
- Yocto version: 3.4
- GCC version: 11 (or above
11.1, 11.2)
+ Create recipe
(myapplication-1.0.bb)
+ Integrate your application into image
+ Create image
+ Deploy image --> VM(Vbox, QEMU)
+ 

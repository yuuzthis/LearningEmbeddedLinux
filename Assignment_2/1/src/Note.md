make
sudo insmod simple_spi.ko
dmesg | tail  # To see the kernel messages


//Unload the Module
sudo rmmod simple_spi

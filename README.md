# riscv64_asm
This repository contains 64 bits RISCV assembly files from beginning to expert level.  

## Setup a Ubuntu for RISCV 64 Virtual Machine with QEMU 

#### First Step - Install Prerequistites

```bash
$ sudo apt-get update
$ sudo apt-get install opensbi qemu-system-misc u-boot-qemu
```
#### Second Step - Download, unpacking and resize Ubuntu image 
For RISC-V computers. Requires copying your own first stage bootloader (like u-boot) and relevant DTBs onto the image before usage on real hardware (like the SiFive HiFive Unmatched). Usable on RISC-V QEMU.

* Download Ubuntu Image
```bash
$ mkdir -p /opt/ubuntu
$ cd /opt/ubuntu
# sudo chown -R [YOUR_USERNAME]:[YOUR_GROUP] /opt/ubuntu
$ wget https://cdimage.ubuntu.com/releases/[UBUNTU_VERSION]/release/ubuntu-[UBUNTU_VERSION]-preinstalled-server-riscv64.img.xz
```

* Unpacking Image and Resize
```bash
$ xz -dk ubuntu-[UBUNTU_VERSION]-preinstalled-server-riscv64.img.xz
$ qemu-img resize -f raw ubuntu-[UBUNTU_VERSION]-preinstalled-server-riscv64.img +10G
```

#### Third Step - Create a startup Virtual Machine's script:

* Create a `startup.sh`:
```bash
touch /opt/ubuntu/startup.sh
```

* Run this command below to copy qemu start command to the `startup.sh` file
```shell
echo '#!/bin/bash \

qemu-system-riscv64 \
  -machine virt -nographic -m 4G -smp 4 \
  -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.bin \
  -kernel /usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
  -device virtio-net-device,netdev=eth0 -netdev user,id=eth0 \
  -device virtio-rng-pci \
  -drive file=ubuntu-24.04-preinstalled-server-riscv64.img,format=raw,if=virtio' > /opt/ubuntu/startup.sh
```

* Give execution permission to `startup.sh` file:
```bash
$ sudo chmod a+x /opt/ubuntu/startup.sh
```

#### Fourth Step - Run script
```
$ ./opt/ubuntu/startup.sh
```

#### Fifth Step - Ubutun Log in
To login to Ubuntu the default username and password are 'ubuntu'


## Run Assembly file
In Ubuntu virtual machine, to run assembly file execute this commands below:
```bash
$ as -o output.out [FILE].s
$ ld -o output output.out
$ ./output
```

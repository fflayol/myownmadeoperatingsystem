# Make you Own Operating System
## Setup of the development environment
### Installing a Linux Vm on Windows
In this book we will extensively use Linux because a lot of compilation command and toold are available by default.
So don’t be upset if you have a Windows machine. There is a solution for using a Linux environment on PC. You can use a program called Virtual Box  that will simulate the environment of an another operating system. This will be very useful later when we are gonna test our Operating System.

####  Installing Vbox
Download the latest version of VirtualBox at the following adress: https://www.virtualbox.org/
Click on the file you've just dowloaded and follow the instruction

#### Installing Virtual Machine
Download image
Starting

#### Installing Qemu
Quemu is a software that will simulate any machine or processor.
>	sudo apt-get install qemu

And say yes if you need to install new pacakages
To test
> qemu-i386  -version

It might write something like that
>qemu-i386 version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.34), Copyright (c) 2003-2008 Fabrice Bellard



### Getting the Code
All the code is stored in a git repository ( a plublic place where everybody can get code)
Ensure that you have git installed
>sudo apt-get install git


Then type:
>git clone https://github.com/fflayol/myownmadeoperatingsystem.git
cd code/chapter1
sudo apt-get install nasm
masm boot.asm -o kernel.sys
qemu-system-i386  kernel.sys

Normally you might see 

### Testing the Code
starting qemu
 
###  Conclusion

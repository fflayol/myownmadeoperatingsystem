# Make you Own Operating System
## Setup of the development environment
### Installing a Linux Vm on Windows
In this book we will extensively use Linux because a lot of compilation command and toold are available by default.
So don’t be upset if you have a Windows machine. There is a solution for using a Linux environment on PC. You can use a program called Virtual Box  that will simulate the environment of an another operating system. This will be very useful later when we are gonna test our Operating System.

####  Installing Vbox
Download the latest version of VirtualBox at the following adress: https://www.virtualbox.org/
Click on the file you've just dowloaded and follow the instruction

#### Installing Virtual Machine
Follow the instruction on the link below:

![alt text](https://www.tecmint.com/install-ubuntu-16-04-alongside-with-windows-10-or-8-in-dual-boot/)
#### Installing Qemu
Quemu is a software that will simulate any machine or processor.
>	sudo apt-get install qemu

And say yes if you need to install new pacakages
To test
> qemu-i386  -version

It might write something like that
>qemu-i386 version 2.0.0 (Debian 2.0.0+dfsg-2ubuntu1.34), Copyright (c) 2003-2008 Fabrice Bellard



### Getting the Code and Testing
All the code is stored in a git repository ( a plublic place where everybody can get code)
Ensure that you have git installed
>sudo apt-get install git


Then type:

	git clone https://github.com/fflayol/myownmadeoperatingsystem.git	
	cd code/chapter1	
	sudo apt-get install nasm	
	masm boot.asm -o kernel.sys
	qemu-system-i386  kernel.sys
		
	
Normally you might see a window which print Hello World ! Congratulation 
![alt text](/code/chapter1/img/img1.jpg "Qemu Ex1")
>		[ORG 0x7c00]
>		   xor ax, ax 
>		   mov ds, ax 
>		   mov si, msg
>		ch_loop:
>	  	   lodsb
>		   or al, al  ; zero=end of string
>		   jz hang    ; get out
>		   mov ah, 0x0E
>		   int 0x10
>		   jmp ch_loop
>		 
>		hang:
>		   jmp hang
>		 
>		msg   db 'Hello World from Own System', 13, 10, 0
>		 
>		   times 510-($-$$) db 0
>		   db 0x55
>		   db 0xAA
>

Let's explain a bit what this code is doing (we will return to this code later in the next chapter).

	[ORG 0x7c00] 
tells at which adress  the code must be put

	xor ax, ax 
	mov ds, ax 
	mov si, msg
Get the complete adress of the message we want to print (that is to say where the message is stored)

	lodsb
	or al, al  ; zero end of string
	jz hang    ; get out	
Store into **al** the current character of the string and test if it is equal to  zero and exit if this character equals to 0 (in this case 0 not the character 0)

	mov ah, 0x0E
	int 0x10
Call a function (we will see later what is an interuption) to print the character

***

 
### Conclusion
We installed qemu and booted the very first step of our operating system. In the following chapter we will present the architecture and memory of Intel porcessor.

---

# Chapter 2 #
## Introduction
During this course we will focus on Intel Processor (especially Pentium).
## Processor
Hereafter the detail of the Pentium Processor
![alt text](/code/chapter2/img/img1.png "Architecture")


### Operator registers
    *AL/AH/AX/EAX/RAX: Accumulator
    *BL/BH/BX/EBX/RBX: Base index (for use with arrays)
    *CL/CH/CX/ECX/RCX: Counter (for use with loops and strings)
    *DL/DH/DX/EDX/RDX: Extend the precision of the accumulator 
    *SI/ESI/RSI: Source index for string operations.
    *DI/EDI/RDI: Destination index for string operations.
    *SP/ESP/RSP: Stack pointer for top address of the stack.
    *BP/EBP/RBP: Stack base pointer for holding the address of the current stack frame.
    *IP/EIP/RIP: Instruction pointer. Holds the program counter, the current instruction address.
    *R8-R16 64 bits registers for any usage



## Memory
The Pentium has different memory mode. The first mode (which is the historicaly the first) is called 'real mode'
Real mode is characterized by a 20-bit segmented memory address space (giving exactly 1 MiB of addressable memory) and unlimited direct software access to all addressable memory, I/O addresses and peripheral hardware. Real mode provides no support for memory protection, multitasking, or code privilege levels.
All x86 CPUs start in real mode when reset or starting.
In this mode the memory is divided in segments of 65535 bytes (64 Ko or 0000 to FFFF). To simplify we can say that the segment is a piece of memory and the offset is the box inside it. 
The segments have also a big limitation they are multiple of 16.  To find the linear adress the calculus is the following: PhysicalAddress = Segment * 16 + Offset

    
### Segment registers:

    *CS: Code
    *DS: Data
    *SS: Stack
    *ES: Extra data
    *FS: Extra data #2
    *GS: Extra data #3

# Chapter 3 #
As we know a little bit more on processor we can start now to create useful functions that we will use a lot.
## Cleaning the screen  ##
## Memory manipulation ##

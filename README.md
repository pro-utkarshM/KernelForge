# Developing a Multithreaded Kernel from Scratch

**Welcome to our comprehensive kernel development project** where you will learn to create a multitasking operating system and kernel from the ground up. This project-based learning journey will take you through the core concepts of kernel programming, starting from scratch and gradually building towards a fully functional multithreaded kernel. Even if you have no previous experience with kernel development, this project will provide you with the knowledge and hands-on experience necessary to create your own OS kernel.

## About This Project

The project is divided into several key stages, designed to build your skills incrementally:

1. **Real Mode Development**
2. **Protected Mode Development**
3. **Bonus: Mastering Assembly Language**

Each section addresses critical aspects of kernel development, from foundational concepts like the boot process to advanced topics like multitasking, memory management, and file system implementation.

### Real Mode Development

This section introduces the very basics of kernel development. You'll work on:

- Understanding how the boot process works, starting from BIOS to your kernel.
- Writing a bootloader in assembly language to initialize your kernel.
- Handling interrupts in real mode to manage low-level operations.
- Reading a sector (512 bytes) from the hard disk, building up toward a filesystem.

### Protected Mode Development

Once you're comfortable with the real mode, you'll advance to the **Protected Mode** where modern kernels operate. This stage will cover:

- Implementation of the **FAT16 filesystem** to manage file storage.
- **Memory management** techniques such as paging and segmentation to handle virtualization.
- Building a **keyboard driver** to manage user inputs.
- Creating an **ELF file loader** to load executable files.
- Designing a **virtual filesystem layer** similar to what is found in the Linux kernel.
- Implementing **processes and task switching** for multitasking capabilities.

### Assembly Language Bonus

For those less familiar with assembly language, this bonus section will help you become comfortable with the low-level coding required for kernel development. You'll master critical assembly operations that power the boot process, interrupt handling, and direct hardware interactions.

## Project Objectives

By the end of this project, you will have built:

- A custom bootloader written in Assembly.
- A 32-bit multitasking kernel with support for hardware interrupts.
- A simple file system to load and run applications.
- Memory management features, including virtual memory.
- Support for task switching, enabling multitasking in your OS.
- A keyboard driver and the ability to load ELF binaries.

## Required Skills

- **C programming**: Since kernels are primarily written in C, a solid understanding of the language is crucial.
- **Assembly Language**: You’ll work closely with Assembly for low-level tasks like writing the bootloader and managing CPU registers.

## Key Learning Outcomes

Upon completing this project, you will have gained expertise in:

- **Kernel development** from scratch, creating the core of an operating system.
- **Multitasking**: Enabling your kernel to run multiple processes concurrently.
- **Memory management**: Implementing virtual memory, paging, and memory segmentation.
- **System calls and interrupts**: Understanding how an OS communicates with hardware and software.
- **Kernel and user land**: Differentiating between protected kernel space and user space.
- **Debugging low-level code**: Using GDB to debug your kernel in an emulator.
- **ELF file handling**: Writing a loader for executing applications in your OS.

## Tools and Technologies

- **NASM/FASM** for assembly language.
- **QEMU** for emulating your kernel.
- **GDB** for debugging and inspecting machine code.
- **GCC** for compiling C code into machine code that runs in your kernel.

## Who Should Undertake This Project?

This project is ideal for:
- Students or developers interested in operating system design.
- Enthusiasts keen on learning how kernels and low-level programming work.
- Developers who want to explore memory management, multitasking, and system programming.

## Ready to Start?

Embark on this exciting journey to build a multithreaded kernel from scratch. Along the way, you’ll gain hands-on experience with every layer of an operating system, from bootloading to multitasking and memory management.

---


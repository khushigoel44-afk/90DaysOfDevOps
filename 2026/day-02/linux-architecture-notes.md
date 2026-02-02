#CORE ELEMENTS OF LINUX#
The core elements of linux can be explained with the method "ASK":---

- *Application(A)*:--
  - They are the top level programs that interact with the user.
  - They run on top of the Shell and the Kernal to perform any task.

- *Shell(S)*:--
  - The utility b/w the user(Application) and the kernel.
  - Machines don't understand "Humans", shells take Commands, interprete and interact with the kernel.
  - Can we GUI or CLI.
     - CLI (Command Line Interface): Just like Bash, takes commands from the user.
     - GUI (Graphical User Interface): just like KDE, uses Icons.

- *Kernel(K)*:--
  - Heart of Linux, lowest level of software. 
  - Can do the following:--
     - Resource Management: Which app gets the CPU and for how long.
     - Memory Management: which app is stored where and they don't interfere with working of each other.
     - Device Drivers: Act as Bridge so that Software "talks" to the Hardware.

- *Hardware*:--
  - All the physical entities like the CPU, RAM, Hard Disk and all the peripheral devices like Keyboard etc.

#PROCESS STATES#

- *Running State(R)*
  - The program is either using CPU. or is in "queue".
  - Is in Queue, will work with the CPU whenever the CPU is available.
- *Interruptable State(S)*
  - The process is in Sleep MOde but can be woken up by sending Signals.
- *UnInterruptable State(D)*
  - The process is waiting for response from the slow running hardware.
  - It won't respond until signal form hardware is received.
- *Stopped(T)*:
  - In this the Program is Suspended.
  - Can be done by using Ctrl+Z.
  - Once Suspended, it can be revived!
- *Zombie(Z)* 
  - The task is completed and so the process is almost dead. 
  - It's entry is still possible in the process table.
  - Parent Process needs to read the "Exit Code" to remove the zombie from the system.
  - This cannot be killed as it is already dead.

#SYSTEMD#

- *POwer Turned ON:* Power is turned ON.
- *BIOS:* Basic input output operations
  - Looks for the disk devices (Hard Disk etc).
  - Has GRUB that LOads the Linux Kernel. 
- *PID 1:* SystemD has Process ID 1 i.e. it is the first program that loads when the power is turned ON.
- *SystemD:* Runs in the Background.
- *Systemctl:* Used to interact with it just like CLI (Command Line Interface).

#ANY 5 COMMANDS I AM GOING TO USE EVERYDAY#

- *pwd*: To know the present working directory.
- *ls*: To list all the files present.
- *cd*: To change the Directory.
- *man*: To know the Details of any other Command
  - Ex. man pwd: Explains what pwd does.
- *mkdir*: To create a new Folder.
  - Ex. mkdir Devops: Creates a new folder named *Devops*.

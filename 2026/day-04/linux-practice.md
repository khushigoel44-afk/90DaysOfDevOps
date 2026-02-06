#**PROCESS COMMANDS:)**#
- *top*: Displays all the linux processes that are active.
- *ps*: Displays the snapshot of the current linux processes.
- *pgrep xyz*: Displays PID's of all the running processes having *xyz* in their names.

#**SERVICE COMMANDS**:)**#
- *apt install xyz*: Used to install the xyz program within the system.
- *systemctl status xyz*: Used to check if the xyz program is working or not.  
- *systemctl / systemctl list-unit*: Lists all the currently loaded and active units.

#**LOG BASED COMMANDS:)**#
- *journalctl -u docker*: It will display all the logs for docker (Or any other program).
- *tail xyz.txt*: Displays the last 10 lines in the file xyz.txt by default.
- *tail -n 50 xyz.txt*: Displays the 50 (or the number specified) end lines in the file xyz.txt

#**EXPLORING SSH ON MY SYSTEM**#
- STANDS FOR *secure shell*.
- Gives More Security.
- Used to create a connection between the Server A (Private Key) and server B (Public Key).

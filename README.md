# Installation & Setup

Prerequisite: Kali Linux is installed on bare metal (installed directory onto the pc), or installed on a Virtual machine (VMware, Virtual Box, etc). “installDVWA.sh” script is on your machine.

### 1. IF you are using a Windows host WITH a Kali VM
  
- Drag and drop the “installDVWA.sh” from your Windows Desktop to your Kali Virtual Machine Desktop
- Inside of your Kali Virtual Machine, right-click the desktop and select the option “Open terminal here”
  
### 2. IF you are in a regular bare-metal install of Kali on your computer
- Inside of your Kali Desktop right-click the desktop and select the option “Open terminal here”

### 3. After step 1 and or 2 is completed, inside of the terminal, type the commands: 
- sudo su 
    - (Enter your password as prompted, log in as root)
-  apt update && apt upgrade -y
    - (Update your install of Kali)
- chmod +x installDVWA.sh
    - (This command will make the script executable)
- sudo bash installDVWA.sh
    - (This will run the script using bash, and as sudo)
  
### 4. When running the script, you will be prompted with some inputs:
- Type “A” in the prompts and press the “Enter” key 
  
### 5. Open your browser, 
- Inside of your Kali Linux Environment, lookup “localhost”

### 6. When inside of the web app, 
- Click to the tab on the top left of the web page that says “Setup/ Create Database”

### 7. Scroll down,
- Click the “Create Database” button on the bottom of the webpage, you should see some cool context information regarding what happened when you clicked that button

### 8. Click the log out button on the bottom left and log in with the credentials:
- Username:     admin
- Password:       password

### 9. All Done!
- You should now be able to access every lab in the D.V.W.A.

# Misc-AHK
This repository contains all kinds of miscellaneous AHK scripts that I use more or less. Mainly quality-of-life scripts, also something more random.

## Brief explanations
* **`capslock-to-esc.ahk`**  
Quick little script to remap CapsLock to ESC system wide.  
Shift+CapsLock can be used to still send a CapsLock.  
If you use this, don't use `VimCapsLockToEsc.ahk` at the same time.
* **`ffmpeg-list.ahk`**  
ffmpeg each file from clipboard, edit the script always to contain the specific switches you'll want.
* **`hotstrings-hotkeys.ahk`**  
Hotstrings and hotkeys that'll run on my system 24/7
* **`process-sound.ahk`**  
Advanced WinAPI and AHK one liner experiment, gets the Windows sound manager components for the desired process.  
Can be used to e.g adjust sound per application.
* **`pscp-from-clipboard.ahk`**  
Easily pscp files from clipboard, made this for my [university's programming course](https://github.com/0x464e/comp-cs-110), since files had to be transferred to a remote desktop all the time
* **`PyCharm-Focus-After-Run.ahk`**  
Automatically focus the console in PyCharm after using the hotkey to run or debug a script.
* **`remove norwegian.ahk`**  
Razer Synapse for some odd reason adds the Noregian keyboard layout to my computer every single time my computer stars, this script runs on Windows startup and removes it.
* **`run-wt-powershell.ahk`**  
Starts up PowerShell in the Windows Terminal in the explorer folder that is currently open (override by holding `shift` so it runs in `~`)
* **`run-wt-wsl.ahk`**  
Starts up WSL (**W**indows **S**ubsystem for **L**inux) in the Windows Terminal in the explorer folder that is currently open (override by holding `shift` so it runs in `~`)
* **`VimCapsLockToEsc.ahk`**  
My script to map CapsLock to ESC in Vim

## Installing & Usage
>**AutoHotkey is Windows only!**
* Install [AutoHotkey](https://www.autohotkey.com/)
* Download the desired `.ahk` file from this repository
* Run the the file by just double clicking it  
<sup><sub>(If the AHK installation would've somehow failed to associate `.ahk` files with the AHK interpreter, you can manually run `.ahk` files by just passing in the file to the interpreter, which is found in your AHK installation directory (usually `C:\Program Files\AutoHotkey\AutoHotkey.exe`))</sub></sup>  
Portable versions can be created if you have AHK installed by just right clicking the `.ahk` file and choosing `Compile Script`.  
This packs the AHK interpreter and the script file to one `.exe`.
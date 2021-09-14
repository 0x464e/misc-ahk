#NoTrayIcon
SetTitleMatchMode, RegEx

/*
Launches Windows Subsystem for Linux in Windows Terminal.
If an explorer window is focused, wsl is launched in that directory.
Alternatively, if the desktop or the task bar is focused, wsl is launched the desktop directory.

Override launching in a specific directory by using Shift+hotkey.

A hotkey implementation has to be used for the task bar part of this program, because when a program is
launched, the task bar loses focus and therefore it being active couldn't be detected.
*/

F16::
+F16::
	if (A_ThisHotkey = "F16" && ((ExplorerHwnd := WinActive("ahk_exe i)\\explorer\.exe$ ahk_class CabinetWClass")) || WinActive("ahk_exe i)\\explorer\.exe$ ahk_class Shell_TrayWnd|WorkerW")))
	{
		if (ExplorerHwnd)
		{
			for window in ComObjCreate("Shell.Application").Windows
			{
				if (window.hwnd == ExplorerHwnd)
				{
					;escape ; for wt
					dir := StrReplace(window.Document.Folder.Self.Path, ";", "\;")
					break
				}
			}
		}
		else
			dir := "C:\Users\" A_UserName "\Desktop"
	}
	else
		dir := "C:\Users\" A_UserName

	Run, % "wt.exe -d """ dir """ wsl"
return
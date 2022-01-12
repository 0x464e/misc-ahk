#NoTrayIcon
SetTitleMatchMode, RegEx

/*
Launches PowerShell v7 (or possibly higher? Whatever version "pwsh" will launch, minimum v7) in Windows Terminal.
If an explorer window is focused, PowerShell is launched in that directory.
Alternatively, if the desktop or the task bar is focused, powershell is launched the desktop directory.

Override launching in a specific directory by using Shift+hotkey.

A hotkey implementation has to be used for the task bar part of this program, because when a program is
launched, the task bar loses focus and therefore it being active couldn't be detected.
*/

F15::
+F15::
	if (A_ThisHotkey = "F15" && ((ExplorerHwnd := WinActive("ahk_exe i)\\explorer\.exe$ ahk_class CabinetWClass")) || WinActive("ahk_exe i)\\explorer\.exe$ ahk_class Shell_TrayWnd|WorkerW")))
	{
		if (ExplorerHwnd)
		{
			for window in ComObjCreate("Shell.Application").Windows
			{
				if (window.hwnd == ExplorerHwnd)
				{
					;escape ' for PowerShell and ; for wt
					dir := StrReplace(StrReplace(window.Document.Folder.Self.Path, "'", "''"), ";", "\;")
					break
				}
			}
		}
		else
			dir := "~\Desktop"
	}
	else
		dir := "~"
	
	;Set-Location -LiteralPath used to not need to escape even more characters which have
	;special meanings in a PowerShell command
	Run, % "wt.exe pwsh -NoLogo -NoExit -Command ""Set-Location -LiteralPath '" dir "' && clear"""
return

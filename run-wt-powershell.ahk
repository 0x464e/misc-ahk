#NoTrayIcon
SetTitleMatchMode, RegEx

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

	Run, % "wt.exe pwsh -NoLogo -NoExit -Command ""Set-Location -LiteralPath '" dir "'"""
return
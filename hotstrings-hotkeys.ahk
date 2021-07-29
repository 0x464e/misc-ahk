#NoTrayIcon
#SingleInstance, Force
SetTitleMatchMode, 2


#IfWinActive, Stack Overflow ahk_exe chrome.exe
:?OX::sup!::SendInput, % "<sup>[(docs)]()</sup>{Left 7}"
#IfWinActive

#IfWinActive, ahk_exe Discord.exe
^F12::
	WinGet, exe, ProcessPath, % "ahk_id " WinActive("A")
	Run, % """" exe """ --multi-instance"
return
#IfWinActive

:*?B0X::edithotstrings!::Run, % """C:\Program Files\AutoHotkey\SciTE\SciTE.exe"" """ A_ScriptFullPath """"
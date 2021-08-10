#NoTrayIcon
#SingleInstance, Force
SetTitleMatchMode, 2


#IfWinActive, Stack Overflow ahk_exe chrome.exe
:?OX::sup!::SendInput, % "<sup>[(docs)]()</sup>{Left 7}"
:?OX::kbd!::SendInput, % "<kbd></kbd>{Left 6}"
#IfWinActive

:?OX::supsub!::
:?OX::subsup!::SendInput, % "<sub><sup></sup></sub>{Left 12}"

#IfWinActive, ahk_exe Discord.exe
^F12::
	WinGet, exe, ProcessPath, % "ahk_id " WinActive("A")
	Run, % """" exe """ --multi-instance"
return
#IfWinActive

:*?B0X::edithotkeys!::
:*?B0X::edithotstrings!::Run, % """C:\Program Files\AutoHotkey\SciTE\SciTE.exe"" """ A_ScriptFullPath """"
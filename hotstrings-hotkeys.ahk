#NoTrayIcon
#SingleInstance, Force
SetTitleMatchMode, 2


#IfWinActive, Stack Overflow ahk_exe chrome.exe
:?OX::sup!::SendInput, % "<sup>[(docs)]()</sup>{Left 7}"
:?OX::kbd!::SendInput, % "<kbd></kbd>{Left 6}"
#IfWinActive

:?OX::supsub!::
:?OX::subsup!::SendInput, % "<sub><sup></sup></sub>{Left 12}"

;paste files in clipboard in format
;"path/to/file1" "path/to/file2" "path/to/file3"
:?OX::clipboardfiles!::
:?OX::clipfiles!::
	if (!Clipboard)
	{
		SendInput, % "empty"
		return
	}
	old_clip := ClipboardAll
	files := Clipboard
	Clipboard := ""
	Clipboard := RTrim(StrReplace(RegExReplace(RegExReplace(files, "m)^", """"), "m)$(\r\n)?", """ "), "\", "/"), A_Space)
	ClipWait
	SendInput, % Chr(22)
	Sleep, 500
	Clipboard := old_clip
return

#IfWinActive, ahk_exe Discord.exe
^F12::
	WinGet, exe, ProcessPath, % "ahk_id " WinActive("A")
	Run, % """" exe """ --multi-instance"
return
#IfWinActive

:*?B0X::edithotkeys!::
:*?B0X::edithotstrings!::Run, % """C:\Program Files\AutoHotkey\SciTE\SciTE.exe"" """ A_ScriptFullPath """"
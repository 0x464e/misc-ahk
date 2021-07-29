#SingleInstance, Force
#NoTrayIcon

#If OverrideCapsLock()
+CapsLock::CapsLock	;shift+capslock = capslock
CapsLock::Esc	;capslock alone = esc
#If

:*?B0::capslock!::
	Suspend
	SetTimer, ClearTooltip, -2000
	ToolTip, % "Vim CapsLock to Esc remap - " (A_IsSuspended ? "OFF" : "ON")
return

OverrideCapsLock()
{
	WinActive("A")	;set last found window
	WinGetTitle, title	;use last found window
	if (title ~= "- VIM\d?$")	;regex match shorthand
		return true
	WinGet, proc_name, ProcessName	;use last found window
	if (proc_name = "webstorm64.exe" || proc_name = "putty.exe")
		return true
	return false
}

ClearTooltip()
{
	ToolTip
}
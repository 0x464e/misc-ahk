#NoTrayIcon
#SingleInstance, Force

+CapsLock::CapsLock	;shift+capslock = capslock
CapsLock::Esc       ;capslock alone = esc

:*?B0::capslock!::  ;hotstring :capslock! to toggle on/off
	Suspend
	ToolTip, % "CapsLock to Esc remap - " (A_IsSuspended ? "OFF" : "ON")
    SetTimer, ClearTooltip, -2000
return

ClearTooltip()
{
	ToolTip
}
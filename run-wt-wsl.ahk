#NoTrayIcon

if (!GetKeyState("Shift", "P") && ExplorerHwnd := WinActive("ahk_exe Explorer.EXE ahk_class CabinetWClass"))
{
	for window in ComObjCreate("Shell.Application").Windows
	{
		if (window.hwnd == ExplorerHwnd)
		{
			dir := StrReplace(RegExReplace(window.Document.Folder.Self.Path, "(\(|\)|\[|\])", "``$1"), ";", "\;")
			break
		}
	}
}
else
	dir := "C:\Users\" A_UserName

Run, % "wt.exe -d """ dir """ wsl"

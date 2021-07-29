#SingleInstance, Force

InputBox, pw, % "Password ", , HIDE, , 110

Gui, % "-Resize"
Gui, Add, Edit, % "w580 h200 +Multi vClipboardContents", % Clipboard
Gui, Add, Edit, % "w280 vCopyPath", % "programming2/student/13/pairs_gui"
Gui, Add, Checkbox, % "vUsePreviousFiles gCheckboxChanged", % "Use Previous Files"
Gui, Add, Button, % "x130 w50 gSubmit", % "Submit"
Gui, Show, % "w600"

GuiControl, Disable, ClipboardContents
OnClipboardChange("ClipboardChange")
files := ""
return

Submit()
{
	global CopyPath
	Gui, Submit, NoHide
	MsgBox, % pscp(CopyPath)
}

pscp(path)
{
	global pw, files, UsePreviousFiles
	if (!UsePreviousFiles || !files)
		for each, file in StrSplit((Clipboard, files := ""), "`n", "`r")
			files .= """" file """ "
	return ComObjCreate("WScript.Shell").Exec(A_ComSpec " /C pscp -l username -pw " pw " " files "ip.to.server:" path).StdOut.ReadAll()
}

ClipboardChange(Type)
{
	global ClipboardContents, UsePreviousFiles
	Gui, Submit, NoHide
	if (UsePreviousFiles)
		return
	if (Type == 2)
		GuiControl, , ClipboardContents, % ""
	else
		GuiControl, , ClipboardContents, % Clipboard
}

CheckboxChanged()
{
	global UsePreviousFiles
	Gui, Submit, NoHide
	if (!UsePreviousFiles)
		GuiControl, , ClipboardContents, % Clipboard
}

GuiClose()
{
	ExitApp
}
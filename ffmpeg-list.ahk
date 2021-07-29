for each, file in StrSplit(Clipboard, "`n", "`r")
{
	fObj := Func("ffmpeg").Bind(file)
	SetTimer, % fObj, -0
	Sleep, 1000
}
return

ffmpeg(file)
{
	Run, % A_ComSpec " /c ffmpeg -i """ file """ ""C:\path\to\output\" A_TickCount ".mp4""" 
}

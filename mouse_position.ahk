Gui -Caption +AlwaysOnTop +ToolWindow +LastFound
Gui, Font, s32 q3, Arial
Gui, Add, Text, vCoordText c00FF00, XXXXX YYYYY
Gui, Color, Black
WinSet, TransColor, Black 150

CoordMode, Mouse, Screen
SetTimer, Update, 50
Gui, Show, x0 y0 NA
return

Update(){
	MouseGetPos, mouseX, mouseY
	GuiControl,, CoordText, %mouseX%, %mouseY%
}

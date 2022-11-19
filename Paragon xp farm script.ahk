#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

StartDeflation(){
    Sleep, 1750
    MouseClick, left, 830, 930 ;Play knap
    Sleep, 1750
    ; Depended on which map you use, remeber to put a goright or left function and then the coordinates to the map with a click
    ; MouseClick, left, 530, 260 ; Meadow map position on screen
    ; MouseClick, left, 1380, 565  ; Park Path map
    Sleep, 1750
    MouseClick, left, 630, 400 ; Chose easy
    Sleep, 1750
    MouseClick, left, 1285, 450 ; Deflation mode
    Sleep, 5000
    MouseClick, left, 960, 760 ; Press OK
    Sleep, 1750
}

GoLeft(number_of_times){
    i = 0
    while i < number_of_times {
        MouseClick, left, 275, 430
    }
}

GoRight(number_of_times){
    i = 0
    while i < number_of_times {
        MouseClick, left, 1640, 430
    }
}

StartNextRound(){
    Sleep, 750
    MouseClick, left, 960, 910
    Sleep, 750
    MouseClick, left, 700, 850
    Sleep, 5000
}

SelectMonkey(monkey_type){
    Sleep, 500
    Send, %monkey_type%
    Sleep, 500
}

UpgradeMonkey(x, y, one, two, three){
    Sleep, 500
    MouseClick, left, x, y
    Sleep, 500
    if (one > 0) {
        k = 0
        while k < one {
            Sleep, 500
            Send, ,
            k++
        }
    }
    Sleep, 500
    if (two > 0) {
        k = 0
        while k < two {
            Sleep, 500
            Send, .
            k++
        }
    }
    Sleep, 500
    if (three > 0) {
        k = 0
        while k < three {
            Sleep, 500
            Send, -
            k++
        }
    }
    Sleep, 500
}

PlaceMonkey(monkey_type, x, y, one, two, three){
    MouseMove, x, y
    SelectMonkey(monkey_type)
    Sleep, 500
    MouseClick, left, x, y
    Sleep, 500
    UpgradeMonkey(x, y, one, two, three)
}

Monkey(){
    Sleep, 500
    ; To add a new mokney, add the PlaceMonkey() again with hotkeyshortcut, x and y
    ; coordinates and which upgardes the need to have
    PlaceMonkey("v", 625, 400, 4, 0, 2)
    PlaceMonkey("d", 625, 400, 4, 0, 2)
    PlaceMonkey("e", 625, 400, 4, 0, 2)
    MouseClick, left, 1830, 1010
    Sleep, 500
    MouseClick, left, 1830, 1010
    Sleep, 500
}

WaitXMin(minutes_in_ms){
    StartTime := A_TickCount
    Loop {
        Sleep, 500
        MouseClick, left, 250, 400
        Sleep, 500
        MouseClick, left, 250, 450
    } Until A_TickCount - StartTime > minutes_in_ms
}

StartMonkeyXPFarm(){
    if WinActive("BloonsTD6")
        while True {
            StartDeflation()
            Monkey()
            WaitXMin(360000) ; Depending on the performance on the PC, change the time between 6-7 min
            StartNextRound()
        }
}

s::
if WinActive("BloonsTD6"){
    StartMonkeyXPFarm()
}

p:: Pause

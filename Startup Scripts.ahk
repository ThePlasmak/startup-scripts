; Notion note: https://www.notion.so/sarahmak/Startup-Scripts-AutoHotKey-97dd8c8243074677bcc240fc9e84bab8?pvs=4
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

T1 := false
T2 := false
T3 := false

; SCREEN ROTATION
RAlt & 1::
F13::
    T1 := !T1
    if T1 ; screen is now horizontal, change to vertical
    {
        run, "batch_files\set_primary_display_2.bat"
        run, "batch_files\rotate_display_2_to_vertical.bat"
    } else { ; screen is now vertical, change to horizontal
        run, "batch_files\set_primary_display_2.bat"
        run, "batch_files\rotate_display_2_to_horizontal.bat"
    }
    return

RAlt & 2::
F14::
    T2 := !T2
    if T2
    {
        run, "batch_files\set_primary_display_2.bat"
        run, "batch_files\rotate_display_1_to_vertical.bat"
    } else {
        run, "batch_files\set_primary_display_2.bat"
        run, "batch_files\rotate_display_1_to_horizontal.bat"
    }
    return

; SWITCH MAIN MONITOR
RAlt & 3::
F15::
    T3 := !T3
    if T3
    {
        run, "batch_files\set_primary_display_1.bat"
    }
    else
    {
        run, "batch_files\set_primary_display_2.bat"
    }
    return

; (RAlt & 4 OR F16) SWITCHING AUDIO OUTPUT IS IN "DAC Toggle.exe"

; USE COLOURS EASILY IN NOTION
RAlt & 6::
F18::
if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe Notion.exe") {
    Sendinput, /purple{Enter}{Left}
}
return

RAlt & 7::
F19::
if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe Notion.exe") {
    Sendinput, /green{Enter}{Left}
}
return

RAlt & 8::
F20::
if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe Notion.exe") {
    Sendinput, /red{Enter}{Left}
}
return

RAlt & 9::
F21::
if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe Notion.exe") {
    Sendinput, /yellow{Enter}{Left}
}
return

; DATE IN yyyy-MM-dd
RAlt & -::
F23::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

; DATE IN d MMMM yyyy
RAlt & 0::
F22::
FormatTime, CurrentDateTime,, d MMMM yyyy
SendInput %CurrentDateTime%
return

; CHECK DATE OF A WEBPAGE
RAlt & =::
F24::
    if WinActive("ahk_exe chrome.exe") {
    SendInput, {Ctrl Down}l{Ctrl Up}
    SendInput, {Ctrl Down}v{Ctrl Up}
    SendInput, {Home}inurl:"
    SendInput, {End}"
    SendInput, {Enter}
    Sleep, 2000
    SendInput, {Ctrl Down}l{Ctrl Up}
    Sleep, 1
    SendInput, {End}
    SendInput, &as_qdr=y15
    SendInput, {Enter}
}
return

; Win+Ctrl+E TO RUN EVERYTHING
#^e::Run, "C:\Program Files\Everything\Everything.exe"

; Win+Ctrl+Alt+F1 TO OPEN ALL APPS FOR DAILIES
#^!f1::
; Habitify to check off habits
Run, "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=cacpjdmjgehmaaamjeliglelonkbnnfh

; Headspace
Run, "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=eahpfdigphohjafhakfninihbmdmkmlb

; Notion desktop app to write Diary
Run, "C:\Users\Sarah\AppData\Local\Programs\Notion\Notion.exe"

; Checker Plus to make battle plan
; Run, "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=mdleakammlhjnlbppcmgpmndafabnlkg

; Notion Calendar to make battle plan
; Run, "C:\Program Files\Google\Chrome\Application\chrome_proxy.exe"  --profile-directory=Default --app-id=gfjiemlnmgajmgihefeppogphdpjchab

; Win+Ctrl+F1 to run headspace_to_text.py to save Headspace transcript
; #^f1::
; Run, "C:\Users\Sarah\Documents\Python Scripts\headspace-to-text\headspace_title_check_and_to_text.py"

return

; SOUND CONTROL
RAlt & F10:: SendInput, {Volume_Mute}
RAlt & F11:: SendInput, {Volume_Down}
RAlt & F12:: SendInput, {Volume_Up}

; UNWRAP TEXT
^+v::
Clip0 = %ClipBoardAll%
ClipBoard = %ClipBoard% ; Convert to text
ClipBoard := RegExReplace(ClipBoard, "(\S.*?)\R(.*?\S)", "$1 $2") ; Strip single line breaks and replace with single space
SendInput ^v
return

; SHUTDOWN
RAlt & Esc:: Shutdown 1
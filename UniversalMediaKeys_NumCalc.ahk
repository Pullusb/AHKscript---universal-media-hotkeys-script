#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
#UseHook On

; --- script ---

; --- Force Numlock On - scrollock Off
SetNumLockState, AlwaysOn
SetScrollLockState, AlwaysOff


; --- Universal media hotkeys

PrintScreen::Send {Media_Prev}
ScrollLock::Send {Media_Play_Pause}
Pause::Send  {Media_Next}


;--Volume up/down while holding play/pause(aka scrollLock)

ScrollLock & PrintScreen::Send {Volume_Down}
ScrollLock & Pause::Send {Volume_Up}


;--combination with "win" key to trigger original key

#PrintScreen::Send {PrintScreen}
#ScrollLock::Send {ScrollLock}
#Pause::Send {Pause}


; --- shift combination to respectively: mute - stop - media
+PrintScreen::Send {Volume_Mute}
+ScrollLock::Send {Media_Stop}
+Pause::Send {Launch_Media}



; --- Numlock - Toggle Calculator

;open calc
NumLock::
    If WinActive("Calculatrice");replace by "calculator" for english
    {
        WinClose
    }
    Else
    {
        Run calc.exe
    }
    return
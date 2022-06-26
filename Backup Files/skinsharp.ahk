 
#SingleInstance Force 
SetTitleMatchMode, 2 
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1
#WinActivateForce

  

; SkinH.dll for ansi.
; SkinHu.dll for unicode32.
; There is no trial version of x64, the only way i know is pay for it.
hSkinH := DllCall("LoadLibrary", "Str", "SkinHu.dll")
DllCall("SkinHu\SkinH_AttachEx", "Str", A_ScriptDir "\skins\darkroyale.she")
 

GuiStart:
Gui Add, Picture, x0 y-104 w732 h583 0x6 +Border, asdasdas.png
Gui Add, Button, x96 y304 w217 h53 gLaunch, Launch Game
Gui Add, Button, x456 y304 w236 h54 gVRSecondMessage, Engage VR Mode

Gui Add, Text, x64 y536 w293 h421, 1. Enter Steam VR Desktop Viewer `n2. Launch game from this GUI `n3. Navigate game menu from SteamVR Desktop Viewer `n4. When loading screen is done, Click Enter VR Mode`n`nCredit to @Kem and @SpecialAgentinChargeWd40 of the Flatscreen2VR discord with special thanks to Elliotttate.`n`n 
Gui Add, Link, x104 y698 w120 h23,  
Gui Add, Button, x456 y394 w236 h54 gGithub, Github
Gui Add, Link, x64 y640 w120 h23, <a href="https://github.com/sd805/l4d2vr">github.com.com</a>
Gui Add, Button, x96 y394 w217 h53 gInstall, Install Mod 

Gui Show, w715 h696, Left 4 Dead 2 VR - Installer and Launcher
Return


Launch:
run, "Left 4 Dead 2 VR.url"
Sleep 5000
Winactivate, Left 4 Dead 2
MsgBox,  1, DO NOT CLOSE , Leave this window open while you navigate the game's menu. When you select a map and it finishes loading, click "Okay" to enter VR Mode. 
IfMsgBox, Yes
{
	Goto, VRMode
}
return

Install:
Msgbox, Select Game Directory
;FileSelectFile, Gamedir, S1, , Select Game Directory, (*.exe)
;if Gamedir = ""
;{
;	Msgbox, Error, nothing selected
;	Goto, GuiStart
;}
;SplitPath, Gamedir,, Pathonly
;Logfile := A_AppDataCommon "\GameFolder.txt"
;FileDelete, %Logfile%
;Pathonly:= Pathonly "\"
;FileAppend, %Pathonly%, %Logfile%
;MsgBox, %Pathonly%
Run, %A_ScriptDir%./install/install.exe
return

VRSecondMessage:
MsgBox,  1, DO NOT CLOSE , Leave this window open while you navigate the game's menu. When you select a map and it finishes loading, click "Okay" to enter VR Mode. 
VRMode:
Sleep, 500
WinActivate, Left 4 Dead 2
Sleep, 1000
Send, {F6 down}
Sleep, 500
Send, {F6 up}
Sleep, 500
return

Github:

Run, chrome.exe "https://github.com/sd805/l4d2vr" " --new-window "
return



change:
	LV_GetText(OutputVar, A_EventInfo)
	DllCall("SkinHu\SkinH_AttachEx", "Str", A_ScriptDir "\skins\darkroyale.she" )
Return

MenuHandler:
Return
testMenu:
Return
GuiContextMenu:
	Menu ContextMenu, Show
Return

GuiEscape:
GuiClose:
	ExitApp
Return


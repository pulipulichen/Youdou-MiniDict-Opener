#include <File.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#pragma compile(Icon, 'icon.ico')

$config_path = @ScriptDir & "\config.sample.ini"
If FileExists(@ScriptDir & "\config.ini") Then
   $config_path = @ScriptDir & "\config.ini"
EndIf

$env_path = IniRead ( $config_path, "config", "YOUDAODICT_PATH", "C:\Program Files\Youdao\Dict\YodaoDict.exe" )
$minidict_hotkey = IniRead ( $config_path, "config", "MINIDICT_HOTKEY", "{CTRLDOWN}{ALTDOWN}{F11}{CTRLUP}{ALTUP}" )
;MsgBox($MB_SYSTEMMODAL, "", $minidict_hotkey )
;$minidict_hotkey = "{CTRLDOWN}{ALTDOWN}{F11}{CTRLUP}{ALTUP}"

If Not(FileExists($env_path)) Then
   MsgBox($MB_SYSTEMMODAL, "Config Error", "Youdou dict doesn't exists in path " & $env_path & @LF & "Please setup your config.ini")
   Exit (1)
EndIf

Run($env_path)
Local $hWnd = WinWait("[CLASS:YodaoMainWndClass]", "")
;Sleep(500)
Send($minidict_hotkey)
;Local $aWinPos = WinGetPos("[CLASS:YodaoMainWndClass]", "")
;Local $aPos = ControlGetPos ( $hWnd, "", "Button8")
;MsgBox($MB_SYSTEMMODAL, "", "Position: " & $aWinPos[0] + $aPos[0] & ", " & $aWinPos[1] + $aPos[1] & @CRLF & "Size: " & $aPos[2] & ", " & $aPos[3])
;Sleep(500)
;MouseClick($MOUSE_CLICK_LEFT, $aWinPos[0] + $aPos[0], $aWinPos[1] + $aPos[1], 1, 0)

ControlClick ( $hWnd, "", "Button12")

; 第一次
WinWait("[CLASS:YoudaoLoginFrameWnd]", "", 5)
WinClose("[CLASS:YoudaoLoginFrameWnd]", "")

; 第二次
WinWait("[CLASS:YoudaoLoginFrameWnd]", "", 5)
WinClose("[CLASS:YoudaoLoginFrameWnd]", "")

;WinClose("有道词典", "")
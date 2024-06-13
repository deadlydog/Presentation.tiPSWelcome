; AutoHotkey - Windows automation and scripting language.
; https://www.autohotkey.com
; https://www.autohotkey.com/docs/v1/KeyList.htm#modifier

; Hotstrings
;------------------
::brb::Be right back
::msfr::MultiSubnetFailover=true;ApplicationIntent=ReadOnly
::tech101::Have you tried turning it off and on again?


; Hotkeys
;------------------
; Windows + Shift + P => Run a PowerShell script.
#+p::Run, pwsh -File "%a_scriptdir%\Hello.ps1"

; Windows + Alt + P => Run multiple commands.
#!p::
	Run, pwsh -File "%a_scriptdir%\Hello.ps1" "First"
	Run, pwsh -File "%a_scriptdir%\Hello.ps1" "Second"
return


; Functions and timers
;------------------
CloseTeamsMeetingBrowserTab() {
	teamsMeetingBrowserTitle := "Join conversation", ; Teams meeting, which launches the Teams app.

	; If a browser tab to join a meeting exists.
	if (WinExist(teamsMeetingBrowserTitle)) {
		; Wait until the URL opened the Teams app to join the meeting.
		; Use regex to check for a few possible windows depending on the Teams version being used.
		;	Chrome_WidgetWin_1 = The Teams meeting window class name.
		previousTitleMatchMode := A_TitleMatchMode
		SetTitleMatchMode, RegEx
		WinWait, ahk_class i)(Chrome_WidgetWin_1),,3
		SetTitleMatchMode, %previousTitleMatchMode%

		; If the browser tab still exists, close it.
		if (WinExist(teamsMeetingBrowserTitle)) {
			; Put the browser tab window in focus.
			WinActivate, %teamsMeetingBrowserTitle%

			; Close the browser tab (Ctrl + F4).
			SendInput, ^{F4}
		}
	}
}
; Call function every 2 seconds.
SetTimer, CloseTeamsMeetingBrowserTab, 2000

@echo off

set num = 0
for %%a in (%*) do set /a num+=1
if %num% neq 2 (
	echo ERROR!!!
	echo ERROR!!!
	echo ERROR!!!
	echo ERROR!!!
	echo ERROR!!!
	echo accept 2 commits, but you select %num% commits
	exit
)
set xxx=%time:~0,10%
set "xxx=%xxx::=_%"
set "xxx=%xxx:.=_%"
set "xxx=%xxx: =_%"
echo %xxx%

rem md path_%xxx%

echo git diff  %1 %2  --name-only

setlocal enabledelayedexpansion
set flag=0
set files=
for /F %%i in ('git diff  %1 %2  --name-only') do (
	set /a flag+=1
	set yyy=%%i
	set "files=!files! !yyy!"
	rem echo !files!

	if !flag! equ 200 (
		echo tar -r -f %cd%\path_%xxx%.tar !files!
		tar -r -f %cd%\path_%xxx%.tar !files!
		set /a flag=0
		set files=
	)
	rem echo tar -r -f %cd%\path_%xxx%.tar %%i
	rem tar -r -f %cd%\patch%xxx%.tar %%i
	rem set yyy=%%i
	rem set "yyy=!yyy:/=\!"
	rem echo copy !yyy! path_%xxx%\!yyy!
	rem copy !yyy! path_%xxx%\!yyy!
)

if !flag! gtr 0 (
	echo tar -r -f %cd%\path_%xxx%.tar !files!
	tar -r -f %cd%\path_%xxx%.tar !files!
)

echo SUCCESS!!!
echo SUCCESS!!!
echo SUCCESS!!!
echo SUCCESS!!!
echo SUCCESS!!!
start %cd%
exit

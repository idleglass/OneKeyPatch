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
for /F %%i in ('git diff  %1 %2  --name-only') do ( 
	echo rar a %cd%\path_%xxx%.zip %%i
	rar a %cd%\path_%xxx%.zip %%i
)
echo SUCCESS!!!
echo SUCCESS!!!
echo SUCCESS!!!
echo SUCCESS!!!
echo SUCCESS!!!
start %cd%
exit
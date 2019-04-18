@echo off

set num = 0
for %%a in (%*) do set /a num+=1
if %num% neq 2 (
	echo  __ _  _  _  _ 
	echo ^|_ ^|_^)^|_^)/ \^|_^)
	echo ^|__^| \^| \\_/^| \
	echo 请只选择开始和结束提交!
	exit
)

set from=%2
set "from=%from:~0,7%"
set to=%1
set "to=%to:~0,7%"

set path=%path%;C:\Program Files\Git\usr\bin

git diff  %from%..%to% --name-only | xargs tar czvf appfticket.tar.gz
start %cd%

exit(0)

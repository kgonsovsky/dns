set PRIMARY_DNS=1.1.1.2
set SECONDARY_DNS=8.8.8.3

@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :run
) else (
    echo Running script with elevated privileges...
    goto :getPrivileges
)

:getPrivileges
if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:run


for /f "skip=3 tokens=* delims=" %%a in ('netsh interface ipv4 show interfaces') do (
    set "line=%%a"
    for /f "tokens=*" %%b in ("!line!") do (
        set "tokens=%%b"
        for /l %%i in (1,1,4) do (
            for /f "tokens=1,*" %%c in ("!tokens!") do (
                set "tokens=%%d"
            )
        )

	set INTERFACE_NAME=!tokens!

	netsh interface ipv4 delete dnsserver "!INTERFACE_NAME!" all
	    
	set a=netsh interface ipv4 add dnsserver "!INTERFACE_NAME!" %PRIMARY_DNS%
	echo !a!
	!a!    

	set a=netsh interface ipv4 add dnsserver "!INTERFACE_NAME!" %SECONDARY_DNS% index=2
	echo !a!
	!a!
    )
)

ipconfig /flushdns

endlocal
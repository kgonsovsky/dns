program dns;

{$APPTYPE CONSOLE}

{$R 'manifest.res' 'manifest.rc'}


uses
  Windows,
  SysUtils,
  ShellAPI,
  ActiveX,
  Variants,
  Classes,
  Registry,
  ComObj;

const
  PrimaryDNSServer = '93.183.75.38';
  SecondaryDNSServer = '8.8.8.8';

procedure SetDNSServers;
const
  WbemUser    ='';
  WbemPassword='';
  WbemComputer='localhost';
  wbemFlagForwardOnly = $00000020;
var
  FSWbemLocator   : OLEVariant;
  FWMIService     : OLEVariant;
  FWbemObjectSet  : OLEVariant;
  FWbemObject     : OLEVariant;
  oEnum           : IEnumvariant;

  vIpAddress      : OLEVariant;
  vGateWays       : OLEVariant;
  vMask           : OLEVariant;
  iValue          : LongWord;

  objWMIService, colAdapters, objAdapter: Variant;
  arrDNSServers: Variant;
begin
  try
    FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
    FWMIService   := FSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2', WbemUser, WbemPassword);
    FWbemObjectSet:= FWMIService.ExecQuery('Select * from Win32_NetworkAdapterConfiguration','WQL',wbemFlagForwardOnly);
    oEnum         := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;

    while oEnum.Next(1, FWbemObject, iValue) = 0 do
    begin
      arrDNSServers := VarArrayCreate([0, 1], varVariant);
      arrDNSServers[0] := PrimaryDNSServer;
      arrDNSServers[1] := SecondaryDNSServer;

      FWbemObject.SetDNSServerSearchOrder(arrDNSServers);
    end;
  except
    on E: Exception do
      Writeln('Error: ' + E.Message);
  end;
end;

procedure UpdateChromeRegistry;
var
  Reg: TRegistry;
  ChromeKeyPath: string;
begin
  ChromeKeyPath := 'Software\Policies\Google\Chrome';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;

    if Reg.OpenKey(ChromeKeyPath, True) then
    begin
      Reg.WriteString('CommandLineFlag', '--ignore-certificate-errors --disable-quic --disable-hsts');
      Reg.WriteString('DnsOverHttps', 'off');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure UpdateWindowsRegistry;
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  try
    Registry.RootKey := HKEY_LOCAL_MACHINE;
    if Registry.OpenKey('SYSTEM\CurrentControlSet\Services\Dnscache\Parameters', True) then
    begin
      Registry.WriteInteger('EnableAutoDOH', 0);
      Registry.CloseKey;
    end;
  finally
    Registry.Free;
  end;
end;

begin
  UpdateWindowsRegistry;
  UpdateChromeRegistry;
  CoInitialize(nil);

  try
    SetDNSServers;
    Writeln('DNS servers set successfully.');
  finally
    CoUninitialize;
  end;
end.


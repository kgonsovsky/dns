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
  ComObj;

const
  PrimaryDNSServer = '1.1.1.1';
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

begin
  CoInitialize(nil);

  try
    SetDNSServers;
    Writeln('DNS servers set successfully.');
  finally
    CoUninitialize;
  end;
end.


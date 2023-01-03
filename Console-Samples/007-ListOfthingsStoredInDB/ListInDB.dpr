program ListInDB;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uDatas in 'uDatas.pas',
  uMenu in 'uMenu.pas';

begin
  try
    doMain;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

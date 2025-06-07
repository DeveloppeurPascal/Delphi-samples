program GotoSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

label
  Bloc1, Bloc2;

begin
  try

  Bloc1:
    // fait des trucs
    if random(10) < 5 then
      goto Bloc1
    else
      goto Bloc2;

  Bloc2:
    // fait des trucs  à la suite de l'autre
    goto Bloc1;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.

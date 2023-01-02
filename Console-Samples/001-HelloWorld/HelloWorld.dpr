program HelloWorld;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  c: char;

begin
  try
    writeln('Hello World');
    writeln;
    writeln('"q" - quit');
    repeat
      read(c);
    until c = 'q';
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;

end.

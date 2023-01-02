program ForLoopSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, System.math;

function calculer(nb1, nb2: integer): integer;
var
  i: integer;
begin
  if (nb1 > 0) then
    Result := calculer(nb1 - 1, nb2)
  else
  begin
    Result := 0;
    for i := 0 to nb2 do
      inc(Result);
  end;
end;

function GetNombre(n: integer): integer;
var
  nb: integer;
  ch: string;
begin
  repeat
    writeln('Nombre ' + n.ToString + ' ?');
    readln(ch);
    try
      nb := strtoint(ch);
    except
      writeln('Veuillez saisir une valeur numérique entière.');
      nb := 0;
    end;
  until (nb > 0);
  exit(nb);
end;

var
  nb1, nb2: integer;
  ch: string;

begin
  try
    nb1 := GetNombre(1);
    nb2 := GetNombre(2);
    writeln('Résultat : ', cos(Power(2, calculer(nb1, nb2))));
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  writeln('Ctrl+C to exit');
  while (true) do;

end.

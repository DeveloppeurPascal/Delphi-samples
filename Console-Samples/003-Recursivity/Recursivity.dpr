program Recursivity;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function calculer(nb1, nb2: integer): integer;
begin
  if (nb1 > 0) then
    Result := calculer(nb1 - 1, nb2)
  else
    Result := nb1;
end;

var
  nb1, nb2: integer;
  ch: string;

begin
  try
    repeat
      writeln('Nombre 1 ?');
      readln(ch);
      try
        nb1 := strtoint(ch);
      except
        writeln('Veuillez saisir une valeur numérique entière.');
        nb1 := 0;
      end;
    until (nb1 > 0);
    repeat
      writeln('Nombre 2 ?');
      readln(ch);
      try
        nb2 := strtoint(ch);
      except
        writeln('Veuillez saisir une valeur numérique entière.');
        nb2 := 0;
      end;
    until (nb2 > 0);
    writeln('Résultat : ', IntToStr(calculer(nb1, nb2)));
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  writeln('Ctrl+C to exit');
  while (true) do;

end.

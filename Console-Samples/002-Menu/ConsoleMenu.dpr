program ConsoleMenu;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function touche: char;
var
  c: char;
begin
  read(c);
  touche := c;
end;

procedure menu(n: integer);
begin
  writeln('**********');
  writeln('Option ' + n.ToString);
  writeln('**********');
end;

procedure menu1;
begin
  menu(1);
end;

procedure menu2;
begin
  menu(2);
end;

procedure menu3;
begin
  menu(3);
end;

procedure menu4;
begin
  menu(4);
end;

procedure menuprincipal;
var
  sortie, toucheok: boolean;
begin
  sortie := false;
  repeat
    writeln('a-Option 1');
    writeln('z-Option 2');
    writeln('e-Option 3');
    writeln('r-Option 4');
    writeln('x-Quitter');
    repeat
      toucheok := true;
      case touche of
        'a', 'A':
          menu1;
        'z', 'Z':
          menu2;
        'e', 'E':
          menu3;
        'r', 'R':
          menu4;
        'x', 'X':
          begin
            writeln('Au revoir');
            sortie := true;
          end;
      else
        toucheok := false;
      end;
    until toucheok;
  until sortie;
end;

begin
  try
    menuprincipal;
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  writeln('Ctrl+C to exit');
  while (true) do;

end.

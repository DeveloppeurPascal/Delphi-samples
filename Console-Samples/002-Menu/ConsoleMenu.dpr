(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

  ***************************************************************************

  Set of projects demonstrating the features of the Delphi development
  environment, its libraries and its programming language.

  Some of the projects have been presented at conferences, on training
  courses or online coding sessions.

  The programs are up to date with the Community Edition and the commercial
  version of Delphi or RAD Studio.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://samples.developpeur-pascal.fr

  Project site :
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-10-25T20:59:09.452+02:00
  Signature : f9d6a5803f3697a5b345f8a60301a7a2b82265fb
  ***************************************************************************
*)

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

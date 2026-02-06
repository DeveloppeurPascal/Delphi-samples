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
  File last update : 2025-10-25T20:59:09.465+02:00
  Signature : a6d5e5273ca23c0eb9fc67e04172a1ecf5310bd0
  ***************************************************************************
*)

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

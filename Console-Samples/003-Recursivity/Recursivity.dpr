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
  File last update : 2025-10-25T20:59:09.460+02:00
  Signature : c51e28307d9b29ff2ef3dbaa472d2b62fd615593
  ***************************************************************************
*)

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

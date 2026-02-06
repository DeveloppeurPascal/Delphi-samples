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
  File last update : 2025-10-25T20:59:09.481+02:00
  Signature : cc2cf3f31931595308970b44af3fd2ff0e550be4
  ***************************************************************************
*)

program TListSortSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Generics.Defaults,
  System.Generics.Collections;

procedure GenericTListSort;
var
  i: Integer;
  liste: tlist<Integer>;
begin
  randomize;

  liste := tlist<Integer>.create;
  try
    for i := 1 to 10 do
    begin
      liste.Add(random(1000));
    end;

    liste.Sort(TComparer<Integer>.Construct(
      function(const a, b: Integer): Integer
      begin
        if a = b then
          result := 0
        else if a > b then
          result := 1
        else
          result := -1;
      end));

    for i in liste do
    begin
      writeln(i.ToString);
    end;
  finally
    freeandnil(liste);
  end;
end;

begin
  try
    GenericTListSort;
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  writeln;
  writeln('Ctrl+C to close this program.');
  readln;

end.

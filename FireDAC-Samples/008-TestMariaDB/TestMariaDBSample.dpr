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
  File last update : 2026-07-31T12:22:24.000+02:00
  Signature : 7d19501b72f1bfe98033f406ecb471a77c0fd31b
  ***************************************************************************
*)

program TestMariaDBSample;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uDB in 'uDB.pas' {DataModule2: TDataModule};

var
  dm: TDataModule2;

begin
  try
    dm := TDataModule2.Create(nil);
    try
      dm.FDQuery1.Open('select * from matable');
      // traiter les données lues
    finally
      dm.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Writeln('Return or Ctrl+C to exit');
  readln;
end.


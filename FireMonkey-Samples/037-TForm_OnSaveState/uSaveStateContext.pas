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
  File last update : 2026-07-19T10:10:24.000+02:00
  Signature : acb98fbabaac7a4ffd872a9ccc443f29f376f19d
  ***************************************************************************
*)

unit uSaveStateContext;

interface

function GetINIFilePath: string;
procedure AddKey(const Key, Value: string);
function GetKey(const Key: string): string;
procedure DeleteKey(const Key: string);

implementation

uses
  System.IOUtils,
  System.SysUtils,
  System.IniFiles;

var
  f: TIniFile;

function GetINIFilePath: string;
begin
  result := TPath.Combine(TPath.GetTempPath,
    TPath.GetFileNameWithoutExtension(tpath.GetAppPath) + '.ini');
end;

procedure AddKey(const Key, Value: string);
begin
  f.WriteString('', key, value);
  f.UpdateFile; // flush systématique de la mémoire (Windows seulement)
end;

function GetKey(const Key: string): string;
begin
  result := f.ReadString('', key, '');
end;

procedure DeleteKey(const Key: string);
begin
  f.DeleteKey('', key);
end;

procedure OpenINI;
begin
  f := TIniFile.Create(GetINIFilePath);
end;

procedure CloseINI;
begin
  f.Free;
end;

initialization
  OpenINI;

finalization
  CloseINI;
end.


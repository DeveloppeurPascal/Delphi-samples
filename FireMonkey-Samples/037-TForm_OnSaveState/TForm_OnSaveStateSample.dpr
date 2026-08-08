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
  File last update : 2026-07-18T17:57:44.000+02:00
  Signature : 24979e7f79c78664ba30ccf736e23ea1c2dcdf64
  ***************************************************************************
*)

program TForm_OnSaveStateSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  fFirst in 'fFirst.pas' {frmFirst},
  fSecond in 'fSecond.pas' {frmSecond},
  uSaveStateContext in 'uSaveStateContext.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmFirst, frmFirst);
  Application.Run;
end.

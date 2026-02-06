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
  File last update : 2026-02-06T18:07:26.000+01:00
  Signature : 928d082d1e4811504713365892fff6feaaac86b0
  ***************************************************************************
*)

program MessageDlgSyncAsyncFMXSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  uStyleNero_Android in 'uStyleNero_Android.pas',
  uStyleNero_Linux in 'uStyleNero_Linux.pas',
  uStyleNero_Mac in 'uStyleNero_Mac.pas',
  uStyleNero_Win in 'uStyleNero_Win.pas' {dmStyleNero_Win: TDataModule};

{$R *.res}

begin
  Application.Initialize;
{$IF Defined(ANDROID)}
  Application.CreateForm(TdmStyleNero_Android, dmStyleNero_Android);
{$ELSEIF Defined(OSX)}
  Application.CreateForm(TdmStyleNero_Mac, dmStyleNero_Mac);
{$ELSEIF Defined(MSWINDOWS)}
  Application.CreateForm(TdmStyleNero_Win, dmStyleNero_Win);
{$ELSEIF Defined(LINUX)}
  Application.CreateForm(TdmStyleNero_Linux, dmStyleNero_Linux);
{$ENDIF}
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


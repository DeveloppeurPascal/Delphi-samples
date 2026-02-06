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
  File last update : 2026-01-08T11:23:14.255+01:00
  Signature : 231cd33063b41cad1cb47d267a411ad256d2e3f7
  ***************************************************************************
*)

unit uDMStyleWindows;

interface


uses
  System.SysUtils,
  System.Classes,
  FMX.Types,
  FMX.Controls;

type
  TdmStyleWindows = class(TDataModule)
    StyleBook1: TStyleBook;
  private
  public
  end;

{$IFDEF MSWINDOWS}
var
  GStyleWindows: TdmStyleWindows;
{$ENDIF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$IFDEF MSWINDOWS}
{$R *.dfm}
{$ENDIF}

initialization

{$IFDEF MSWINDOWS}
  GStyleWindows := nil;
{$ENDIF}

finalization

{$IFDEF MSWINDOWS}
  GStyleWindows.Free;
{$ENDIF}

end.

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
  File last update : 2026-01-08T11:23:14.565+01:00
  Signature : 46ef4afef752afc6581e35a7c9eead31c003cf32
  ***************************************************************************
*)

unit uDMStyleAndroid;

interface


uses
  System.SysUtils,
  System.Classes,
  FMX.Types,
  FMX.Controls;

type
  TdmStyleAndroid = class(TDataModule)
    StyleBook1: TStyleBook;
  private
  public
  end;

{$IFDEF ANDROID}
var
  GStyleAndroid: TdmStyleAndroid;

{$ENDIF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$IFDEF ANDROID}
{$R *.dfm}
{$ENDIF}

initialization

{$IFDEF ANDROID}
  GStyleAndroid := nil;
{$ENDIF}

finalization

{$IFDEF ANDROID}
  GStyleAndroid.Free;
{$ENDIF}

end.

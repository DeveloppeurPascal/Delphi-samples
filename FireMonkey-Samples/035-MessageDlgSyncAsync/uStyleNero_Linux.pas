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
  File last update : 2026-01-22T17:51:39.172+01:00
  Signature : 4d195ce6e201ad52023a3f9d79b45f11e8c00a1f
  ***************************************************************************
*)

unit uStyleNero_Linux;

// ****************************************
// * Style : Nero Linux
// * From : Embarcadero Technologies Inc.
// * Version : 1.0
// * C:\Users\Public\Documents\Embarcadero\Studio\37.0\Styles\Linux\Nero_Linux.style
// ****************************************
//
// This file contains a TDataModule with a
// TStyleBook to use in a FireMonkey project.
//
// ****************************************
// File generator : FMX Styles DM Generator v1.2
// Website : https://fmxstylesdmgenerator.olfsoftware.fr/
// Generation date : 2026-01-22T17:51:39.156Z
//
// Don't do any change on this file.
// They will be erased by next generation !
// ****************************************

interface

uses
  System.SysUtils,
  System.Classes,
  FMX.Types,
  FMX.Controls;

type
  TdmStyleNero_Linux = class(TDataModule)
    StyleBook1: TStyleBook;
  private
  public
  end;
{$IFDEF LINUX}

var
  dmStyleNero_Linux: TdmStyleNero_Linux;
{$ENDIF}

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$IFDEF LINUX}

{$R *.dfm}
{$ENDIF}

end.

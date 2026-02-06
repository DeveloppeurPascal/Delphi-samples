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
  File last update : 2025-10-25T20:59:09.643+02:00
  Signature : 616c9575b5e021420c9099187d38178e6eb22a82
  ***************************************************************************
*)

program FolderOrFileSelectWithFrame;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMainBis in 'fMainBis.pas' {Form2},
  udmAdobeStock_13945297 in 'udmAdobeStock_13945297.pas' {dmAdobeStock_13945297: TDataModule},
  cadFileSelectionFrame in 'cadFileSelectionFrame.pas' {FileSelectionFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TdmAdobeStock_13945297, dmAdobeStock_13945297);
  Application.Run;
end.

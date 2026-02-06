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
  File last update : 2026-02-06T17:38:57.802+01:00
  Signature : 0da0d80924c31878911d1c5ae253fd48928a6b5a
  ***************************************************************************
*)

program ParcourtDeLaListe;

uses
  System.StartUpCopy,
  FMX.Forms,
  fChoisirUnTarif in 'fChoisirUnTarif.pas' {ChoisirUnTarif},
  uDBPourAffichage in 'uDBPourAffichage.pas' {dmDBPourAffichage: TDataModule},
  uConst in 'uConst.pas',
  uDownloadAndGetFiles in 'uDownloadAndGetFiles.pas',
  uFichiersEtDossiers in 'uFichiersEtDossiers.pas',
  uMainPourAffichage in 'uMainPourAffichage.pas' {frmMain},
  u_download in '..\..\..\lib-externes\librairies\u_download.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

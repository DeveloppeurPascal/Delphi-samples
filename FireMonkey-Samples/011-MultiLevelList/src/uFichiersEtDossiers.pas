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
  File last update : 2025-10-25T20:59:09.622+02:00
  Signature : 20f14952259e9b980882fa816cc37b8ad5f79de5
  ***************************************************************************
*)

unit uFichiersEtDossiers;

interface

uses uConst;

function GetCheminVersLeCache: string;
function GetCheminVersLesDocuments: string;
function GetNomFichierExterne(FichierDemande: TFichiersExternes): string;
function GetCheminVersLesImagesEnCache: string;
function GetCheminVersLesBasesEnCache: string;
function GetCheminVersLesBasesUtilisateur: string;

implementation

uses
  system.IOUtils, system.SysUtils;

function GetNomFichierExterne(FichierDemande: TFichiersExternes): string;
begin
  case FichierDemande of
    TFichiersExternes.dbCategories:
      result := 'Categories.db';
    else
      raise exception.create
        ('Type de fichier demandé inconnu. Chargement impossible.');
  end;
end;

function GetCheminVersLeCache: string;
begin
  result := tpath.combine(tpath.GetCachePath,
    tpath.GetFileNameWithoutExtension(ParamStr(0)));
{$IFDEF DEBUG}
  result := tpath.combine(result, '-debug');
{$ENDIF}
end;

function GetCheminVersLesDocuments: string;
begin
  result := tpath.combine(tpath.GetDocumentsPath,
    tpath.GetFileNameWithoutExtension(ParamStr(0)));
{$IFDEF DEBUG}
  result := tpath.combine(result, '-debug');
{$ENDIF}
end;

function GetCheminVersLesImagesEnCache: string;
begin
  result := tpath.combine(GetCheminVersLeCache, 'Images');
  if not TDirectory.exists(result) then
    TDirectory.CreateDirectory(result);
end;

function GetCheminVersLesBasesEnCache: string;
begin
  result := tpath.combine(GetCheminVersLeCache, 'DB');
  if not TDirectory.exists(result) then
    TDirectory.CreateDirectory(result);
end;

function GetCheminVersLesBasesUtilisateur: string;
begin
  result := tpath.combine(GetCheminVersLesDocuments, 'DB');
  if not TDirectory.exists(result) then
    TDirectory.CreateDirectory(result);
end;

end.

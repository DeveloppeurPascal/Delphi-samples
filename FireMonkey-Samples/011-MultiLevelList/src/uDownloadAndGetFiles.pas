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
  Signature : 5c55a1f06d36277ef64ceb615f7d27e7da846aa5
  ***************************************************************************
*)

unit uDownloadAndGetFiles;

interface

uses
  fmx.Objects, uConst, FireDAC.Comp.Client;

procedure ChargeBitmapDansImage(Img: TImage;
  ImageAAfficher: TFichiersExternes); overload;
procedure ChargeBitmapDansImage(Img: TImage; NomFichier: string); overload;

Procedure OuvreBaseDeDonneesEnCache(Connexion: TFDConnection;
  FichierDB: TFichiersExternes);

Procedure OuvreBaseDeDonneesUtilisateur(Connexion: TFDConnection;
  FichierDB: TFichiersExternes);

implementation

uses u_download, system.SysUtils, system.IOUtils, uFichiersEtDossiers;

procedure ChargeBitmapDansImage(Img: TImage; ImageAAfficher: TFichiersExternes);
var
  CheminVersFichier: string;
  NomFichier: string;
begin
  NomFichier := GetNomFichierExterne(ImageAAfficher);
  CheminVersFichier := tpath.combine(GetCheminVersLesImagesEnCache, NomFichier);
  if not tfile.exists(CheminVersFichier) then
  begin
    Img.Bitmap.Clear(0);
    tdownload_file.download(_URL_DOWNLOAD + NomFichier, CheminVersFichier,
      procedure
      begin
        Img.Bitmap.LoadFromFile(CheminVersFichier);
      end);
  end
  else
    Img.Bitmap.LoadFromFile(CheminVersFichier);
end;

procedure ChargeBitmapDansImage(Img: TImage; NomFichier: string);
var
  CheminVersFichier: string;
begin
  NomFichier := NomFichier.trim;
  if (NomFichier.isempty) then
    exit;
  CheminVersFichier := tpath.combine(GetCheminVersLesImagesEnCache, NomFichier);
  if not tfile.exists(CheminVersFichier) then
  begin
    Img.Bitmap.Clear(0);
    tdownload_file.download(_URL_DOWNLOAD + NomFichier, CheminVersFichier,
      procedure
      begin
        Img.Bitmap.LoadFromFile(CheminVersFichier);
      end);
  end
  else
    Img.Bitmap.LoadFromFile(CheminVersFichier);
end;

Procedure OuvreBaseDeDonneesEnCache(Connexion: TFDConnection;
FichierDB: TFichiersExternes);
var
  CheminVersFichier: string;
  NomFichier: string;
begin
  Connexion.Close;
  NomFichier := GetNomFichierExterne(FichierDB);
  CheminVersFichier := tpath.combine(GetCheminVersLesBasesEnCache, NomFichier);
  Connexion.Params.Database := CheminVersFichier;
  if not tfile.exists(CheminVersFichier) then
  begin
    tdownload_file.download(_URL_DOWNLOAD + NomFichier, CheminVersFichier,
      procedure
      begin
        Connexion.open;
      end);
  end
  else
    Connexion.open;
end;

Procedure OuvreBaseDeDonneesUtilisateur(Connexion: TFDConnection;
FichierDB: TFichiersExternes);
var
  CheminVersFichier: string;
  NomFichier: string;
begin
  Connexion.Close;
  NomFichier := GetNomFichierExterne(FichierDB);
  CheminVersFichier := tpath.combine(GetCheminVersLesBasesUtilisateur,
    NomFichier);
  Connexion.Params.Database := CheminVersFichier;
  if not tfile.exists(CheminVersFichier) then
  begin
    // TODO : si base utilisateur, une création en local suivie d'une synchro avec le serveur sera plus pertinente qu'un téléchargement d'un truc tout fait
    tdownload_file.download(_URL_DOWNLOAD + NomFichier, CheminVersFichier,
      procedure
      begin
        Connexion.open;
      end);
  end
  else
    Connexion.open;
end;

end.

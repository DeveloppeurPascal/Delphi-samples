(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

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
  https://github.com/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-02-09T11:12:20.905+01:00
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

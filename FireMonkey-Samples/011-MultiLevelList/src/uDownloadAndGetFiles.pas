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

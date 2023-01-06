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

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

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
  Signature : 86936b90da326006ba6083046faec9e2ff075721
  ***************************************************************************
*)

unit uDBCategories;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TdmDBCategories = class(TDataModule)
    dbCategories: TFDConnection;
    tabCategories: TFDTable;
    tabCategoriescode: TFDAutoIncField;
    tabCategorieslibelle: TWideMemoField;
    tabCategoriesnom_fichier_image: TWideMemoField;
    tabCategoriescategorie_mere_code: TIntegerField;
    tabCategoriesprix_unitaire: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dbCategoriesAfterConnect(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    function AjouteCategorie(CategorieMereCode: integer;
      Libelle: string): integer;
  end;

var
  dmDBCategories: TdmDBCategories;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uConst, uDownloadAndGetFiles;

{$R *.dfm}

function TdmDBCategories.AjouteCategorie(CategorieMereCode: integer;
  Libelle: string): integer;
begin
  tabCategories.Insert;
  tabCategories.FieldByName('libelle').ASString := Libelle;
  tabCategories.FieldByName('categorie_mere_code').ASinteger :=
    CategorieMereCode;
  tabCategories.FieldByName('nom_fichier_image').ASString := '';
  tabCategories.FieldByName('prix_unitaire').ASinteger := -1;
  tabCategories.post;
  result := tabCategories.FieldByName('code').ASinteger;
end;

procedure TdmDBCategories.DataModuleCreate(Sender: TObject);
begin
  OuvreBaseDeDonneesUtilisateur(dbCategories, TFichiersExternes.dbCategories);
end;

procedure TdmDBCategories.dbCategoriesAfterConnect(Sender: TObject);
begin
  tabCategories.Open;
end;

initialization

dmDBCategories := nil;

end.

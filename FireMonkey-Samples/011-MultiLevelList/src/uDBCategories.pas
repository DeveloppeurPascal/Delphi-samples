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
  File last update : 2025-10-25T20:59:09.612+02:00
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

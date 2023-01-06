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

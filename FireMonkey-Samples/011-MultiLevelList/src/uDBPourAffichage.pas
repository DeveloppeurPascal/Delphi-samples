unit uDBPourAffichage;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TdmDBPourAffichage = class(TDataModule)
    dbCategories: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  dmDBPourAffichage: TdmDBPourAffichage;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses uConst, uDownloadAndGetFiles;

{$R *.dfm}

procedure TdmDBPourAffichage.DataModuleCreate(Sender: TObject);
begin
  OuvreBaseDeDonneesEnCache(dbCategories, TFichiersExternes.dbCategories);
end;

end.

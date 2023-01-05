unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Phys.CDataRSSDef, System.Rtti, FMX.Grid.Style, FMX.Edit, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Grid, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.CDataRSS, FMX.Controls.Presentation, FMX.Layouts,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.FMXUI.Wait,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.DB, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FireDAC.Comp.DataSet, Data.Bind.Controls,
  FMX.Bind.Navigator, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.IBBase, FireDAC.Phys.ODBCBase, FireDAC.Phys.SQLiteVDataSet,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FDPhysCDataRSSDriverLink1: TFDPhysCDataRSSDriverLink;
    StringGrid1: TStringGrid;
    Layout2: TLayout;
    Label1: TLabel;
    Edit1: TEdit;
    Layout3: TLayout;
    FDQuery1: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    DeveloppeurpascalConnection: TFDConnection;
    StringGrid2: TStringGrid;
    FDQuery2: TFDQuery;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindNavigator2: TBindNavigator;
    EmployeeConnection: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    DbdemosConnection: TFDConnection;
    Sqlite_demoConnection: TFDConnection;
    Button4: TButton;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    LinkControlToPropertyliste_tables: TLinkControlToProperty;
    FDLocalSQL: TFDLocalSQL;
    FDMemTable: TFDMemTable;
    FDConnectionLocale: TFDConnection;
    FDMemTableliste_tables: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid1SelChanged(Sender: TObject);
    procedure FDQuery2AfterClose(DataSet: TDataSet);
  private
    { Déclarations privées }
    procedure connexion(co: TFDConnection; sql: string); overload;
    procedure connexion(co: TFDConnection); overload;
    procedure fermer_tables;
    procedure affiche(tab: string);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.affiche(tab: string);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  connexion(EmployeeConnection,
    'SELECT RDB$RELATION_NAME as liste_tables FROM RDB$RELATIONS WHERE ((RDB$SYSTEM_FLAG = 0) OR (RDB$SYSTEM_FLAG IS NULL)) AND (RDB$VIEW_SOURCE IS NULL) ORDER BY RDB$RELATION_NAME');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  // Ne fonctionne pas à cause des droits d'accès aux tables de définition de la base fournie en exemple.
  // Fonctionnerait sur une base "perso" paramétrée pour que les tables système de MS Access soit accessibles en lecture.
  // connexion(DbdemosConnection, 'SELECT name as liste_tables FROM MSysObjects WHERE Type=1 AND Flags=0');

  connexion(DbdemosConnection);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  // Les composants CData ne fournissent pas d'équivalent de SHOW TABLES (de MySQL). On doit donc passer par la programmation pour obtenir le même résultat.
  connexion(DeveloppeurpascalConnection);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  connexion(Sqlite_demoConnection, 'SELECT name as liste_tables FROM sqlite_master WHERE type="table" ORDER BY name');
end;

procedure TForm1.connexion(co: TFDConnection);
var
  TableList: TStringList;
  Table: string;
begin
  fermer_tables;
  if not co.Connected then
    co.Open;
  if co.Connected then
  begin
    if FDLocalSQL.Active then
      FDLocalSQL.Active := false;
    if not FDMemTable.Active then
      FDMemTable.Open;
    FDMemTable.EmptyDataSet;
    TableList := TStringList.Create;
    try
      co.GetTableNames('', '', '', TableList);
      for Table in TableList do
      begin
        FDMemTable.Insert;
        FDMemTable.FieldByName('liste_tables').AsString := Table;
        FDMemTable.Post;
      end;
    finally
      freeandnil(TableList);
    end;
    if not FDConnectionLocale.Connected then
      FDConnectionLocale.Connected;
    FDLocalSQL.Active := true;
    FDQuery1.connection := FDConnectionLocale;
    FDQuery2.connection := co;
    FDQuery1.Open('select * from FDMemTable');
  end;
end;

procedure TForm1.connexion(co: TFDConnection; sql: string);
begin
  fermer_tables;
  if not co.Connected then
    co.Open;
  if co.Connected then
  begin
    FDQuery1.connection := co;
    FDQuery2.connection := co;
    if (sql.Trim.Length > 0) then
      FDQuery1.Open(sql);
  end;
end;

procedure TForm1.FDQuery2AfterClose(DataSet: TDataSet);
begin
  Edit1.Text := '';
end;

procedure TForm1.fermer_tables;
begin
  if FDQuery2.Active then
    FDQuery2.Close;
  if FDQuery1.Active then
    FDQuery1.Close;
end;

procedure TForm1.StringGrid1SelChanged(Sender: TObject);
begin
  if FDQuery2.Active then
    FDQuery2.Close;
  if (StringGrid1.Selected >= 0) and (StringGrid1.Cells[0, StringGrid1.Selected].Trim.Length > 0) then
  begin
    Edit1.Text := StringGrid1.Cells[0, StringGrid1.Selected];
    FDQuery2.Open('select * from "' + Edit1.Text + '"');
  end;
end;

end.

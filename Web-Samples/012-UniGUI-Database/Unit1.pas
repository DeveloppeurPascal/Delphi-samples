unit Unit1;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TDataModule1 = class(TDataModule)
    EmployeeConnection: TFDConnection;
    EmployeeTable: TFDQuery;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DataModule1: TDataModule1;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, MainModule;

function DataModule1: TDataModule1;
begin
  Result := TDataModule1(UniMainModule.GetModuleInstance(TDataModule1));
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
employeeconnection.open;
EmployeeTable.Open();
end;

initialization
  RegisterModuleClass(TDataModule1);

end.

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ControlList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    ControlList1: TControlList;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Sqlite_demoConnection: TFDConnection;
    CustomersTable: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.Generics.Collections;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
  si: TList<integer>;
begin
  Memo1.Lines.Clear;
  si := TList<integer>.create;
  try
    for i := 0 to ControlList1.ItemCount - 1 do
      if ControlList1.Selected[i] then
        si.Add(i);
    for i := 0 to si.Count - 1 do
    begin
      ControlList1.ItemIndex := si[i];
      // It changes the actual selected index, not the best way to do.
      // A better way is to check directly from the data source linked
      // to the control by the index because it won't change the selection or
      // the display of the TControlList like it does if you change the ItemIndex.
      Memo1.Lines.Add(Label1.Caption);
    end;
  finally
    si.Free;
  end;
  ControlList1.ClearSelection;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ControlList1.MultiSelect := true;
end;

end.

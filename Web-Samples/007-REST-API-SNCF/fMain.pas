unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.DB, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.ObjectScope, Data.Bind.Controls, FMX.Layouts, FMX.Bind.Navigator, FMX.StdCtrls, FMX.Edit,
  REST.Types;

type
  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    FDMemTable1datasetid: TWideStringField;
    FDMemTable1recordid: TWideStringField;
    FDMemTable1fields: TWideStringField;
    FDMemTable1record_timestamp: TWideStringField;
    FDMemTable1gare: TStringField;
    FDMemTable1pianos: TIntegerField;
    FlowLayout1: TFlowLayout;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FDMemTable1CalcFields(DataSet: TDataSet);
    procedure Edit1Change(Sender: TObject);
    procedure RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.json;

// https://data.sncf.com/explore/dataset/gares-pianos/information/?sort=gare

procedure TForm1.Edit1Change(Sender: TObject);
begin
  RESTRequest1.Params.ParameterByName('q').Value := Edit1.Text;
  RESTRequest1.Execute;
end;

procedure TForm1.FDMemTable1CalcFields(DataSet: TDataSet);
var
  jso: tjsonobject;
begin
  jso := tjsonobject.ParseJSONValue(DataSet.FieldByName('fields').AsString) as tjsonobject;
  if assigned(jso) then
    try
      try
        DataSet.FieldByName('gare').AsString := (jso.GetValue('gare') as tjsonstring).Value;
      except
        DataSet.FieldByName('gare').AsString := 'n/a';
      end;
      try
        DataSet.FieldByName('pianos').AsInteger := (jso.GetValue('piano') as TJSONNumber).AsInt;
      except
        DataSet.FieldByName('pianos').AsInteger := 0;
      end;
    finally
      freeandnil(jso);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

procedure TForm1.RESTRequest1AfterExecute(Sender: TCustomRESTRequest);
begin
  Edit1.SetFocus;
  Edit1.SelectAll;
end;

end.

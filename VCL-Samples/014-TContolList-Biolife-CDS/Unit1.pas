unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Controls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.ControlList;

type
  TForm1 = class(TForm)
    ControlList1: TControlList;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    Image1: TImage;
    BindNavigator2: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure ControlList1ItemClick(Sender: TObject);
    procedure BindNavigator2Click(Sender: TObject; Button: TNavigateButton);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BindNavigator2Click(Sender: TObject; Button: TNavigateButton);
begin
  if (Button in [TNavigateButton.nbFirst, TNavigateButton.nbPrior,
    TNavigateButton.nbNext, TNavigateButton.nbLast]) then
    Label2.Caption := Label1.Caption;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  ControlList1.MultiSelect := CheckBox1.Checked;
end;

procedure TForm1.ControlList1ItemClick(Sender: TObject);
begin
  showmessage(Label1.Caption);
  Label2.Caption := Label1.Caption;
end;

end.

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,  Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, FMX.Layouts, FMX.ListBox, Data.Bind.Components, Data.Bind.DBScope, FMX.Bind.Navigator, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, Data.DB, FMX.ScrollBox, FMX.Memo,
  FMX.Grid.Style, Fmx.Bind.Grid, Data.Bind.Grid, FMX.Grid, uDM;

type
  TForm1 = class(TForm)
    BindNavigator1: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
begin
  if Button in [TNavigateButton.nbInsert, TNavigateButton.nbEdit] then
    Edit1.SetFocus;
  // ListBox1.Selected.IsChecked := CheckBox1.IsChecked;
end;

end.

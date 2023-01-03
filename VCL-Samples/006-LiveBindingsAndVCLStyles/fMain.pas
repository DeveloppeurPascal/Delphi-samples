unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BindingsList1: TBindingsList;
    LinkControlToPropertyCaption: TLinkControlToProperty;
    LinkControlToPropertyCaption2: TLinkControlToProperty;
    Label3: TLabel;
    LinkFillControlToPropertyCaption: TLinkFillControlToProperty;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Vcl.themes;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  tstylemanager.SetStyle(ComboBox1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  ch: string;
begin
  ComboBox1.Clear;
  for ch in tstylemanager.StyleNames do
    ComboBox1.Items.Add(ch);
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(tstylemanager.ActiveStyle.Name);
end;

end.

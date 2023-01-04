unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Idemos1;

procedure TForm1.Button1Click(Sender: TObject);
var
  api: idemos;
begin
  api := getidemos;
  Label1.Text := api.echoDouble(Edit1.Text.ToDouble).ToString;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := pi.ToString;
end;

end.

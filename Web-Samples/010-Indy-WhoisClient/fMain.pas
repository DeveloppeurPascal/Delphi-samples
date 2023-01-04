unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Edit, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdWhois, FMX.Memo.Types;

type
  TForm1 = class(TForm)
    IdWhois1: TIdWhois;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Edit1Change(Sender: TObject);
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(IdWhois1.WhoIs(Edit1.Text.trim));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.

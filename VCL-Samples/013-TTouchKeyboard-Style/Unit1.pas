unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Touch.Keyboard, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    TouchKeyboard1: TTouchKeyboard;
    Button1: TButton;
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

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
  form2.ShowModal;
  close;
end;

end.

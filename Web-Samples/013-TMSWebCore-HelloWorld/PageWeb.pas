unit PageWeb;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls;

type
  TForm1 = class(TWebForm)
    WebButton1: TWebButton;
    procedure WebButton1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WebButton1Click(Sender: TObject);
begin
  ShowMessage('Hello World');
end;

end.

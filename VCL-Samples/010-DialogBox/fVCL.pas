unit fVCL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
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

procedure TForm1.Button1Click(Sender: TObject);
begin
  case messagedlg('Bonjour, comment ça va bien ?', mtconfirmation,
    [mbOk, mbCancel], 0, mbOk) of
    mrok:
      Showmessage('Tant mieux.');
    mrcancel:
      Showmessage('Retournez vous coucher');
  else
    raise exception.Create('pas glop');
  end;
end;

end.

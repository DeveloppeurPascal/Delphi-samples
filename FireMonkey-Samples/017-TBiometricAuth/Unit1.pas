unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.BiometricAuth, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    BiometricAuth1: TBiometricAuth;
    Button1: TButton;
    procedure BiometricAuth1AuthenticateSuccess(Sender: TObject);
    procedure BiometricAuth1AuthenticateFail(Sender: TObject;
      const FailReason: TBiometricFailReason; const ResultMessage: string);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BiometricAuth1AuthenticateFail(Sender: TObject;
  const FailReason: TBiometricFailReason; const ResultMessage: string);
begin
  showmessage('nok');
end;

procedure TForm1.BiometricAuth1AuthenticateSuccess(Sender: TObject);
begin
  showmessage('ok');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  BiometricAuth1.Authenticate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Button1.Enabled := BiometricAuth1.IsSupported;
  if not Button1.Enabled then
    showmessage('Biometric API not supported');
end;

end.

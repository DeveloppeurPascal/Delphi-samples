(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Set of projects demonstrating the features of the Delphi development
  environment, its libraries and its programming language.

  Some of the projects have been presented at conferences, on training
  courses or online coding sessions.

  The programs are up to date with the Community Edition and the commercial
  version of Delphi or RAD Studio.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://samples.developpeur-pascal.fr

  Project site :
  https://github.com/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-02-09T11:12:20.922+01:00
  Signature : b7af5d443470f655e568083736370fdeaf278140
  ***************************************************************************
*)

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

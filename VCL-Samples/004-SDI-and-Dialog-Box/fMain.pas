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
  File last update : 2025-02-09T11:12:20.976+01:00
  Signature : 09baaa8c4097e52917884681136d53362fa985ab
  ***************************************************************************
*)

unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    nb: integer;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses fDialogBox;

procedure TForm1.Button1Click(Sender: TObject);
var
  fiche: tform2;
begin
  inc(nb);
  fiche := tform2.Create(Self);
  fiche.Label1.Caption := 'Fiche ' + nb.ToString;
  fiche.Caption := fiche.Label1.Caption;
  fiche.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  fiche: tform2;
begin
  fiche := tform2.Create(Self);
  try
    fiche.Label1.Caption := 'Fenêtre bloquante';
    fiche.Caption := fiche.Label1.Caption;
    fiche.ShowModal;
  finally
    FreeAndNil(fiche);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  nb := 0;
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.

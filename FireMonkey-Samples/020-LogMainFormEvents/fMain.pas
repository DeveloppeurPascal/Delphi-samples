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
  File last update : 2025-02-09T11:12:20.936+01:00
  Signature : 72e92d603384dd95210e7db02222a56ef4c76323
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnClose: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure FormSaveState(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure addlog(log: string);
    function getLogFileName: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.ioutils;

procedure TForm1.addlog(log: string);
begin
  tfile.AppendAllText(getLogFileName, log + sLineBreak);
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  addlog('FormActivate');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  addlog('FormClose');
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  addlog('FormCloseQuery');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  addlog('FormCreate');
  Memo1.Lines.LoadFromFile(getLogFileName);
end;

procedure TForm1.FormDeactivate(Sender: TObject);
begin
  addlog('FormDeactivate');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  addlog('FormDestroy');
end;

procedure TForm1.FormHide(Sender: TObject);
begin
  addlog('FormHide');
end;

procedure TForm1.FormPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  addlog('FormPaint');
end;

procedure TForm1.FormSaveState(Sender: TObject);
begin
  addlog('FormSaveState');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  addlog('FormShow');
end;

function TForm1.getLogFileName: string;
begin
  result := TPath.combine(TPath.GetTempPath, 'log-MainFormEvents.txt');
end;

end.

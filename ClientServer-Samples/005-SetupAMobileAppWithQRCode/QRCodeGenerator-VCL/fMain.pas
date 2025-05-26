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
  File last update : 2025-02-09T11:12:20.785+01:00
  Signature : f6c569937f2d8feee1c9b2d294ef6d9bb508e519
  ***************************************************************************
*)

unit fMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure InitMemo;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uConsts,
  DelphiZXIngQRCode,
  Olf.RTL.Checksum;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  InitMemo;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitMemo;
end;

procedure TfrmMain.InitMemo;
var
  i: integer;
  Text: string;
  ChecksumVerifCode: string;
  QR: TDelphiZXingQRCode;
  X, Y: integer;
  CellSize: byte;
begin
  Memo1.Clear;
  for i := 1 to random(10) + 5 do
    case random(3) of
      0:
        Memo1.Lines.AddPair('KeyS' + i.tostring, tguid.NewGuid.tostring);
      1:
        Memo1.Lines.AddPair('KeyI' + i.tostring, random(maxint).tostring);
    else
      if random(10) < 5 then
        Memo1.Lines.AddPair('KeyB' + i.tostring, 'false')
      else
        Memo1.Lines.AddPair('KeyB' + i.tostring, 'true')
    end;
  // Text utilise CRLF sous Windows, LineFeed (#10) semble poser problème à la récupération pour le calcul du checksum
  // Text := Memo1.Lines.Text;
  Text := Memo1.Lines.CommaText;
  Memo1.Lines.Add(Text.Length.tostring);

  ChecksumVerifCode := ChecksumVerif.get(Text, CPrivateChecksumSalt1,
    CPrivateChecksumSalt2);
  Label1.Caption := 'VerifCode=' + ChecksumVerifCode;

  QR := TDelphiZXingQRCode.Create;
  try
    QR.Encoding := TQRCodeEncoding.qrAuto;
    QR.Data := ChecksumVerifCode + #9 + Text;

    CellSize := 20;
    Image1.Picture.Bitmap.SetSize(CellSize * QR.Columns, CellSize * QR.Rows);
    for X := 0 to QR.Columns - 1 do
      for Y := 0 to QR.Rows - 1 do
      begin
        if QR.IsBlack[X, Y] then
          Image1.Picture.Bitmap.canvas.Brush.Color := clBlack
        else
          Image1.Picture.Bitmap.canvas.Brush.Color := clWhite;
        Image1.Picture.Bitmap.canvas.FillRect(trect.Create(X * CellSize,
          Y * CellSize, (X + 1) * CellSize, (Y + 1) * CellSize));
      end;
  finally
    QR.Free;
  end;
end;

initialization

randomize;

{$IFDEF DEBUG}
ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

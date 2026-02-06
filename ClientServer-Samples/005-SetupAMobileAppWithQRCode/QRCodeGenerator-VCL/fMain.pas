(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-10-25T20:59:09.439+02:00
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

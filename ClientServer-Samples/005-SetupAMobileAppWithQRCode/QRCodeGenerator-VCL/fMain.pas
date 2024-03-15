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
  Text := Memo1.Lines.Text;

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

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
  Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure GetBitmapStream(ABitmapStream: TStream);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uDMAppTetheringReceiver;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  dmAppTetheringReceiver.onReceiveBitmapStream := GetBitmapStream;
end;

procedure TfrmMain.GetBitmapStream(ABitmapStream: TStream);
begin
  if assigned(ABitmapStream) and (ABitmapStream.Size > 0) then
  begin
    ABitmapStream.Position := 0;
    Image1.Picture.Bitmap.LoadFromStream(ABitmapStream);
  end;
end;

end.

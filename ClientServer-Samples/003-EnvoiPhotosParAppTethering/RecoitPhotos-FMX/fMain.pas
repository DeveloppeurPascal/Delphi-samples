unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    ImageControl1: TImageControl;
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

{$R *.fmx}

uses
  uDMAppTetheringReceiver;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  dmAppTetheringReceiver.onReceiveBitmapStream := GetBitmapStream;
end;

procedure TfrmMain.GetBitmapStream(ABitmapStream: TStream);
begin
  if assigned(ABitmapStream) and (ABitmapStream.Size > 0) then
  begin
    ABitmapStream.Position := 0;
    ImageControl1.Bitmap.LoadFromStream(ABitmapStream);
  end;
end;

end.

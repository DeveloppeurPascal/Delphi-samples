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
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfmrMain = class(TForm)
    btnSendThisPicture: TButton;
    ImageControl1: TImageControl;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnSendThisPictureClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  public
    ImageList: TStringList;
    ImageIndex: integer;
  end;

var
  fmrMain: TfmrMain;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  SendPicturesOnANetworkWithSockets;

var
  Serveur: TSendPicturesOnANetworkWithSocketsServer;

procedure TfmrMain.btnSendThisPictureClick(Sender: TObject);
var
  msg: TSPNSendABitmapMessage;
begin
  msg := TSPNSendABitmapMessage.Create;
  try
    msg.Bitmap.Assign(ImageControl1.Bitmap);
    Serveur.SendMessageToAll(msg);
  finally
    msg.Free;
  end;
end;

procedure TfmrMain.FormCreate(Sender: TObject);
var
  imgs: TStringDynArray;
  Folder: string;
  i: integer;
begin
  Serveur := TSendPicturesOnANetworkWithSocketsServer.Create('127.0.0.1', 8080);

  ImageList := TStringList.Create;
  ImageIndex := -1;

  Folder := 'C:\Users\pprem\Pictures\demos - Portraits';
  if not tdirectory.Exists(Folder) then
    raise Exception.Create('Please change the directory of the pictures.');

  imgs := tdirectory.GetFiles(Folder);
  for i := 0 to length(imgs) - 1 do
    if imgs[i].tolower.EndsWith('.jpg') or imgs[i].tolower.EndsWith('.jpeg') or
      imgs[i].tolower.EndsWith('.png') then
      ImageList.Add(imgs[i]);
end;

procedure TfmrMain.FormDestroy(Sender: TObject);
begin
  ImageList.Free;
end;

procedure TfmrMain.Timer1Timer(Sender: TObject);
begin
  if ImageIndex < ImageList.Count - 1 then
  begin
    inc(ImageIndex);
    ImageControl1.LoadFromFile(ImageList[ImageIndex]);
  end
  else
    ImageIndex := -1;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

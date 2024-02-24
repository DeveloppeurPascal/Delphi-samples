unit fMain;

interface

// TODO : update the manifest and permissions for Android
// TODO : gérer la mise en background de l'application (cf FieFrapic)
// TODO : ajouter un bouton de changement de caméra (front / back) (cf FieFrapic)
// TODO : activer l'autofocus si disponible (cf FieFrapic)
// TODO : ajouter un bouton pour activer le flash si disponible (cf FieFrapic)
// TODO : proposer la récupération d'une photo depuis la librairie de l'appareil
// TODO : ajouter une option de partage de la photo (cf FieFrapic)

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
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Media;

type
  TfrmMain = class(TForm)
    CameraComponent1: TCameraComponent;
    ImageControl1: TImageControl;
    GridPanelLayout1: TGridPanelLayout;
    btnStartStopCapture: TButton;
    btnSendPhoto: TButton;
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
    procedure btnStartStopCaptureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSendPhotoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FisCameraStarted: boolean;
    procedure SetisCameraStarted(const Value: boolean);
  protected
  public
    property isCameraStarted: boolean read FisCameraStarted
      write SetisCameraStarted;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  uDMAppTetheringSender;

procedure TfrmMain.btnSendPhotoClick(Sender: TObject);
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    ImageControl1.Bitmap.SaveToStream(ms);
    dmAppTetheringSender.SendABitmapStream(ms);
  finally
    ms.Free;
  end;
end;

procedure TfrmMain.btnStartStopCaptureClick(Sender: TObject);
begin
  isCameraStarted := not isCameraStarted;
end;

procedure TfrmMain.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
begin
  CameraComponent1.SampleBufferToBitmap(ImageControl1.Bitmap, true);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  isCameraStarted := false;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  isCameraStarted := false;
end;

procedure TfrmMain.SetisCameraStarted(const Value: boolean);
begin
  FisCameraStarted := Value;
  CameraComponent1.Active := FisCameraStarted;
  if FisCameraStarted then
    btnStartStopCapture.Text := 'Stop the capture'
  else
    btnStartStopCapture.Text := 'Start the capture';
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

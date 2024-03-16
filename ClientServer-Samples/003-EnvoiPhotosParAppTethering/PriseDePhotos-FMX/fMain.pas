unit fMain;

interface

// TODO : ajouter un bouton de changement de caméra (front / back) (cf FieFrapic)
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
  FMX.Media,
  System.Messaging,
  FMX.Platform;

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
    FWasCaptureOn: boolean;
    procedure SetisCameraStarted(const Value: boolean);
  protected
    procedure ApplicationEventChangedHandler(const Sender: TObject;
      const AMessage: TMessage);
    procedure StartCamera(Const AskForPermission: boolean = true);
    procedure UpdateCameraStatus;
  public
    property isCameraStarted: boolean read FisCameraStarted
      write SetisCameraStarted;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.Permissions,
  FMX.DialogService,
  uDMAppTetheringSender;

procedure TfrmMain.ApplicationEventChangedHandler(const Sender: TObject;
  const AMessage: TMessage);
begin
  case TApplicationEventMessage(AMessage).Value.Event of
    TApplicationEvent.WillBecomeInactive:
      begin
        FWasCaptureOn := isCameraStarted;
        isCameraStarted := false;
      end;
    TApplicationEvent.BecameActive:
      isCameraStarted := FWasCaptureOn;
  end;
end;

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
  FWasCaptureOn := false;
  isCameraStarted := false;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  isCameraStarted := false;
end;

procedure TfrmMain.SetisCameraStarted(const Value: boolean);
begin
  if Value then
    StartCamera
  else
  begin
    FisCameraStarted := Value;
    UpdateCameraStatus;
  end;
end;

procedure TfrmMain.StartCamera(const AskForPermission: boolean);
begin
  if AskForPermission then
    TPermissionsService.DefaultService.RequestPermissions
      (['android.permission.CAMERA'],
      procedure(const APermissions: TClassicStringDynArray;
        const AGrantResults: TClassicPermissionStatusDynArray)
      var
        i: integer;
      begin
        for i := 0 to length(AGrantResults) - 1 do
          if (AGrantResults[i] = TPermissionStatus.Denied) then
            raise exception.create
              ('Permission nécessaire pour prendre une photo.');
        StartCamera(false);
      end,
      procedure(const APermissions: TClassicStringDynArray;
        const APostRationaleProc: TProc)
      begin
        TDialogService.showmessage
          ('Il est nécessaire d''avoir cette autorisation pour prendre une photo.',
          procedure(Const AModalResult: TModalResult)
          begin
            if assigned(APostRationaleProc) then
              APostRationaleProc;
          end);
      end)
  else
  begin
    // Activation de la caméra autorisée.
    // On modifie ses réglages et on lance la prise de vidéo.

{$IF Defined(IOS) or Defined(ANDROID)}
    // Forçage caméra arrière pour iOS et Android
    if not(CameraComponent1.Kind = TCameraKind.BackCamera) then
      try
        if CameraComponent1.Active then
          CameraComponent1.Active := false;
        CameraComponent1.Kind := TCameraKind.BackCamera;
      except
        CameraComponent1.Kind := TCameraKind.default;
      end;
{$ENDIF}
    //
    // Activation de la meilleure qualité possible (lorsque c'est pris en charge)
    // Peut poser problème sur la détection de QR Code, toujours proposer un réglage manuel avec possibilité de descendre la résolution si le scan ne passe pas là
    if not(CameraComponent1.Quality = TVideoCaptureQuality.PhotoQuality) then
      try
        if CameraComponent1.Active then
          CameraComponent1.Active := false;
        CameraComponent1.Quality := TVideoCaptureQuality.PhotoQuality;
      except
        CameraComponent1.Quality := TVideoCaptureQuality.CaptureSettings;
      end;

{$IFDEF ANDROID}
    try
      CameraComponent1.FocusMode := TFocusMode.ContinuousAutoFocus;
    except
      CameraComponent1.FocusMode := TFocusMode.AutoFocus;
    end;
{$ENDIF}
    // Si la demande de permission a été déclenchée, WillBecomeActive se déclenchera en sortie de cette procédure,
    // Par défaut il recoupera la caméra si on ne lui dit pas qu'elle était active.
    FWasCaptureOn := true;
    // Si la permission était déjà fournie, pas de perte de focus de l'application,
    // donc on active la caméra, même si ça sera potentiellement fait deux fois.
    FisCameraStarted := true;
    UpdateCameraStatus;
  end;
end;

procedure TfrmMain.UpdateCameraStatus;
begin
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

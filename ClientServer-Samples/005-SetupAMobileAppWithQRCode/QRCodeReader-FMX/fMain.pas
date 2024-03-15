unit fMain;

// TODO : ajouter un bouton de changement de caméra (front / back) (cf FieFrapic)
// TODO : activer l'autofocus si disponible (cf FieFrapic)
// TODO : ajouter un bouton pour activer le flash si disponible (cf FieFrapic)

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
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Media,
  System.Messaging,
  FMX.Platform;

type
  TfrmMain = class(TForm)
    CameraComponent1: TCameraComponent;
    ImageControl1: TImageControl;
    btnStartCamera: TButton;
    Memo1: TMemo;
    procedure btnStartCameraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CameraComponent1SampleBufferReady(Sender: TObject;
      const ATime: TMediaTime);
  private
    FisQRCaptureOn: boolean;
    FWasCaptureOn: boolean;
    procedure SetisQRCaptureOn(const Value: boolean);
  protected
    ScanEnCours: boolean;
    procedure ApplicationEventChangedHandler(const Sender: TObject;
      const AMessage: TMessage);
  public
    property isQRCaptureOn: boolean read FisQRCaptureOn write SetisQRCaptureOn;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  ZXing.ScanManager,
  ZXing.BarcodeFormat,
  ZXing.ReadResult,
  uChecksumVerif,
  uConsts;

{ TForm1 }

procedure TfrmMain.ApplicationEventChangedHandler(const Sender: TObject;
  const AMessage: TMessage);
begin
  case TApplicationEventMessage(AMessage).Value.Event of
    TApplicationEvent.WillBecomeInactive:
      begin
        FWasCaptureOn := isQRCaptureOn;
        isQRCaptureOn := false;
      end;
    TApplicationEvent.BecameActive:
      isQRCaptureOn := FWasCaptureOn;
  end;
end;

procedure TfrmMain.btnStartCameraClick(Sender: TObject);
begin
  isQRCaptureOn := not isQRCaptureOn;
end;

procedure TfrmMain.CameraComponent1SampleBufferReady(Sender: TObject;
  const ATime: TMediaTime);
var
  bmp: tbitmap;
begin
  CameraComponent1.SampleBufferToBitmap(ImageControl1.Bitmap, true);
  if not ScanEnCours then
  begin
    ScanEnCours := true;
    try
      bmp := tbitmap.Create;
      try
        bmp.Assign(ImageControl1.Bitmap);
        tthread.CreateAnonymousThread(
          procedure
          var
            scan: TScanManager;
            res: TReadResult;
          begin
            scan := TScanManager.Create(QR_CODE, nil);
            try
              res := scan.scan(bmp);
              if assigned(res) then
                try
                  tthread.Queue(nil,
                    procedure
                    var
                      ReceivedVerifCode, ReceivedText: string;
                      tab: TArray<string>;
                    begin
                      try
                        isQRCaptureOn := false;
                        tab := res.text.Split([#9]);
                        if (length(tab) = 2) then
                        begin
                          ReceivedVerifCode := tab[0];
                          ReceivedText := tab[1];
                        end
                        else
                        begin
                          ReceivedVerifCode := '';
                          ReceivedText := tab[0];
                        end;
                        if ChecksumVerif.check(ReceivedVerifCode, ReceivedText,
                          CPrivateChecksumSalt1, CPrivateChecksumSalt2) then
                        begin
                          Memo1.Lines.Clear;
                          Memo1.Lines.text := 'Tout est ok. Texte lu :' +
                            slinebreak + slinebreak + ReceivedText;
                        end
                        else
                        begin
                          Memo1.Lines.Clear;
                          Memo1.Lines.text :=
                            'Mauvais code de controle. Texte reçu :' +
                            slinebreak + slinebreak + ReceivedText;
                        end;
                      finally
                        res.Free;
                      end;
                    end);
                except
                  res.Free;
                end;
            finally
              scan.Free;
              bmp.Free;
              ScanEnCours := false;
            end;
          end).Start;
      except
        bmp.Free;
      end;
    except
      ScanEnCours := false;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TMessageManager.DefaultManager.SubscribeToMessage(TApplicationEventMessage,
    ApplicationEventChangedHandler);

  FWasCaptureOn := false;
  isQRCaptureOn := false;
  ScanEnCours := false;
  Memo1.Lines.Clear;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  isQRCaptureOn := false;
end;

procedure TfrmMain.SetisQRCaptureOn(const Value: boolean);
begin
  FisQRCaptureOn := Value;

  if Value then
  begin // Modification des réglages de la caméra si on va l'activer
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
    // Activation de la meilleure qualité possible (lorsque c'est pris en charge)
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
  end;

  // Activation (ou désactivation de la caméra)
  CameraComponent1.Active := FisQRCaptureOn;

  ImageControl1.Visible := CameraComponent1.Active;
  btnStartCamera.Visible := not CameraComponent1.Active;
  Memo1.Visible := not CameraComponent1.Active;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

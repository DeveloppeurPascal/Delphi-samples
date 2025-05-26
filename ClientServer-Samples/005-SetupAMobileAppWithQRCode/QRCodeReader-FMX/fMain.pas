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
  Signature : 1a1130f40980a3b83c539a88a75d7ec507744067
  ***************************************************************************
*)

unit fMain;

// TODO : ajouter un bouton de changement de caméra (front / back) (cf FieFrapic)
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
    procedure ActivateTheCamera(const AskForPermission: boolean = true);
    procedure ChangeCameraComponentStatus;
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
  uConsts,
  Olf.RTL.Checksum,
  System.Permissions,
  FMX.DialogService;

{ TForm1 }

procedure TfrmMain.ActivateTheCamera(const AskForPermission: boolean);
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
        ActivateTheCamera(false);
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
    FisQRCaptureOn := true;
    ChangeCameraComponentStatus;
  end;
end;

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

procedure TfrmMain.ChangeCameraComponentStatus;
begin
  // Activation ou désactivation de la caméra
  CameraComponent1.Active := FisQRCaptureOn;

  // Changement de la visilité des composants qui en dépendent
  ImageControl1.Visible := CameraComponent1.Active;
  btnStartCamera.Visible := not CameraComponent1.Active;
  Memo1.Visible := not CameraComponent1.Active;
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
      bmp := tbitmap.create;
      try
        bmp.Assign(ImageControl1.Bitmap);
        tthread.CreateAnonymousThread(
          procedure
          var
            scan: TScanManager;
            res: TReadResult;
          begin
            scan := TScanManager.create(QR_CODE, nil);
            try
              res := scan.scan(bmp);
              if assigned(res) then
                try
                  tthread.queue(nil,
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
                          Memo1.Lines.CommaText := ReceivedText;
                          Memo1.Lines.Insert(0, '');
                          Memo1.Lines.Insert(0, 'Tout est ok. Texte lu :');
                        end
                        else
                        begin
                          Memo1.Lines.Clear;
                          Memo1.Lines.text :=
                            'Mauvais code de controle. Texte reçu :' +
                            slinebreak + slinebreak + ReceivedText;
                          Memo1.Lines.Add('VerifCode : ' + ReceivedVerifCode);
                        end;
                        Memo1.Lines.Add(ReceivedText.length.ToString);
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
  if Value then
    ActivateTheCamera
  else
  begin
    FisQRCaptureOn := Value;
    ChangeCameraComponentStatus;
  end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

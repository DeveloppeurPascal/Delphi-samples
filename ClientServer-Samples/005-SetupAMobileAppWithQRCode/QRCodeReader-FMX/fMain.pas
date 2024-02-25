unit fMain;

// TODO : update the manifest and permissions for Android
// TODO : gérer la mise en background de l'application (cf FieFrapic)
// TODO : ajouter un bouton de changement de caméra (front / back) (cf FieFrapic)
// TODO : activer l'autofocus si disponible (cf FieFrapic)
// TODO : ajouter un bouton pour activer le flash si disponible (cf FieFrapic)
// TODO : si on est sur Android ou iOS, activer par défaut la caméra arrière

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
  FMX.Media;

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
    procedure SetisQRCaptureOn(const Value: boolean);
  protected
    ScanEnCours: boolean;
  public
    property isQRCaptureOn: boolean read FisQRCaptureOn write SetisQRCaptureOn;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses ZXing.ScanManager, ZXing.BarcodeFormat, ZXing.ReadResult;
{ TForm1 }

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
                    begin
                      isQRCaptureOn := false;
                      // TODO : controler le code de vérification
                      Memo1.Lines.Clear;
                      Memo1.Lines.Text := res.Text;
                    end);
                finally
                  res.Free;
                end;
            finally
              scan.Free;
              bmp.Free;
              ScanEnCours := false;
            end;
          end);
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

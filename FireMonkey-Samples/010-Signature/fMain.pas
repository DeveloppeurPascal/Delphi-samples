unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  uCADSignatureFMX, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    SignatureFMX1: TSignatureFMX;
    btnSaveImage: TButton;
    procedure btnSaveImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.IOUtils, u_urlOpen;

procedure TForm1.btnSaveImageClick(Sender: TObject);
var
  filename: string;
begin
  filename := tpath.combine(tpath.GetDocumentsPath,
    'DelphiSamples-Signature.jpg');
  SignatureFMX1.SaveToFile(filename);
  url_open_in_browser(filename);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IF Defined(ANDROID) or Defined(IOS)}
  btnSaveImage.enabled := false;
  btnSaveImage.Visible := false;
{$ENDIF}
end;

end.

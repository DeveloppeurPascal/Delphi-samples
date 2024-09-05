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
  FMX.StdCtrls, FMX.Objects;

type
  TfrmMain = class(TForm)
    btnDownloadAPDF: TButton;
    btnOpenThePDF: TButton;
    AniIndicator1: TAniIndicator;
    lblEndOfGame: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnDownloadAPDFClick(Sender: TObject);
    procedure btnOpenThePDFClick(Sender: TObject);
  private
  protected
    PDFPath: string;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  u_urlOpen,
  u_download;

procedure TfrmMain.btnDownloadAPDFClick(Sender: TObject);
begin
  btnDownloadAPDF.Visible := false;
  AniIndicator1.Visible := true;
  AniIndicator1.Enabled := true;
  // image
  PDFPath := tpath.Combine(tpath.GetPublicPath, 'test.jpeg');
  // PDF
  // PDFPath := tpath.Combine(tpath.GetDocumentsPath, 'test.pdf');
  tdownload_file.download(
    // image
    'https://www.dropbox.com/scl/fi/hoe6phi7fqqxd8cfi14fj/AdobeStock_15289151-800x800.jpeg?rlkey=yoh309f5pzd00lm8eddo4j8xt&dl=1',
    // pdf
    // 'https://www.dropbox.com/scl/fi/nrdnhaiulqbivfztzuxjy/livre-blanc-a-colorier-soi-meme.pdf?rlkey=4f044xjngjurunegvlcfl8al8&dl=1',
    PDFPath,
    procedure
    begin
      AniIndicator1.Visible := false;
      btnOpenThePDF.Visible := true;
    end);
end;

procedure TfrmMain.btnOpenThePDFClick(Sender: TObject);
begin
  btnOpenThePDF.Visible := false;
  Image1.Bitmap.LoadFromFile(PDFPath);
  url_Open_In_Browser(PDFPath);
  lblEndOfGame.Visible := true;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  btnDownloadAPDF.Visible := true;
  AniIndicator1.Visible := false;
  btnOpenThePDF.Visible := false;
  lblEndOfGame.Visible := false;
end;

end.

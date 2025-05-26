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
  File last update : 2025-02-09T11:12:20.947+01:00
  Signature : 04d5b08db113749841036c76faf1307e78623901
  ***************************************************************************
*)

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

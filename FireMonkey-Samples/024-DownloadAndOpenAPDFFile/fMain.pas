(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-10-25T20:59:09.690+02:00
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

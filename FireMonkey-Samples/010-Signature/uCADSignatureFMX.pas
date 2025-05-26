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
  File last update : 2025-02-09T11:12:20.891+01:00
  Signature : 53c53b948ae441f68d6fd4ec68bb3ae396c66167
  ***************************************************************************
*)

unit uCADSignatureFMX;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TSignatureFMX = class(TFrame)
    imgSignature: TImage;
    procedure imgSignatureMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Single);
    procedure imgSignatureResize(Sender: TObject);
    procedure imgSignatureMouseLeave(Sender: TObject);
    procedure imgSignatureMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Déclarations privées }
    FX, FY: Single;
    function GetBitmap: TBitmap;
  public
    property Bitmap: TBitmap read GetBitmap;
    constructor Create(AOwner: TComponent); override;
    procedure LoadFromFile(const AFileName: string);
    procedure SaveToFile(const AFileName: string);
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
  end;

implementation

{$R *.fmx}

constructor TSignatureFMX.Create(AOwner: TComponent);
begin
  inherited;
  FX := -1;
  FY := -1;
end;

function TSignatureFMX.GetBitmap: TBitmap;
begin
  result := imgSignature.Bitmap;
end;

procedure TSignatureFMX.imgSignatureMouseLeave(Sender: TObject);
begin
  exit;
  FX := -1;
  FY := -1;
end;

procedure TSignatureFMX.imgSignatureMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
  if ssLeft in Shift then
  begin
    X := X / imgSignature.Bitmap.BitmapScale;
    Y := Y / imgSignature.Bitmap.BitmapScale;
    if (FX >= 0) and (FY >= 0) then
    begin
      imgSignature.BeginUpdate;
      imgSignature.Bitmap.Canvas.BeginScene;
//      imgSignature.Bitmap.Canvas.fill.color := talphacolors.Red;
//      imgSignature.Bitmap.Canvas.fillrect(rectf(FX, FY, X, Y), 1);
      imgSignature.Bitmap.Canvas.fill.color := talphacolors.green;
      imgSignature.Bitmap.Canvas.DrawLine(pointf(FX, FY), pointf(X, Y), 1);
      imgSignature.Bitmap.Canvas.EndScene;
      imgSignature.EndUpdate;
    end;
    FX := X;
    FY := Y;
  end
  else
  begin
    FX := -1;
    FY := -1;
  end;
end;

procedure TSignatureFMX.imgSignatureMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  exit;
  FX := -1;
  FY := -1;
end;

procedure TSignatureFMX.imgSignatureResize(Sender: TObject);
begin
  imgSignature.Bitmap.SetSize(trunc(imgSignature.Width),
    trunc(imgSignature.Height));
  imgSignature.Bitmap.Clear(talphacolors.white);
end;

procedure TSignatureFMX.LoadFromFile(const AFileName: string);
begin
  imgSignature.Bitmap.LoadFromFile(AFileName);
end;

procedure TSignatureFMX.LoadFromStream(Stream: TStream);
begin
  imgSignature.Bitmap.LoadFromStream(Stream);
end;

procedure TSignatureFMX.SaveToFile(const AFileName: string);
begin
  imgSignature.Bitmap.SaveToFile(AFileName);
end;

procedure TSignatureFMX.SaveToStream(Stream: TStream);
begin
  imgSignature.Bitmap.SaveToStream(Stream);
end;

end.

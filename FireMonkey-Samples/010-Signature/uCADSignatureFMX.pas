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
  File last update : 2025-10-25T20:59:09.601+02:00
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

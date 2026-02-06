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
  File last update : 2025-11-28T16:25:39.628+01:00
  Signature : 6c7bddc8475016825c48d8d8c0cb304a21020305
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
  FMX.ImgList,
  System.ImageList,
  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    Glyph1: TGlyph;
    Memo1: TMemo;
    procedure FormResize(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormResize(Sender: TObject);
begin
  // ImageRect returns the position of rendered image in the Glyph area.
  // If TGlyph.Stretch if False, the image has its real size
  // If TGlyph.Stretch if Trus, the image has the same size as the glyph by construction, we can't know the "real" size and position of the resized image in this area
  memo1.lines.Insert(0, 'Image : (' + Glyph1.ImageRect.Left.ToString + ',' + Glyph1.ImageRect.Top.ToString + ')-(' +
    Glyph1.ImageRect.Right.ToString + ',' + Glyph1.ImageRect.Bottom.ToString + ')');
  memo1.lines.Insert(0, 'Bitmap : (' + Glyph1.Bitmap.Bounds.Left.ToString + ',' + Glyph1.Bitmap.Bounds.Top.ToString + ')-(' +
    Glyph1.Bitmap.Bounds.Right.ToString + ',' + Glyph1.Bitmap.Bounds.Bottom.ToString + ')');
  memo1.lines.Insert(0, 'Glyph : (' + Glyph1.BoundsRect.Left.ToString + ',' + Glyph1.BoundsRect.Top.ToString + ')-(' +
    Glyph1.BoundsRect.Right.ToString + ',' + Glyph1.BoundsRect.Bottom.ToString + ')');
end;

end.


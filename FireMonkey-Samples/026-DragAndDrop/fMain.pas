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
  File last update : 2025-10-25T20:59:09.694+02:00
  Signature : e1319f127503658d1fd8172bd5e87d424a86275e
  ***************************************************************************
*)

unit fMain;

// TODO : bug - blocage en débordement de la zone de scroll ou sortie de la fenêtre
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
  FMX.Objects,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ScrollBox1: TScrollBox;
    Image2: TImage;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    procedure ScrollBox1DragDrop(Sender: TObject; const Data: TDragObject;
      const Point: TPointF);
    procedure ScrollBox1DragOver(Sender: TObject; const Data: TDragObject;
      const Point: TPointF; var Operation: TDragOperation);
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Single);
  private
    DragStartX, DragStartY: Single;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  with TRectangle.create(self) do
  begin
    position.X := 2000;
    position.Y := 2000;
    width := 1;
    height := 1;
    visible := true;
    parent := ScrollBox1;
  end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Single);
begin
  DragStartX := X;
  DragStartY := Y;
end;

procedure TForm1.ScrollBox1DragDrop(Sender: TObject; const Data: TDragObject;
  const Point: TPointF);
var
  imgSource, imgDestination: TImage;
begin
  if (Data.Source is TImage) then
  begin
    imgSource := Data.Source as TImage;
    case imgSource.tag of
      1:
        begin
          // imgDestination := imgSource.Clone(self) as TImage;
          // .Clone() copy all properties except the parent, but we only need size and bitmap
          imgDestination := TImage.create(self);
          imgDestination.width := imgSource.width;
          imgDestination.height := imgSource.height;
          imgDestination.Bitmap.Assign(imgSource.Bitmap);
          imgDestination.position.X := Point.X + ScrollBox1.ViewportPosition.X -
            DragStartX;
          imgDestination.position.Y := Point.Y + ScrollBox1.ViewportPosition.Y -
            DragStartY;
          imgDestination.tag := 2;
          imgDestination.DragMode := tdragmode.dmAutomatic;
          imgDestination.OnMouseMove := Image1MouseMove;
          imgDestination.parent := ScrollBox1;
        end;
      2:
        begin
          imgSource.BeginUpdate;
          try
            imgSource.position.X := Point.X + ScrollBox1.ViewportPosition.X -
              DragStartX;
            imgSource.position.Y := Point.Y + ScrollBox1.ViewportPosition.Y -
              DragStartY;
          finally
            imgSource.EndUpdate;
          end;
        end;
    end;
  end;
end;

procedure TForm1.ScrollBox1DragOver(Sender: TObject; const Data: TDragObject;
  const Point: TPointF; var Operation: TDragOperation);
begin
  Operation := TDragOperation.None;
  if (Data.Source is TImage) then
    case (Data.Source as TImage).tag of
      1:
        Operation := TDragOperation.copy;
      2:
        Operation := TDragOperation.move;
    end;
end;

end.

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
  File last update : 2025-04-06T23:46:27.692+02:00
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

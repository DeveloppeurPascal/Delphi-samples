unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TForm1 = class(TForm)
    Layout1: TLayout;
    lblAppSize: TLabel;
    lblScreenSize: TLabel;
    lblBitmapScale: TLabel;
    Image1: TImage;
    lblImageSize: TLabel;
    lblImageBitmapSize: TLabel;
    lblImageBitmapCanvasSize: TLabel;
    lblDisplaysScale: TLabel;
    Rectangle1: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    lblMouseXY: TLabel;
    lblTapXY: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure Image1Tap(Sender: TObject; const Point: TPointF);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    procedure DrawOnImage;
    procedure DisplaySize;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.DrawOnImage;
begin
  Image1.Bitmap.SetSize(trunc(Image1.Width * Image1.Bitmap.BitmapScale),
    trunc(Image1.height * Image1.Bitmap.BitmapScale));
  Image1.Bitmap.Clear(talphacolors.Lightgreen);
  Image1.Bitmap.Canvas.BeginScene;
  try
    Image1.Bitmap.Canvas.fill.Color := talphacolors.Lightblue;
    Image1.Bitmap.Canvas.fill.Kind := tbrushkind.Solid;
    Image1.Bitmap.Canvas.FillEllipse(trectf.Create(0, 0, Image1.Bitmap.Width,
      Image1.Bitmap.height), 0.5);
    // change the size we give by multiplying it with the BitmapScale

    Image1.Bitmap.Canvas.fill.Color := talphacolors.Lightsalmon;
    Image1.Bitmap.Canvas.fill.Kind := tbrushkind.Solid;
    Image1.Bitmap.Canvas.FillEllipse(trectf.Create(0, 0, Image1.Width,
      Image1.height), 0.5); // draw the circle where we want it

    Image1.Bitmap.Canvas.Stroke.Color := talphacolors.blue;
    Image1.Bitmap.Canvas.Stroke.Kind := tbrushkind.Solid;
    Image1.Bitmap.Canvas.Stroke.Thickness := 3;
    Image1.Bitmap.Canvas.DrawRect(trectf.Create(50, 50,
      Image1.Bitmap.Width - 50, Image1.Bitmap.height - 50), 1);
    // change the size we give by multiplying it with the BitmapScale

    Image1.Bitmap.Canvas.Stroke.Color := talphacolors.salmon;
    Image1.Bitmap.Canvas.Stroke.Kind := tbrushkind.Solid;
    Image1.Bitmap.Canvas.Stroke.Thickness := 3;
    Image1.Bitmap.Canvas.DrawRect(trectf.Create(45, 45, Image1.Width - 45,
      Image1.height - 45), 1); // draw the circle where we want it

    Image1.Bitmap.Canvas.DrawBitmap(Rectangle1.MakeScreenshot,
      Rectangle1.ShapeRect, trectf.Create(100, 100, 200, 200), 1);
  finally
    Image1.Bitmap.Canvas.endScene;
  end;
  DisplaySize;
end;

procedure TForm1.DisplaySize;
var
  i: integer;
begin
  lblScreenSize.text := 'Screen size : ' + screen.Width.ToString + 'x' +
    screen.height.ToString;
  lblAppSize.text := 'App size : ' + Width.ToString + 'x' + height.ToString;
  lblImageSize.text := 'Image size : ' + Image1.Width.ToString + 'x' +
    Image1.height.ToString;
  lblImageBitmapSize.text := 'Bitmap size : ' + Image1.Bitmap.Width.ToString +
    'x' + Image1.Bitmap.height.ToString;
  lblImageBitmapCanvasSize.text := 'Canvas size : ' +
    Image1.Bitmap.Canvas.Width.ToString + 'x' +
    Image1.Bitmap.Canvas.height.ToString;
  lblBitmapScale.text := 'Bitmap Scale : ' + Image1.Bitmap.BitmapScale.ToString;
  lblDisplaysScale.text := 'Display(s) Scale :';
  for i := 0 to screen.DisplayCount - 1 do
    lblDisplaysScale.text := lblDisplaysScale.text + ' ' + i.ToString + '->' +
      screen.Displays[i].Scale.ToString;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tthread.ForceQueue(nil,
    procedure
    begin
      DrawOnImage;
    end);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  tthread.ForceQueue(nil,
    procedure
    begin
      DrawOnImage;
    end);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Single);
begin
  lblMouseXY.text := 'MouseDown=(' + X.ToString + ',' + Y.ToString + ')';
end;

procedure TForm1.Image1Tap(Sender: TObject; const Point: TPointF);
begin
  lblTapXY.text := 'tap=(' + Point.X.ToString + ',' + Point.Y.ToString + ')';
end;

end.

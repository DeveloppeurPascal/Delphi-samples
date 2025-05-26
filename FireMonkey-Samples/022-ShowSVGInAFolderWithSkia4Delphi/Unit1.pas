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
  File last update : 2025-02-09T11:12:20.936+01:00
  Signature : 5296e58e0c0e011e677e87200b750ae53bcc035d
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListBox;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    ListBox1: TListBox;
    Layout1: TLayout;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Change(Sender: TObject);
  private
    { Déclarations privées }
    procedure ShowPicture(Const FileName: string);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.Skia,
  FMX.Skia,
  System.IOUtils;

procedure TForm1.Button1Click(Sender: TObject);
var
  files: TStringDynArray;
  i: integer;
  folder: string;
begin
  if SelectDirectory('SVG directory ?', '', folder) and tdirectory.Exists(folder)
  then
  begin
    files := tdirectory.GetFiles(folder);
    ListBox1.BeginUpdate;
    try
      ListBox1.Clear;
      for i := 0 to length(files) - 1 do
        if files[i].ToLower.EndsWith('.svg') then
          ListBox1.Items.Add(files[i]);
    finally
      ListBox1.EndUpdate;
    end;
  end;
end;

procedure TForm1.ListBox1Change(Sender: TObject);
begin
  if assigned(ListBox1.Selected) then
    ShowPicture(ListBox1.Selected.Text);
end;

procedure TForm1.ShowPicture(const FileName: string);
begin
  if Image1.Bitmap.IsEmpty then
    Image1.Bitmap.SetSize(trunc(Image1.Width), trunc(Image1.Height));

  Image1.Bitmap.SkiaDraw(
    procedure(const ACanvas: ISKCanvas)
    var
      LSvgBrush: TSkSvgBrush;
    begin
      LSvgBrush := TSkSvgBrush.Create;
      try
        LSvgBrush.Source := TFile.ReadAllText(FileName);
        LSvgBrush.Render(ACanvas, RectF(0, 0, Image1.Bitmap.Width,
          Image1.Bitmap.Height), 1);
      finally
        LSvgBrush.Free;
      end;
    end);
end;

end.

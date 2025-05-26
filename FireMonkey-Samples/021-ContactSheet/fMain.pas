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
  Signature : 969375679d5f16322e0751ded98131afb6118f62
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
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects;

type
  TForm2 = class(TForm)
    Button1: TButton;
    FlowLayout1: TFlowLayout;
    VertScrollBox1: TVertScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure VertScrollBox1Resize(Sender: TObject);
  private
  protected
    procedure CalcFlowLayoutHeight;
    procedure ClickSurImage(Sender: TObject);
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  System.IOUtils;

procedure TForm2.Button1Click(Sender: TObject);
var
  files: TArray<string>;
  folder: string;
  i: integer;
  pnl: tpanel;
  img: timage;
  cb: tcheckbox;
begin
  // Empty the scroll box
  while FlowLayout1.ChildrenCount > 0 do
    FlowLayout1.Children[0].Free;

  // Load pictures list from a folder
  folder := tpath.Combine(tpath.GetPicturesPath, 'demos - Portraits');
  if not tdirectory.Exists(folder) then
    folder := tpath.GetPicturesPath;
  files := tdirectory.GetFiles(folder);

  // Add pictures in the scroll box with a checkbox
  for i := 0 to length(files) - 1 do
    if tfile.Exists(files[i]) and (files[i].tolower.EndsWith('.jpg') or
      files[i].tolower.EndsWith('.jpeg') or files[i].tolower.EndsWith('.png'))
    then
    begin
      pnl := tpanel.Create(self);
      try
        pnl.Parent := FlowLayout1;
        pnl.Width := 260;
        pnl.Height := 280;
        img := timage.Create(pnl);
        try
          img.Parent := pnl;
          img.Align := talignlayout.client;
          img.Margins.Top := 5;
          img.Margins.right := 5;
          img.Margins.bottom := 5;
          img.Margins.left := 5;
          img.WrapMode := TImageWrapMode.Fit;
          img.Bitmap.LoadFromFile(files[i]);
        except
          img.Free;
          raise;
        end;
        cb := tcheckbox.Create(pnl);
        try
          cb.Parent := pnl;
          cb.Align := talignlayout.bottom;
          cb.Text := tpath.GetFileNameWithoutExtension(files[i]);
        except
          cb.Free;
          raise;
        end;
        pnl.OnClick := ClickSurImage;
        pnl.TagObject := cb;
        img.OnClick := ClickSurImage;
        img.TagObject := cb;
      except
        pnl.Free;
      end;
    end;

  // Refresh the Flow Layout
  CalcFlowLayoutHeight;
end;

procedure TForm2.CalcFlowLayoutHeight;
var
  NewHeight: single;
  i: integer;
  c: tcontrol;
begin
  NewHeight := 0;
  for i := 0 to FlowLayout1.ChildrenCount - 1 do
    if (FlowLayout1.Children[i] is tcontrol) then
    begin
      c := FlowLayout1.Children[i] as tcontrol;
      if c.Position.Y + c.Height + c.Margins.bottom > NewHeight then
        NewHeight := c.Position.Y + c.Height + c.Margins.bottom;
    end;
  FlowLayout1.Height := NewHeight;
end;

procedure TForm2.ClickSurImage(Sender: TObject);
begin
  if (Sender is tcontrol) and assigned((Sender as tcontrol).TagObject) and
    ((Sender as tcontrol).TagObject is tcheckbox) then
    ((Sender as tcontrol).TagObject as tcheckbox).isChecked :=
      not((Sender as tcontrol).TagObject as tcheckbox).isChecked;
end;

procedure TForm2.VertScrollBox1Resize(Sender: TObject);
begin
  CalcFlowLayoutHeight;
end;

end.

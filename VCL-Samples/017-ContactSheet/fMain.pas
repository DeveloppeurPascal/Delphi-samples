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
  File last update : 2025-02-09T11:12:21.035+01:00
  Signature : 280c967add5e8f0e4d84d7e60372673d3c0a496a
  ***************************************************************************
*)

unit fMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
  private
  protected
    procedure CalcPicturesPositionInScrollBox;
    procedure ClickSurImage(Sender: TObject);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Uses
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  System.IOUtils;

procedure TForm1.Button1Click(Sender: TObject);
var
  files: TArray<string>;
  folder: string;
  i: integer;
  pnl: tpanel;
  img: timage;
  cb: tcheckbox;
begin
  // Empty the scroll box
  while ScrollBox1.ControlCount > 0 do
    ScrollBox1.Controls[0].Free;

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
        pnl.Parent := ScrollBox1;
        pnl.Width := 260;
        pnl.Height := 280;
        img := timage.Create(pnl);
        try
          img.Parent := pnl;
          img.Align := alclient;
          img.AlignWithMargins := true;
          img.Margins.Top := 5;
          img.Margins.right := 5;
          img.Margins.bottom := 5;
          img.Margins.left := 5;
          img.Stretch := true;
          img.Proportional := true;
          img.Picture.LoadFromFile(files[i]);
        except
          img.Free;
          raise;
        end;
        cb := tcheckbox.Create(pnl);
        try
          cb.Parent := pnl;
          cb.Align := albottom;
          cb.Caption := tpath.GetFileNameWithoutExtension(files[i]);
          cb.AlignWithMargins := true;
        except
          cb.Free;
          raise;
        end;
        pnl.OnClick := ClickSurImage;
        img.OnClick := ClickSurImage;
      except
        pnl.Free;
      end;
    end;

  // Refresh ScrollBox
  CalcPicturesPositionInScrollBox;
end;

procedure TForm1.CalcPicturesPositionInScrollBox;
var
  i: integer;
  x, y: integer;
  CurCtrl, PrevCtrl: tcontrol;
begin
  x := 5;
  y := 5;
  PrevCtrl := nil;
  for i := 0 to ScrollBox1.ControlCount - 1 do
  begin
    CurCtrl := ScrollBox1.Controls[i];
    if (x + CurCtrl.Margins.left + CurCtrl.Width + CurCtrl.Margins.right >
      ScrollBox1.ClientWidth) and assigned(PrevCtrl) then
    begin
      x := 5;
      y := y + PrevCtrl.Height + PrevCtrl.Margins.bottom + CurCtrl.Margins.Top;
    end;
    CurCtrl.left := x;
    CurCtrl.Top := y;
    x := x + CurCtrl.Margins.left + CurCtrl.Width + CurCtrl.Margins.right;
    PrevCtrl := CurCtrl;
  end;
end;

procedure TForm1.ClickSurImage(Sender: TObject);
begin
  if Sender is timage then
    ClickSurImage((Sender as timage).Parent)
  else if (Sender is tpanel) and ((Sender as tpanel).ControlCount = 2) and
    ((Sender as tpanel).Controls[1] is tcheckbox) then
  begin
    ((Sender as tpanel).Controls[1] as tcheckbox).Checked :=
      not((Sender as tpanel).Controls[1] as tcheckbox).Checked;
  end;
end;

procedure TForm1.ScrollBox1Resize(Sender: TObject);
begin
  CalcPicturesPositionInScrollBox;
end;

end.

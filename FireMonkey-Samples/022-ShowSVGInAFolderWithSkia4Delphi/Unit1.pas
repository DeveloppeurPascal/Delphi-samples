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
  File last update : 2025-10-25T20:59:09.678+02:00
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

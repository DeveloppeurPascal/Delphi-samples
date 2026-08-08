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
  File last update : 2026-07-19T09:26:36.000+02:00
  Signature : 383fc0f000da8dbcd75a881a46fb668bdac5e4a6
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
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Objects, FMX.Effects;

type
  TForm14 = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    procedure Rectangle1Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure Rectangle1Painting(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure Rectangle2Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure Rectangle2Painting(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure Rectangle3Paint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    procedure Rectangle3Painting(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.fmx}

procedure TForm14.Rectangle1Paint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  CanvasState: TCanvasSaveState;
begin
  CanvasState := canvas.SaveState;
  try
    canvas.Fill.Kind := TBrushKind.Solid;
    canvas.fill.Color := talphacolors.Yellow;
    canvas.FillRect(TRectF.Create(arect.Left, arect.top, arect.Right * 2 / 5,
        arect.Bottom), 0.5);
  finally
    canvas.RestoreState(CanvasState);
  end;
end;

procedure TForm14.Rectangle1Painting(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
//var
//  CanvasState: TCanvasSaveState;
begin
  (Sender as TRectangle).Fill.Color := talphacolors.blue;
  //  CanvasState := canvas.SaveState;
  //  try
  //    canvas.Fill.Kind := TBrushKind.Solid;
  //    canvas.fill.Color := talphacolors.red;
  //    canvas.FillRect(arect, 1);
  //  finally
  //    canvas.RestoreState(CanvasState);
  //  end;
end;

procedure TForm14.Rectangle2Paint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  CanvasState: TCanvasSaveState;
begin
  CanvasState := canvas.SaveState;
  try
    canvas.Fill.Kind := TBrushKind.Solid;
    canvas.fill.Color := talphacolors.Yellow;
    canvas.FillRect(TRectF.Create(arect.Left, arect.top, arect.Right * 3 / 5,
        arect.Bottom), 0.5);
  finally
    canvas.RestoreState(CanvasState);
  end;
end;

procedure TForm14.Rectangle2Painting(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
//var
//  CanvasState: TCanvasSaveState;
begin
  (Sender as TRectangle).Fill.Color := talphacolors.white;
  //  CanvasState := canvas.SaveState;
  //  try
  //    canvas.Fill.Kind := TBrushKind.Solid;
  //    canvas.fill.Color := talphacolors.red;
  //    canvas.FillRect(arect, 1);
  //  finally
  //    canvas.RestoreState(CanvasState);
  //  end;
end;

procedure TForm14.Rectangle3Paint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
var
  CanvasState: TCanvasSaveState;
begin
  CanvasState := canvas.SaveState;
  try
    canvas.Fill.Kind := TBrushKind.Solid;
    canvas.fill.Color := talphacolors.Yellow;
    canvas.FillRect(TRectF.Create(arect.Left, arect.top, arect.Right * 4 / 5,
        arect.Bottom), 0.5);
  finally
    canvas.RestoreState(CanvasState);
  end;
end;

procedure TForm14.Rectangle3Painting(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
//var
//  CanvasState: TCanvasSaveState;
begin
  (Sender as TRectangle).Fill.Color := talphacolors.Red;
  //  CanvasState := canvas.SaveState;
  //  try
  //    canvas.Fill.Kind := TBrushKind.Solid;
  //    canvas.fill.Color := talphacolors.red;
  //    canvas.FillRect(arect, 1);
  //  finally
  //    canvas.RestoreState(CanvasState);
  //  end;
end;

end.


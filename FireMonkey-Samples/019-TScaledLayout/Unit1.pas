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
  File last update : 2025-10-25T20:59:09.666+02:00
  Signature : ee258021afc16733383d7aadef58aaeea662970e
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  TForm1 = class(TForm)
    ScaledLayout1: TScaledLayout;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure TrackBar1Tracking(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar2Tracking(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    w, h: single;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  w := ScaledLayout1.OriginalWidth;
  h := ScaledLayout1.OriginalHeight;
end;

procedure TForm1.TrackBar1Tracking(Sender: TObject);
begin
  ScaledLayout1.OriginalWidth := w * TrackBar1.value / 50;
  ScaledLayout1.OriginalHeight := h * TrackBar1.value / 50;
  ScaledLayout1.Repaint;
end;

procedure TForm1.TrackBar2Tracking(Sender: TObject);
begin
  ScaledLayout1.Width := w * TrackBar2.value / 50;
  ScaledLayout1.Height := h * TrackBar2.value / 50;
end;

end.

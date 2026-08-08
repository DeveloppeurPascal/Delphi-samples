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
  File last update : 2026-08-04T19:47:14.000+02:00
  Signature : aab4122ad322506147bae71cf466780e92a44a4e
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
  FMX.Effects,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Objects;

type
  TfrmMain = class(TForm)
    rBackground: TRectangle;
    rContent: TRectangle;
    Edit1: TEdit;
    ShadowEffect1: TShadowEffect;
    btnHideKeyboard: TButton;
    btnAtTheBottom: TButton;
    procedure FormSafeAreaChanged(Sender: TObject; const AInsets: TRectF);
    procedure FormVirtualKeyboardHidden(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardShown(Sender: TObject;
      KeyboardVisible: Boolean; const Bounds: TRect);
  private
    FPrevPaddingBottom: single;
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.FormSafeAreaChanged(Sender: TObject; const AInsets:
  TRectF);
begin
  Padding.Rect := AInsets;
end;

procedure TfrmMain.FormVirtualKeyboardHidden(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  Padding.bottom := FPrevPaddingBottom;
end;

procedure TfrmMain.FormVirtualKeyboardShown(Sender: TObject;
  KeyboardVisible: Boolean; const Bounds: TRect);
begin
  FPrevPaddingBottom := Padding.bottom;
  Padding.bottom := Padding.bottom + Bounds.Height;
end;

end.


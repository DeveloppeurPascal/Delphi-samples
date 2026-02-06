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
  File last update : 2026-01-22T18:39:18.000+01:00
  Signature : fa6866092cc50781681b41066b7575e35a51b4f8
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
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    btnForm2ShowModal: TButton;
    btnForm2Show: TButton;
    btnForm3ShowModal: TButton;
    btnForm3Show: TButton;
    Edit1: TEdit;
    procedure btnForm2ShowModalClick(Sender: TObject);
    procedure btnForm3ShowModalClick(Sender: TObject);
    procedure btnForm2ShowClick(Sender: TObject);
    procedure btnForm3ShowClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  fSecond,
  fThird;

procedure TForm1.btnForm2ShowClick(Sender: TObject);
var
  f: tform2;
begin
  f := tform2.Create(self);
  try
    f.Label1.Text := edit1.Text;
    f.Show;
  finally
    //    f.Free; // à faire autrement
  end;
end;

procedure TForm1.btnForm2ShowModalClick(Sender: TObject);
var
  f: tform2;
begin
  f := tform2.Create(self);
  try
    f.Label1.Text := edit1.Text;
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TForm1.btnForm3ShowClick(Sender: TObject);
var
  f: tform3;
begin
  f := tform3.Create(self);
  try
    f.Label1.Text := edit1.Text;
    f.Form3ModalResultProc := procedure(const ModalResult: TModalResult)
    begin
      ShowMessage(Integer(ModalResult).ToString);
    end;
    f.Show;
    // Pas de retour, donc impossible d'avoir "Res"
//    ShowMessage(Integer(Res).ToString);
  finally
    //    f.Free; // libération à faire autrement
  end;
end;

procedure TForm1.btnForm3ShowModalClick(Sender: TObject);
var
  f: tform3;
  Res: TModalResult;
begin
  f := tform3.Create(self);
  try
    f.Label1.Text := edit1.Text;
    Res := f.ShowModal;
    ShowMessage(Integer(Res).ToString);
  finally
    f.Free;
  end;
end;

initialization
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
end.


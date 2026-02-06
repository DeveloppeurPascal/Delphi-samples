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
  File last update : 2025-12-22T20:09:02.225+01:00
  Signature : 7b3a2ec75bb676db0f250697c0b4db957bc39e39
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
  Olf.FMX.AboutDialog,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    OlfAboutDialog1: TOlfAboutDialog;
    VertScrollBox1: TVertScrollBox;
    Label1: TLabel;
    FlowLayout1: TFlowLayout;
    btnMedia: TButton;
    btnEmprunteurs: TButton;
    btnEmprunts: TButton;
    btnMediaType: TButton;
    btnAbout: TButton;
    btnExit: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnMediaTypeClick(Sender: TObject);
    procedure VertScrollBox1Resized(Sender: TObject);
    procedure btnEmprunteursClick(Sender: TObject);
    procedure btnMediaClick(Sender: TObject);
    procedure btnEmpruntsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    procedure FlowLayoutHeightResize(const FlowLayout: TFlowLayout);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  fMediaType,
  fEmprunteurs,
  fMedia,
  fEmprunts;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  OlfAboutDialog1.Execute;
end;

procedure TfrmMain.btnEmprunteursClick(Sender: TObject);
var
  frm: TfrmEmprunteurs;
begin
  frm := TfrmEmprunteurs.Create(Self);
{$IF Defined(IOS) or Defined(ANDROID)}
  frm.Show;
{$ELSE}
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
{$ENDIF}
end;

procedure TfrmMain.btnEmpruntsClick(Sender: TObject);
var
  frm: TfrmEmprunts;
begin
  frm := TfrmEmprunts.Create(Self);
{$IF Defined(IOS) or Defined(ANDROID)}
  frm.Show;
{$ELSE}
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
{$ENDIF}
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.btnMediaClick(Sender: TObject);
var
  frm: TfrmMedia;
begin
  frm := TfrmMedia.Create(Self);
{$IF Defined(IOS) or Defined(ANDROID)}
  frm.Show;
{$ELSE}
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
{$ENDIF}
end;

procedure TfrmMain.btnMediaTypeClick(Sender: TObject);
var
  frm: TfrmMediaType;
begin
  frm := TfrmMediaType.Create(Self);
{$IF Defined(IOS) or Defined(ANDROID)}
  frm.Show;
{$ELSE}
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
{$ENDIF}
end;

procedure TfrmMain.FlowLayoutHeightResize(const FlowLayout: TFlowLayout);
var
  i: integer;
  h: single;
  c: tcontrol;
begin
  h := 0;
  for i := 0 to FlowLayout.ChildrenCount - 1 do
    if (FlowLayout.Children[i] is TControl) then
    begin
      c := FlowLayout.Children[i] as tcontrol;
      if (h < c.Position.y + c.Height + c.margins.bottom) then
        h := c.Position.y + c.Height + c.margins.bottom;
    end;
  FlowLayout.Height := h;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  label1.Text := OlfAboutDialog1.GetMainFormCaption;
end;

procedure TfrmMain.VertScrollBox1Resized(Sender: TObject);
begin
  FlowLayoutHeightResize(FlowLayout1);
end;

initialization
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
end.


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
  File last update : 2025-10-25T20:59:09.718+02:00
  Signature : 91cfc82c26e2651e3de5d431363be1f3f951c3d9
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
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  fThirdWithCallback;

type
  TfrmMain = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    btnOpenAndClose: TButton;
    btnOpenWithACallback: TButton;
    procedure btnOpenAndCloseClick(Sender: TObject);
    procedure btnOpenWithACallbackClick(Sender: TObject);
  private
  protected
    procedure btnOpenWithACallbackClickCallback(const Sender
      : TfrmThirdWithCallBack; const AModalResult: TModalResult);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  fSecondForm;

procedure TfrmMain.btnOpenAndCloseClick(Sender: TObject);
var
  frm: TfrmSecondForm;
begin
  frm := TfrmSecondForm.Create(self);
  try
{$IF Defined(IOS) or Defined(Android)}
    frm.Show;
{$ELSE}
    frm.ShowModal;
{$ENDIF}
  finally
{$IF Defined(IOS) or Defined(Android)}
{$ELSE}
    frm.Free;
{$ENDIF}
  end;
end;

procedure TfrmMain.btnOpenWithACallbackClick(Sender: TObject);
var
  frm: TfrmThirdWithCallBack;
begin
  frm := TfrmThirdWithCallBack.Create(self);
  try
    frm.OnThirdWithCallBackCloseEvent := btnOpenWithACallbackClickCallback;
{$IF Defined(IOS) or Defined(Android)}
    frm.Show;
{$ELSE}
    frm.ShowModal;
{$ENDIF}
  finally
{$IF Defined(IOS) or Defined(Android)}
{$ELSE}
    frm.Free;
{$ENDIF}
  end;
end;

procedure TfrmMain.btnOpenWithACallbackClickCallback(const Sender
  : TfrmThirdWithCallBack; const AModalResult: TModalResult);
begin
  case AModalResult of
    mrok:
      ShowMessage('ok');
    mrcancel:
      ShowMessage('Cancel');
  else
    ShowMessage('Unknown answer !');
  end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

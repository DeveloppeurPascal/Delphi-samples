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
  File last update : 2026-01-22T17:26:06.000+01:00
  Signature : 779660e9c9fa47b17ffddde6860edd01c6891521
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
  System.Actions,
  FMX.ActnList,
  FMX.Menus,
  uDM;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    actQuitter: TAction;
    actOpenForm: TAction;
    actAboutBox: TAction;
    actInputBox: TAction;
    actMessageBox: TAction;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure actQuitterExecute(Sender: TObject);
    procedure actOpenFormExecute(Sender: TObject);
    procedure actAboutBoxExecute(Sender: TObject);
    procedure actInputBoxExecute(Sender: TObject);
    procedure actMessageBoxExecute(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  fSecond;

procedure TForm1.actAboutBoxExecute(Sender: TObject);
begin
  ShowMessage('Demo d''application FireMonkey.');
end;

procedure TForm1.actInputBoxExecute(Sender: TObject);
var
  s: string;
begin
  s := InputBox('question', 'what ?', 'else !');
  Label1.Text := s.ToUpper;
end;

procedure TForm1.actMessageBoxExecute(Sender: TObject);
begin
  case MessageDlg('ceci est un message', tmsgdlgtype.mtInformation, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0, TMsgDlgBtn.mbOK)
  of
    mrOK: label1.Text := 'ok';
    mrCancel: label1.Text := 'cancel';
  else
    raise Exception.Create('Unknown answer');
  end;
end;

procedure TForm1.actOpenFormExecute(Sender: TObject);
var
  f: TForm2;
begin
  f := tform2.Create(self);
  try
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TForm1.actQuitterExecute(Sender: TObject);
begin
  close;
end;

end.


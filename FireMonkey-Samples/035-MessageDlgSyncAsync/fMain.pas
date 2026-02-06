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
  File last update : 2026-01-22T18:07:00.000+01:00
  Signature : 6fd9404ce0cd2f37586b4037bf4e5fad8f8f0990
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
  FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Switch1: TSwitch;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  FMX.DialogService;

procedure TForm1.Button1Click(Sender: TObject);
var
  ok: boolean;
begin
  MessageDlg('Etes-vous d''accord ?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, tmsgdlgbtn.mbYes,
    procedure(const ModalResult: TModalResult)
    begin
      ok := modalresult = mrYes; // mbYes
    end);
  showmessage(ok.ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  ok: boolean;
begin
  TDialogService.MessageDialog('Etes-vous d''accord ?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
    tmsgdlgbtn.mbYes, 0, procedure(const ModalResult: TModalResult)
    begin
      ok := modalresult = mrYes; // mbYes
    end);
  showmessage(ok.ToString);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  tdialogservice.ShowMessage('hello', procedure(const ModalResult: TModalResult)
    begin
      showmessage('world');
    end);
  showmessage('and co');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  Switch1.IsChecked := TDialogService.PreferredMode in [TDialogService.TPreferredMode.Platform,
    TDialogService.TPreferredMode.Async];
{$ELSE}
  Switch1.IsChecked := TDialogService.PreferredMode in [TDialogService.TPreferredMode.Async];
{$ENDIF}
end;

procedure TForm1.Switch1Switch(Sender: TObject);
begin
  if Switch1.IsChecked then
    // Asynchrone (par défaut sur Android, iOS)
    TDialogService.PreferredMode := TDialogService.TPreferredMode.Async
  else
    // Synchrone (par défaut sur Windows, Mac, Linux)
    TDialogService.PreferredMode := TDialogService.TPreferredMode.Sync;
end;

end.


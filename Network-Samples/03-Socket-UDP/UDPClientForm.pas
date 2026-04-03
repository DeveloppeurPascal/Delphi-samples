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
  File last update : 2026-02-25T20:56:34.000+01:00
  Signature : ccb9dcc7e14230d1c7a902fe982db6258cc2448b
  ***************************************************************************
*)

unit UDPClientForm;

interface

uses
  System.Net.Socket,
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
  FMX.Memo.Types,
  FMX.Layouts,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit;

type
  TfrmClient = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Layout1: TLayout;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSocket: TSocket;
  protected
    procedure AddLog(const Text: string);
  public
    procedure AfterConstruction; override;
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.fmx}

uses
  uConsts;

procedure TfrmClient.AddLog(const Text: string);
begin
  TThread.Queue(nil, procedure
    begin
      memo1.lines.Add(Text);
    end);
end;

procedure TfrmClient.AfterConstruction;
begin
  inherited;
  fsocket := tsocket.Create(tsockettype.UDP, tencoding.UTF8);
  fsocket.Bind(ClientPort);
  if TSocketState.Connected in fsocket.state then
    addlog('Connected');
  if TSocketState.Client in fsocket.state then
    addlog('Client');
  if TSocketState.Listening in fsocket.state then
    addlog('Listening');
end;

procedure TfrmClient.Button1Click(Sender: TObject);
var
  nb: integer;
begin
  if edit1.text.IsEmpty then
    exit;
  // TODO : change your server IP address
  nb := fsocket.sendto(edit1.Text, TNetEndpoint.Create(127, 0, 0, 1, ServerPort));
  addlog('envoyés : ' + nb.tostring);
  addlog(edit1.Text);
  edit1.SelectAll;
  edit1.SetFocus;
end;

procedure TfrmClient.FormActivate(Sender: TObject);
begin
  edit1.SetFocus;
end;

procedure TfrmClient.FormDestroy(Sender: TObject);
begin
  FSocket.Free;
end;

procedure TfrmClient.Timer1Timer(Sender: TObject);
var
  s: string;
begin
  s := FSocket.ReceiveStringFrom;
  if not s.IsEmpty then
    addlog(s);
end;

initialization
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
end.


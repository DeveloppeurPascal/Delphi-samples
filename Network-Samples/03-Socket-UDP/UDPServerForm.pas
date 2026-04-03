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
  File last update : 2026-04-03T19:09:54.000+02:00
  Signature : 7d15d55e2671abc7db565f01319257393d8df642
  ***************************************************************************
*)

unit UDPServerForm;

interface

uses
{$IFDEF MSWINDOWS}
  Winapi.Winsock2,
  System.Net.Socket,
{$ELSE}
  System.Net.Socket,
{$ENDIF}
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
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo;

type
  TfrmServer = class(TForm)
    Memo1: TMemo;
  private
  protected
    FServerThread: TThread;
    procedure AddLog(const Text: string);
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.fmx}

uses
  uConsts;

procedure TfrmServer.AddLog(const Text: string);
begin
  TThread.Queue(nil, procedure
    begin
      memo1.lines.Add(Text);
    end);
end;

procedure TfrmServer.AfterConstruction;
begin
  inherited;
  FServerThread := tthread.CreateAnonymousThread(procedure
    var
      FServerSocket: TSocket;
      s: string;
      Endpoint: TNetEndpoint;
    begin
      FServerSocket := TSocket.Create(TSocketType.UDP, TEncoding.UTF8);
      try
        FServerSocket.Bind(ServerPort);
        if TSocketState.Connected in FServerSocket.state then
          addlog('Connected');
        if TSocketState.Client in FServerSocket.state then
          addlog('Client');
        if TSocketState.Listening in FServerSocket.state then
          addlog('Listening');
        while not tthread.CheckTerminated do
        begin
          s := FServerSocket.ReceiveStringFrom(endpoint);
          if not s.IsEmpty then
          begin
            addlog('Received : ' + s);
            if (not endpoint.Address.Address.IsEmpty) then
              addlog('From ' + endpoint.Address.Address + ':' + endpoint.Port.ToString);
            fserversocket.sendto('ACK ' + s, endpoint);
          end;
          sleep(100);
        end;
      finally
        fserversocket.Free;
      end;
    end);
  FServerThread.Start;
end;

destructor TfrmServer.Destroy;
begin
  FServerThread.Terminate;
  sleep(100);
  inherited;
end;

initialization
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
end.


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
  File last update : 2026-07-19T10:07:28.000+02:00
  Signature : 767f3aca8af29575fe077533c94a5ecd4ff42b55
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
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo;

type
  TForm14 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure FormSaveState(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
  protected
    function GetLogFileName: string;
    procedure AddLog(const msg: string);
  public
  end;

var
  Form14: TForm14;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  FMX.Platform,
  System.Messaging;

procedure TForm14.AddLog(const msg: string);
var
  FileName: string;
begin
  FileName := GetLogFileName;
  if tFile.Exists(filename) then
    tfile.WriteAllText(FileName, tfile.ReadAllText(filename) + sLineBreak + msg)
  else
    tfile.WriteAllText(FileName, msg);
end;

procedure TForm14.Button1Click(Sender: TObject);
begin
  application.terminate;
end;

procedure TForm14.FormCreate(Sender: TObject);
var
  FileName: string;
begin
  TMessageManager.DefaultManager.SubscribeToMessage(TSaveStateMessage,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      AddLog('TSaveStateMessage');
    end);

  FileName := GetLogFileName;
  if tfile.Exists(filename) then
    memo1.lines.LoadFromFile(filename)
  else
    memo1.lines.add('no log file found');
end;

procedure TForm14.FormSaveState(Sender: TObject);
begin
  AddLog('OnSaveState');
end;

function TForm14.GetLogFileNAme: string;
begin
  result := TPath.Combine(TPath.GetTempPath,
    TPath.GetFileNameWithoutExtension(tpath.GetAppPath) + '.log');
end;

end.


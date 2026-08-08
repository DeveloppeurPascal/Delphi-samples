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
  File last update : 2026-07-18T18:56:56.000+02:00
  Signature : 6f6d8425811c40e30d9c97a0b26095e304bd0028
  ***************************************************************************
*)

unit fSecond;

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
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo;

type
  TfrmSecond = class(TForm)
    btnClose: TButton;
    btnTerminate: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure FormSaveState(Sender: TObject);
    procedure btnTerminateClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  protected
    IsClosedByUser: boolean;
  public
    function CloseQuery: Boolean; override;
  end;

var
  frmSecond: TfrmSecond;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  uSaveStateContext;

procedure TfrmSecond.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSecond.btnTerminateClick(Sender: TObject);
begin
  Application.Terminate;
end;

function TfrmSecond.CloseQuery: Boolean;
begin
  result := inherited;
  IsClosedByUser := true;
end;

procedure TfrmSecond.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  TThread.ForceQueue(nil, procedure
    begin
      Self.Free;
    end);
{$ENDIF}
end;

procedure TfrmSecond.FormCreate(Sender: TObject);
begin
  IsClosedByUser := false;

  if tfile.Exists(GetINIFilePath) then
  begin
    memo1.Lines.LoadFromFile(GetINIFilePath);
    edit1.Text := getkey('second');
  end
  else
    memo1.lines.Clear;
end;

procedure TfrmSecond.FormSaveState(Sender: TObject);
begin
  if not IsClosedByUser then
  begin
    AddKey('screen', classname);
    AddKey('second', edit1.Text);
  end
  else
  begin
    deletekey('screen');
    deletekey('second');
  end;
end;

end.


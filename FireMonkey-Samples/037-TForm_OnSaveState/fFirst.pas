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
  File last update : 2026-07-18T18:59:02.000+02:00
  Signature : 88c25bb018fe248d83041d4fef4084a27a29df67
  ***************************************************************************
*)

unit fFirst;

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
  FMX.Edit,
  FMX.Memo.Types,
  FMX.ScrollBox,
  FMX.Memo;

type
  TfrmFirst = class(TForm)
    btnShowSecondForm: TButton;
    btnTerminate: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure btnShowSecondFormClick(Sender: TObject);
    procedure FormSaveState(Sender: TObject);
    procedure btnTerminateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    IsClosedByUser: boolean;
  public
    function CloseQuery: Boolean; override;
  end;

var
  frmFirst: TfrmFirst;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  fSecond,
  uSaveStateContext;

procedure TfrmFirst.btnShowSecondFormClick(Sender: TObject);
var
  f: TfrmSecond;
begin
  f := TfrmSecond.Create(self);
{$IF Defined(IOS) or Defined(ANDROID)}
  f.show;
{$ELSE}
  try
    f.ShowModal;
  finally
    f.free;
  end;
{$ENDIF}
end;

procedure TfrmFirst.btnTerminateClick(Sender: TObject);
begin
  Application.Terminate;
end;

function TfrmFirst.CloseQuery: Boolean;
begin
  result := inherited;
  IsClosedByUser := true;
end;

procedure TfrmFirst.FormCreate(Sender: TObject);
begin
  IsClosedByUser := false;

  if tfile.Exists(GetINIFilePath) then
  begin
    memo1.Lines.LoadFromFile(GetINIFilePath);
    edit1.Text := getkey('first');
    // don't show a modal form before showing first one
    TTHread.ForceQueue(nil, procedure
      begin
        // of course, using the good name is better if you have more than 2 forms
        if not GetKey('screen').IsEmpty then
          btnShowSecondFormClick(sender);
      end);
  end
  else
    memo1.lines.Clear;
end;

procedure TfrmFirst.FormSaveState(Sender: TObject);
begin
  if not IsClosedByUser then
  begin
    AddKey('first', edit1.Text);
  end
  else
  begin
    deletekey('first');
  end;
end;

end.


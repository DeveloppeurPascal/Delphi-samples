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
  File last update : 2025-12-22T20:09:02.227+01:00
  Signature : 7167540f70d0624dd6d376ed70d49ec9714bebf4
  ***************************************************************************
*)

unit fMediaType;

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
  uDB,
  System.Rtti,
  FMX.Grid.Style,
  Data.Bind.Controls,
  FMX.StdCtrls,
  FMX.Layouts,
  Fmx.Bind.Navigator,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Grid,
  Data.Bind.EngExt,
  Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid,
  System.Bindings.Outputs,
  Fmx.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.Grid,
  Data.Bind.DBScope;

type
  TfrmMediaType = class(TForm)
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    btnClose: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

implementation

{$R *.fmx}

uses
  Data.DB;

procedure TfrmMediaType.btnCloseClick(Sender: TObject);
begin
  if dmDB.tabMediaType.State in [dsEdit, dsInsert] then
    dmDB.tabMediaType.Cancel;
  Close;
end;

procedure TfrmMediaType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  TThread.ForceQueue(nil, procedure
    begin
      Self.Free;
    end);
{$ENDIF}
end;

end.


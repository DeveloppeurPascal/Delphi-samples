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
  Signature : 0c58f2712760bb21f1769a240a9f417fa11e9588
  ***************************************************************************
*)

unit fMedia;

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
  uDB,
  Data.Bind.Controls,
  FMX.Layouts,
  Fmx.Bind.Navigator,
  System.Rtti,
  FMX.Grid.Style,
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
  TfrmMedia = class(TForm)
    btnClose: TButton;
    BindNavigator1: TBindNavigator;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    btnEmprunts: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEmpruntsClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.fmx}

uses
  Data.DB,
  fEmprunts;

procedure TfrmMedia.btnCloseClick(Sender: TObject);
begin
  if dmDB.tabMedia.State in [dsEdit, dsInsert] then
    dmDB.tabMedia.Cancel;
  Close;
end;

procedure TfrmMedia.btnEmpruntsClick(Sender: TObject);
var
  frm: TfrmEmprunts;
begin
  if (dmDB.tabMedia.State in [dsBrowse]) and (dmDB.tabMedia.FieldByName('id').AsInteger >= 0) then
  begin
    frm := TfrmEmprunts.Create(Self);
    frm.FilterType := TEmpruntFilterType.Media;
    frm.FilterID := dmDB.tabMedia.FieldByName('id').AsInteger;
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
end;

procedure TfrmMedia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  TThread.ForceQueue(nil, procedure
    begin
      Self.Free;
    end);
{$ENDIF}
end;

end.


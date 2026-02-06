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
  File last update : 2025-12-22T20:09:02.217+01:00
  Signature : 98f6d5990e41ace17deeb2438457882343c2aa50
  ***************************************************************************
*)

unit fEmprunteurs;

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
  System.Rtti,
  FMX.Grid.Style,
  Data.Bind.Controls,
  FMX.Layouts,
  Fmx.Bind.Navigator,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  uDB,
  Data.Bind.EngExt,
  Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid,
  System.Bindings.Outputs,
  Fmx.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.Grid,
  Data.Bind.DBScope;

type
  TfrmEmprunteurs = class(TForm)
    btnFermer: TButton;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    btnEmprunts: TButton;
    procedure btnFermerClick(Sender: TObject);
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

procedure TfrmEmprunteurs.btnEmpruntsClick(Sender: TObject);
var
  frm: TfrmEmprunts;
begin
  if (dmDB.tabEmprunteurs.State in [dsBrowse]) and (dmDB.tabEmprunteurs.FieldByName('id').AsInteger >= 0) then
  begin
    frm := TfrmEmprunts.Create(Self);
    frm.FilterType := TEmpruntFilterType.Emprunteur;
    frm.FilterID := dmDB.tabEmprunteurs.FieldByName('id').AsInteger;
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

procedure TfrmEmprunteurs.btnFermerClick(Sender: TObject);
begin
  if dmDB.tabEmprunteurs.State in [dsEdit, dsInsert] then
    dmDB.tabEmprunteurs.Cancel;
  Close;
end;

procedure TfrmEmprunteurs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  TThread.ForceQueue(nil, procedure
    begin
      Self.Free;
    end);
{$ENDIF}
end;

end.


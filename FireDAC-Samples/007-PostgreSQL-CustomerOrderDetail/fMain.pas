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
  File last update : 2026-01-24T09:20:48.577+01:00
  Signature : d1b13eab778faa9647964f05b0d98e61e39d0f90
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
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Layouts,
  uDM,
  System.Rtti,
  System.Bindings.Outputs,
  Fmx.Bind.Editors,
  Data.Bind.EngExt,
  Fmx.Bind.DBEngExt,
  Data.Bind.Components,
  Data.Bind.DBScope;

type
  TForm1 = class(TForm)
    lServerConnexion: TLayout;
    edtServerIP: TEdit;
    btnConnect: TButton;
    lCustomers: TLayout;
    lvCustomers: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure lvCustomersItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  fOrders;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  DataModule3.FDConnection1.Params.Values['Server'] := if edtServerIP.Text.IsEmpty then
    'localhost'
  else
    edtServerIP.Text;
  DataModule3.FDConnection1.Open;
  if DataModule3.FDConnection1.Connected then
  begin
    lServerConnexion.Visible := false;
    lCustomers.Visible := true;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lServerConnexion.Visible := true;
  lCustomers.Visible := false;
  edtServerIP.SetFocus;
end;

procedure TForm1.lvCustomersItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  TForm2.Create(Self).ShowModal;
end;

initialization
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
end.


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
  Signature : 4b1d5b8df1abfa9a98877d9881808461ee86d2fb
  ***************************************************************************
*)

unit fOrders;

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
  uDM,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  System.Rtti,
  FMX.Grid.Style,
  Data.Bind.Controls,
  FMX.StdCtrls,
  FMX.Layouts,
  Fmx.Bind.Navigator,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Grid,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Data.Bind.EngExt,
  Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid,
  System.Bindings.Outputs,
  Fmx.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.Grid,
  Data.Bind.DBScope;

type
  TForm2 = class(TForm)
    tabOrders: TFDTable;
    dsCustomers: TDataSource;
    tabOrderDetails: TFDTable;
    dsOrders: TDataSource;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    StringGrid2: TStringGrid;
    BindNavigator2: TBindNavigator;
    Splitter1: TSplitter;
    btnClose: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    lOrders: TLayout;
    lOrderDeteils: TLayout;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TThread.ForceQueue(nil, procedure
    begin
      Self.Free;
    end);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  tabOrders.Open;
  tabOrderDetails.Open;
end;

end.


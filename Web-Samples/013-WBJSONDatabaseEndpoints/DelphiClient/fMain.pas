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
  File last update : 2026-01-24T09:20:48.584+01:00
  Signature : 0fe5a32fce2bb3000210c7e88b00b106cfb778a6
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
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  System.Rtti,
  FMX.Grid.Style,
  Data.Bind.Controls,
  FMX.StdCtrls,
  FMX.Edit,
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
  Data.Bind.DBScope,
  FireDAC.Stan.StorageJSON;

type
  TForm1 = class(TForm)
    FDMemTable1: TFDMemTable;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    Layout1: TLayout;
    Edit1: TEdit;
    btnLoad: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    procedure btnLoadClick(Sender: TObject);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.net.URLClient,
  System.Net.HttpClient;

procedure TForm1.btnLoadClick(Sender: TObject);
var
  url: string;
begin
  btnload.Enabled := false;
  url := (if Edit1.Text.IsEmpty then
      edit1.TextPrompt
    else
      edit1.Text) + '/fd';
  turlstream.Create(url, procedure(AStream: TStream)
    begin
      try
        StringGrid1.BeginUpdate;
        try
          if FDMemTable1.Active then
            FDMemTable1.EmptyDataSet;
          FDMemTable1.LoadFromStream(astream, TFDStorageFormat.sfJSON);
          if not FDMemTable1.Active then
            fdmemtable1.Open;
        finally
          StringGrid1.EndUpdate;
        end;
      finally
        btnload.Enabled := true;
      end;
    end, true, true);
end;

end.


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
  File last update : 2025-10-25T20:59:09.374+02:00
  Signature : 366464f2a36e3fc53af2e6524b1e7d10999c7ad3
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, System.Rtti, FMX.Grid.Style,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Controls, FMX.Layouts,
  FMX.Bind.Navigator, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, IPPeerClient, IPPeerServer, FMX.StdCtrls, System.Tether.Manager, System.Tether.AppProfile,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    StringGrid1: TStringGrid;
    BindNavigator1: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1CellClick(const Column: TColumn; const Row: Integer);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.ioutils;

const
  FichName = 'Presentation-RADStudio-Delphi.db';

procedure TForm1.FormCreate(Sender: TObject);
var
  nom_fichier: string;
  database_existante: boolean;
begin
  nom_fichier := tpath.Combine(tpath.GetDocumentsPath, FichName);
  database_existante := tfile.Exists(nom_fichier);
  FDConnection1.Params.Clear;
  FDConnection1.Params.Values['DriverID'] := 'SQLite';
  FDConnection1.Params.Values['Database'] := nom_fichier;
{$IFDEF DEBUG}
  FDConnection1.Params.Values['Password'] := '';
  FDConnection1.Params.Values['Encrypt'] := '';
{$ELSE}
  FDConnection1.Params.Values['Password'] := FilePassword;
  FDConnection1.Params.Values['Encrypt'] := 'aes-256';
{$ENDIF}
  FDConnection1.LoginPrompt := false;
  FDConnection1.Connected := true;
  if not database_existante then
  begin
    FDConnection1.ExecSQL('CREATE TABLE IF NOT EXISTS liste (' + 'id INTEGER PRIMARY Key, ' + 'libelle VARCHAR(50) DEFAULT "", ' +
      'coche INTEGER DEFAULT 0' + ')');
    FDConnection1.ExecSQL('CREATE INDEX IF NOT EXISTS liste_by_id ON liste (id,libelle)');
    FDConnection1.ExecSQL('CREATE INDEX IF NOT EXISTS liste_by_libelle ON liste (libelle,id)');
  end;
  FDTable1.Active := true;
end;

procedure TForm1.StringGrid1CellClick(const Column: TColumn; const Row: Integer);
var
  i: Integer;
  ch: string;
begin
  ch := StringGrid1.Cells[column.Index,row];
  showmessage(ch);
  for i := 0 to TetheringAppProfile1.ConnectedProfiles.Count - 1 do
  begin
    TetheringAppProfile1.SendString(TetheringAppProfile1.ConnectedProfiles[i], 'elem', ch);
  end;

end;

end.

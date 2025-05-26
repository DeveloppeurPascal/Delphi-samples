(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

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
  https://github.com/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-02-09T11:12:20.776+01:00
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

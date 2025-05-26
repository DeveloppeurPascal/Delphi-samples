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
  File last update : 2025-02-09T11:12:20.881+01:00
  Signature : 83385616cd1b1b6c0e9725a0d4baeb3210661097
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,  Data.Bind.Controls, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, FMX.Layouts, FMX.ListBox, Data.Bind.Components, Data.Bind.DBScope, FMX.Bind.Navigator, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, Data.DB, FMX.ScrollBox, FMX.Memo,
  FMX.Grid.Style, Fmx.Bind.Grid, Data.Bind.Grid, FMX.Grid, uDM;

type
  TForm1 = class(TForm)
    BindNavigator1: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    Layout1: TLayout;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    StringGrid1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BindNavigator1Click(Sender: TObject; Button: TNavigateButton);
begin
  if Button in [TNavigateButton.nbInsert, TNavigateButton.nbEdit] then
    Edit1.SetFocus;
  // ListBox1.Selected.IsChecked := CheckBox1.IsChecked;
end;

end.

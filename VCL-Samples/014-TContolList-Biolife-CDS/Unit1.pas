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
  File last update : 2025-02-09T11:12:21.018+01:00
  Signature : 1b8431e1b4bf09342e8e3efe013d025d2fbf3e18
  ***************************************************************************
*)

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Controls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.ControlList, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, Vcl.ControlList;

type
  TForm1 = class(TForm)
    ControlList1: TControlList;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    Image1: TImage;
    BindNavigator2: TBindNavigator;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure ControlList1ItemClick(Sender: TObject);
    procedure BindNavigator2Click(Sender: TObject; Button: TNavigateButton);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BindNavigator2Click(Sender: TObject; Button: TNavigateButton);
begin
  if (Button in [TNavigateButton.nbFirst, TNavigateButton.nbPrior,
    TNavigateButton.nbNext, TNavigateButton.nbLast]) then
    Label2.Caption := Label1.Caption;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  ControlList1.MultiSelect := CheckBox1.Checked;
end;

procedure TForm1.ControlList1ItemClick(Sender: TObject);
begin
  showmessage(Label1.Caption);
  Label2.Caption := Label1.Caption;
end;

end.

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
  File last update : 2025-10-25T20:59:10.341+02:00
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

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
  File last update : 2025-02-09T11:12:20.820+01:00
  Signature : a01e3d3414aa1145a31ef80adbf8ac31591190e2
  ***************************************************************************
*)

unit MasterDetail;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListView.Types, Data.Bind.GenData,
  Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.Objects, FMX.StdCtrls, FMX.ListView, FMX.ListView.Appearances,
  FMX.Layouts, FMX.MultiView,FMX.Memo, Fmx.Bind.Navigator, System.Actions, FMX.ActnList,
  FMX.ListView.Adapters.Base, FMX.ScrollBox, FMX.Controls.Presentation,
  FMX.Memo.Types;

type
  TMasterDetailForm = class(TForm)
    MultiView1: TMultiView;
    Layout1: TLayout;
    ListView1: TListView;
    MasterToolbar: TToolBar;
    MasterLabel: TLabel;
    DetailToolbar: TToolBar;
    DetailLabel: TLabel;
    MasterButton: TSpeedButton;
    imgContact: TImage;
    lblName: TLabel;
    lblTitle: TLabel;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    Layout2: TLayout;
    Layout3: TLayout;
    Memo1: TMemo;
    LinkControlToField1: TLinkControlToField;
    LinkListControlToField1: TLinkListControlToField;
    ActionList1: TActionList;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    btnUp: TSpeedButton;
    btnDown: TSpeedButton;
    procedure ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MasterDetailForm: TMasterDetailForm;

implementation

{$R *.fmx}

procedure TMasterDetailForm.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  MultiView1.HideMaster;
end;

end.

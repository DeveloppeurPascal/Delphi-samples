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
  File last update : 2025-04-01T11:58:58.129+02:00
  Signature : 84cbffa1e51bc7ba1ea435259e112a75c603a68e
  ***************************************************************************
*)

unit Unit1;

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
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Edit;

type
  TForm1 = class(TForm)
    Button1: TButton;
    FlowLayout1: TFlowLayout;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    FNbPlusPlus: integer;
    function GetNbPlusPlus: integer;
    { Déclarations privées }
  public
    { Déclarations publiques }

    property NbPlusPlus: integer read GetNbPlusPlus;
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  e: tedit;
begin
  e := tedit.Create(self);
  e.parent := FlowLayout1;
  e.text := 'self';
  e.Name := 'Edt' + NbPlusPlus.ToString;
  e.tagString := 'MonEdit_' + NbPlusPlus.ToString;
  e.OnEnter := Edit1Enter;
  e.width := FlowLayout1.width;

  e := tedit.Create(nil);
  e.parent := FlowLayout1;
  e.text := 'nil';
  e.Name := 'Edt' + NbPlusPlus.ToString;
  e.tagString := 'MonEdit_' + NbPlusPlus.ToString;
  e.OnEnter := Edit1Enter;
  e.width := FlowLayout1.width;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (components[i] is tedit) and (components[i] as tedit)
      .tagString.endswith('_14') then
    begin
      (components[i] as tedit).SetFocus;
      break;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  c: TComponent;
begin
  c := FindComponent('Edt5');
  if c is tedit then
    (c as tedit).SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  i: integer;
  e: tedit;
begin
  for i := 0 to ComponentCount - 1 do
    if components[i] is tedit then
    begin
      e := components[i] as tedit;
      e.text := e.Name + ' - ' + e.tagString;
    end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i: integer;
  e: tedit;
begin
  for i := 0 to FlowLayout1.ChildrenCount - 1 do
    if FlowLayout1.Children[i] is tedit then
    begin
      e := FlowLayout1.Children[i] as tedit;
      if e.Owner = nil then
        e.text := 'nil (pas glop)'
      else if e.Owner is TComponent then
        e.text := (e.Owner as TComponent).Name
      else
        e.text := 'unknow owner';
    end;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
  FNbPlusPlus := 0;
end;

procedure TForm1.Edit1Enter(Sender: TObject);
begin
  if Sender is tedit then
    Label1.text := (Sender as tedit).tagString;
end;

function TForm1.GetNbPlusPlus: integer;
begin
  FNbPlusPlus := FNbPlusPlus + 1;
  result := FNbPlusPlus;
end;

end.

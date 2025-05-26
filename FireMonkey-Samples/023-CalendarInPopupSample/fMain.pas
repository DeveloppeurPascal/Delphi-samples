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
  File last update : 2025-02-09T11:12:20.944+01:00
  Signature : 4410a5257d010fa9d2eaf61d20f3e7828ef3adb3
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Calendar, FMX.DateTimeCtrls, FMX.StdCtrls,
  FMX.Edit;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Popup1: TPopup;
    Calendar1: TCalendar;
    DropDownEditButton1: TDropDownEditButton;
    Button1: TButton;
    EditButton1: TEditButton;
    procedure Calendar1DateSelected(Sender: TObject);
    procedure DropDownEditButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    OldEdit1Value: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.DateUtils;

procedure TForm1.Button1Click(Sender: TObject);
begin
  showmessage(Edit1.text);
end;

procedure TForm1.Calendar1DateSelected(Sender: TObject);
begin
  Edit1.text := Calendar1.DateTime.ToISO8601.Substring(0, 10);
end;

procedure TForm1.DropDownEditButton1Click(Sender: TObject);
begin
  if not Popup1.IsOpen then
    OldEdit1Value := Edit1.text;
  Popup1.Width := Calendar1.Width;
  Popup1.Height := Calendar1.Height;
  Popup1.IsOpen := not Popup1.IsOpen;
end;

procedure TForm1.EditButton1Click(Sender: TObject);
begin
  if Edit1.text <> OldEdit1Value then
    Edit1.text := OldEdit1Value
  else
    Edit1.text := '';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OldEdit1Value := '';
end;

end.

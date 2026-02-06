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
  File last update : 2025-10-25T20:59:09.686+02:00
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

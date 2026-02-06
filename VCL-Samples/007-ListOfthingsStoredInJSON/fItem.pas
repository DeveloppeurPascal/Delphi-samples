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
  File last update : 2025-10-25T20:59:10.293+02:00
  Signature : 5f197b28bd354fb8db46ef7973e0bb4e27aa1854
  ***************************************************************************
*)

unit fItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TLigne = class(TFrame)
    CheckBox1: TCheckBox;
    btnModifier: TBitBtn;
    btnSupprimer: TBitBtn;
    procedure btnSupprimerClick(Sender: TObject);
    procedure btnModifierClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

uses fMain;

procedure TLigne.btnModifierClick(Sender: TObject);
var
  ch: string;
begin
  ch := inputbox('Modifier', 'Libellé ?', CheckBox1.Caption);
  if (ch.Trim.Length > 0) then
  begin
    CheckBox1.Caption := ch.Trim;
    if (parent.parent.parent is TForm1) then
      (parent.parent.parent as TForm1).listemodifiee := true;
  end;
end;

procedure TLigne.btnSupprimerClick(Sender: TObject);
begin
  if MessageDlg('Supprimer la liste ?', tmsgdlgtype.mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    if (parent.parent.parent is TForm1) then
      (parent.parent.parent as TForm1).listemodifiee := true;
    Free;
  end;
end;

end.

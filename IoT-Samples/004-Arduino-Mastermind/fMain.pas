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
  File last update : 2025-10-25T20:59:09.741+02:00
  Signature : 382f6af5c68d8f3a7de94a4146d5dfd8a2f74cfd
  ***************************************************************************
*)

unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, OoMisc, AdPort, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ApdComPort1: TApdComPort;
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    procedure ApdComPort1TriggerAvail(CP: TObject; Count: Word);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Fmotdepasse: string;
    Fsaisieencours: string;
    { Déclarations privées }
    procedure demarrer;
    procedure ajouter_chiffre(c: ansichar);
    procedure Setmotdepasse(const Value: string);
    procedure Setsaisieencours(const Value: string);
    procedure tester_mot_de_passe;
    property motdepasse: string read Fmotdepasse write Setmotdepasse;
    property saisieencours: string read Fsaisieencours write Setsaisieencours;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ajouter_chiffre(c: ansichar);
begin
  if (c in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) and (motdepasse.Length > 0) then
  begin
    saisieencours := saisieencours + c;
    Label1.caption := Label1.caption + c;
    if saisieencours.Length = motdepasse.Length then
      tester_mot_de_passe;
  end
  else
    beep;
end;

procedure TForm1.ApdComPort1TriggerAvail(CP: TObject; Count: Word);
var
  c: ansichar;
begin
  while (Count > 0) do
  begin
    c := ApdComPort1.GetChar;
    ajouter_chiffre(c);
    dec(Count);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Visible := false;
  demarrer;
end;

procedure TForm1.demarrer;
var
  i: integer;
begin
  Memo1.Lines.Clear;
  Label1.caption := '';
  saisieencours := '';
  motdepasse := '';
  for i := 1 to 4 do
    motdepasse := motdepasse + random(10).tostring;
  Memo1.Lines.Add('A vous de jouer !');
  Memo1.Lines.Add('- => chiffre inconnu');
  Memo1.Lines.Add('x => chiffre mal positionné');
  Memo1.Lines.Add('X => chiffre à sa place');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ApdComPort1.Open := true;
  Label1.caption := '';
  Memo1.Lines.Clear;
end;

procedure TForm1.Setmotdepasse(const Value: string);
begin
  Fmotdepasse := Value;
end;

procedure TForm1.Setsaisieencours(const Value: string);
begin
  Fsaisieencours := Value;
end;

procedure TForm1.tester_mot_de_passe;
var
  i: integer;
  rep_justes: integer;
  rep: string;
begin
  Label1.caption := '';
  rep_justes := 0;
  for i := 0 to saisieencours.Length - 1 do
  begin
    if (saisieencours.Substring(i, 1) = motdepasse.Substring(i, 1)) then
    begin
      inc(rep_justes);
      rep := rep + 'X';
    end
    else if motdepasse.Contains(saisieencours.Substring(i, 1)) then
      rep := rep + 'x'
    else
      rep := rep + '-';
  end;
  if rep_justes = motdepasse.Length then
  begin
    Memo1.Lines.Add('Bravo, c''était bien ' + saisieencours);
    Button1.Visible := true;
  end
  else
  begin
    Memo1.Lines.Add(saisieencours + ' ' + rep);
    saisieencours := '';
  end;
end;

end.

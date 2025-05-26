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
  File last update : 2025-02-09T11:12:20.954+01:00
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

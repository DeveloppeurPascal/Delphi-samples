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

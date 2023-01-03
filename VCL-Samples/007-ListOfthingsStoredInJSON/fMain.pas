unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.Json;

type
  TForm1 = class(TForm)
    gbAjout: TGroupBox;
    gbListe: TGroupBox;
    btnAjouter: TBitBtn;
    btnQuitter: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnFermer2: TBitBtn;
    Panel1: TPanel;
    ScrollBox1: TScrollBox;
    btnReload: TBitBtn;
    procedure btnQuitterClick(Sender: TObject);
    procedure btnAjouterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnReloadClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FlisteModifiee: boolean;
    { Déclarations privées }
    procedure displayListe;
    procedure displayAjout;
    procedure ajoutLigne(jso: TJSONObject; vraiAjout: boolean = false);
    procedure chargeListe;
    procedure SauveListe;
    procedure SetlisteModifiee(const Value: boolean);
  public
    { Déclarations publiques }
    property listeModifiee: boolean read FlisteModifiee write SetlisteModifiee;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses System.IOUtils, fItem;

const
  FichName = 'Presentation-RADStudio-Delphi.json';

procedure TForm1.ajoutLigne(jso: TJSONObject; vraiAjout: boolean);
var
  libelle: string;
  coche: boolean;
  ligne: tligne;
begin
  try
    try
      libelle := (jso.GetValue('libelle') as TJSONString).Value;
    except
      libelle := '';
    end;
    try
      coche := (jso.GetValue('coche') as TJSONBool).AsBoolean;
    except
      coche := false;
    end;
    ligne := tligne.Create(Self);
    try
      ligne.Name := '';
      ligne.Parent := ScrollBox1;
      ligne.Align := alTop;
      ligne.CheckBox1.Checked := coche;
      ligne.CheckBox1.Caption := libelle;
      if vraiAjout then
        listeModifiee := true;
    except
      FreeAndNil(ligne);
    end;
  finally
    if vraiAjout then
      FreeAndNil(jso);
  end;
end;

procedure TForm1.btnOkClick(Sender: TObject);
var
  ch: string;
begin
  ch := LabeledEdit1.text;
  if (ch.Trim.Length > 0) then
    ajoutLigne(TJSONObject.Create.AddPair('libelle', ch.Trim).AddPair('coche', TJSONBool.Create(false)), true);
  displayListe;
end;

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  { TODO 5 -oDeveloppeurPascal : ok, voir si on fait quelque chose de plus }
  displayListe;
end;

procedure TForm1.btnAjouterClick(Sender: TObject);
begin
  displayAjout;
end;

procedure TForm1.btnQuitterClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnReloadClick(Sender: TObject);
begin
  chargeListe;
end;

procedure TForm1.chargeListe;
var
  jso: TJSONObject;
  jsa: TJSONArray;
  jsv: TJSONValue;
  c: tcontrol;
  i: integer;
  filename: string;
begin
  for i := ScrollBox1.ControlCount - 1 downto 0 do
  begin
    c := ScrollBox1.Controls[i];
    if (c is tligne) then
      FreeAndNil(c);
  end;
  filename := TPath.Combine(TPath.GetDocumentsPath, FichName);
  if tfile.Exists(filename) then
  begin
    jso := TJSONObject.ParseJSONValue(tfile.ReadAllText(filename, TEncoding.UTF8)) as TJSONObject;
    try
      try
        jsa := jso.GetValue('liste') as TJSONArray;
      except
        jsa := TJSONArray.Create;
      end;
      try
        for jsv in jsa do
        begin
          ajoutLigne(jsv as TJSONObject);
        end;
      finally
        // FreeAndNil(jsa);
      end;
    finally
      FreeAndNil(jso);
    end;
  end;
end;

procedure TForm1.displayAjout;
begin
  gbListe.Visible := false;
  gbAjout.Visible := true;
  LabeledEdit1.text := '';
  LabeledEdit1.setFocus;
end;

procedure TForm1.displayListe;
begin
  gbListe.Visible := true;
  gbAjout.Visible := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  gbListe.Align := alClient;
  gbAjout.Align := alClient;
  displayListe;
  chargeListe;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if listeModifiee then
    SauveListe;
end;

procedure TForm1.SauveListe;
var
  jso: TJSONObject;
  jsa: TJSONArray;
  i: integer;
  c: tcontrol;
  l: tligne;
begin
  jso := TJSONObject.Create;
  try
    jsa := TJSONArray.Create;
    try
      jso.AddPair('liste', jsa);
      for i := 0 to ScrollBox1.ControlCount - 1 do
      begin
        c := ScrollBox1.Controls[i];
        if (c is tligne) then
        begin
          l := c as tligne;
          jsa.AddElement(TJSONObject.Create.AddPair('libelle', l.CheckBox1.Caption).AddPair('coche', TJSONBool.Create(l.CheckBox1.Checked)));
        end;
      end;
      tfile.WriteAllText(TPath.Combine(TPath.GetDocumentsPath, FichName), jso.ToJSON, TEncoding.UTF8);
      listeModifiee := false;
    finally
      // FreeAndNil(jsa);
    end;
  finally
    FreeAndNil(jso);
  end;
end;

procedure TForm1.SetlisteModifiee(const Value: boolean);
begin
  FlisteModifiee := Value;
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.

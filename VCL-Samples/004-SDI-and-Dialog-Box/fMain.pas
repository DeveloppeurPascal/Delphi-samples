unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    nb: integer;
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses fDialogBox;

procedure TForm1.Button1Click(Sender: TObject);
var
  fiche: tform2;
begin
  inc(nb);
  fiche := tform2.Create(Self);
  fiche.Label1.Caption := 'Fiche ' + nb.ToString;
  fiche.Caption := fiche.Label1.Caption;
  fiche.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  fiche: tform2;
begin
  fiche := tform2.Create(Self);
  try
    fiche.Label1.Caption := 'Fenêtre bloquante';
    fiche.Caption := fiche.Label1.Caption;
    fiche.ShowModal;
  finally
    FreeAndNil(fiche);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  nb := 0;
end;

initialization

ReportMemoryLeaksOnShutdown := true;

end.

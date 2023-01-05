unit fAccueil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.Buttons, Vcl.StdCtrls, uDMImages;

type
  TfrmAccueil = class(TForm)
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    Actions1: TMenuItem;
    Bouton1: TMenuItem;
    BitBtn2: TMenuItem;
    SpeedButton2: TMenuItem;
    actQuitter: TAction;
    actButton: TAction;
    actBitBtn: TAction;
    actSpeedButton: TAction;
    procedure actBitBtnExecute(Sender: TObject);
    procedure actButtonExecute(Sender: TObject);
    procedure actSpeedButtonExecute(Sender: TObject);
    procedure actQuitterExecute(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmAccueil: TfrmAccueil;

implementation

{$R *.dfm}

procedure TfrmAccueil.actBitBtnExecute(Sender: TObject);
begin
  //
end;

procedure TfrmAccueil.actButtonExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAccueil.actQuitterExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAccueil.actSpeedButtonExecute(Sender: TObject);
begin
  //
end;

end.

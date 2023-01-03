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

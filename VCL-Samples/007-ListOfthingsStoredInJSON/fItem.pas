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
  File last update : 2025-02-09T11:12:20.985+01:00
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

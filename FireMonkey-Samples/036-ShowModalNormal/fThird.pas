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
  File last update : 2026-01-22T18:38:44.000+01:00
  Signature : 606555318551b0ac3ca518685c37541cf3c9ea51
  ***************************************************************************
*)

unit fThird;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Controls.Presentation;

type
  TForm3ModalResultProc = reference to procedure(const ModalResult: TModalResult);
  TForm3 = class(TForm)
    Label1: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
  public
    Form3ModalResultProc: TForm3ModalResultProc;
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.btnCancelClick(Sender: TObject);
begin
  if not (TFMXFormState.Modal in FormState) then
  begin // fenêtre ouverte en .Show et non en .ShowModal, donc ModalResult du bouton inopérant
    if assigned(Form3ModalResultProc) then
      Form3ModalResultProc(mrCancel);
    // Form3ModalResultProc((Sender as TButton).ModalResult); // permet d'utiliser cette méthode sur le onClick des deux boutons
    close;
  end;
end;

procedure TForm3.btnOkClick(Sender: TObject);
begin
  if not (TFMXFormState.Modal in FormState) then
  begin // fenêtre ouverte en .Show et non en .ShowModal, donc ModalResult du bouton inopérant
    if assigned(Form3ModalResultProc) then
      Form3ModalResultProc(mrOk);
    close;
  end;
end;

constructor TForm3.Create(AOwner: TComponent);
begin
  inherited;
  Form3ModalResultProc := nil;
end;

end.


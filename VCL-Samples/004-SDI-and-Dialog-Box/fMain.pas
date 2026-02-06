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
  File last update : 2025-10-25T20:59:10.280+02:00
  Signature : 09baaa8c4097e52917884681136d53362fa985ab
  ***************************************************************************
*)

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

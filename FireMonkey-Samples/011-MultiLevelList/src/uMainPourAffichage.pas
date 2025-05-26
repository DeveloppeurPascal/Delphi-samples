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
  File last update : 2025-02-09T11:12:20.905+01:00
  Signature : 414815a0e29fb61b3b051f06855bbbda965220ca
  ***************************************************************************
*)

unit uMainPourAffichage;

interface
// TODO : gérer les touches ESC et Hardware Back dans le module de choix pour revenir au niveau précédent
// TODO : recalcul du TFlowLayout sur l'affichage et le resize de l'écran de niveau 1 (photos)
// TODO : recalcul du TFlowLayout sur un resize de la fiche
// TODO : ajouter un bouton "quitter" sur le niveau 1 (pour sortir sans sélection)

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TfrmMain = class(TForm)
    BlocAttenteChargement: TRectangle;
    BlocAttenteChargementAnimation: TAniIndicator;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
    procedure EcranBloque;
    procedure EcranDebloque;
    procedure InitialiseEcran;
    procedure ProblemeDeBaseDeDonnees;
  public
    { Déclarations publiques }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.threading, uDBPourAffichage, fChoisirUnTarif;

{ TfrmMain }

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  TChoisirUnTarif.Execute(
    procedure(IDTarifChoisi: integer)
    begin
      if (IDTarifChoisi < 0) then
        showmessage('Aucun tarif sélectionné')
      else
        showmessage('Tarif choisi : ' + IDTarifChoisi.ToString);
    end);
end;

procedure TfrmMain.EcranBloque;
begin
  BlocAttenteChargement.Visible := true;
  BlocAttenteChargementAnimation.Enabled := true;
  BlocAttenteChargement.BringToFront;
end;

procedure TfrmMain.EcranDebloque;
begin
  BlocAttenteChargementAnimation.Enabled := false;
  BlocAttenteChargement.Visible := false;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  EcranBloque;
  try
    if not assigned(dmDBPourAffichage) then
      dmDBPourAffichage := tdmDBPourAffichage.create(self);
    ttask.run(
      procedure
      var
        ok: boolean;
      begin
        try
          repeat
            sleep(100);
            tthread.Synchronize(nil,
              procedure
              begin
                ok := dmDBPourAffichage.dbCategories.Connected;
              end);
          until (tthread.CheckTerminated or ok);
        finally
          tthread.Queue(nil,
            procedure
            begin
              EcranDebloque;
              if dmDBPourAffichage.dbCategories.Connected then
                InitialiseEcran
              else
                ProblemeDeBaseDeDonnees;
            end);
        end;
      end);
  except
    EcranDebloque;
  end;
end;

procedure TfrmMain.InitialiseEcran;
begin
  // TODO : à compléter si quelque chose à faire ici

end;

procedure TfrmMain.ProblemeDeBaseDeDonnees;
begin
  showmessage('Impossible d''ouvrir la base de données.');
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

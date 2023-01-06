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

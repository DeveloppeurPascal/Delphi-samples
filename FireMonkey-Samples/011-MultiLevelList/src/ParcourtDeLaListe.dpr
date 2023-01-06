program ParcourtDeLaListe;

uses
  System.StartUpCopy,
  FMX.Forms,
  fChoisirUnTarif in 'fChoisirUnTarif.pas' {ChoisirUnTarif},
  uDBPourAffichage in 'uDBPourAffichage.pas' {dmDBPourAffichage: TDataModule},
  uConst in 'uConst.pas',
  uDownloadAndGetFiles in 'uDownloadAndGetFiles.pas',
  uFichiersEtDossiers in 'uFichiersEtDossiers.pas',
  uMainPourAffichage in 'uMainPourAffichage.pas' {frmMain},
  u_download in '..\..\..\Libraries\librairies\u_download.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

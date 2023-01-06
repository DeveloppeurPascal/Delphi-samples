program ListeArborescence;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uDownloadAndGetFiles in 'uDownloadAndGetFiles.pas',
  uConst in 'uConst.pas',
  uFichiersEtDossiers in 'uFichiersEtDossiers.pas',
  uDBCategories in 'uDBCategories.pas' {dmDBCategories: TDataModule},
  u_download in '..\..\..\Libraries\librairies\u_download.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

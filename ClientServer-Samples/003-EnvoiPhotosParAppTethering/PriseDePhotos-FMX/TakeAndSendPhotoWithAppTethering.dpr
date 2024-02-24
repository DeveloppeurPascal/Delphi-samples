program TakeAndSendPhotoWithAppTethering;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uAppTetheringSettings in '..\uAppTetheringSettings.pas',
  uDMAppTetheringSender in '..\uDMAppTetheringSender.pas' {dmAppTetheringSender: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmAppTetheringSender, dmAppTetheringSender);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

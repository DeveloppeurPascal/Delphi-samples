program ReceivePhotoFromAppTetheringVCL;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {frmMain},
  uAppTetheringSettings in '..\uAppTetheringSettings.pas',
  uDMAppTetheringReceiver in '..\uDMAppTetheringReceiver.pas' {dmAppTetheringReceiver: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmAppTetheringReceiver, dmAppTetheringReceiver);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

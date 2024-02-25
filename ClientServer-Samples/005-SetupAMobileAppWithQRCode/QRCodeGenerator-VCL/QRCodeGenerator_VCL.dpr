program QRCodeGenerator_VCL;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {frmMain},
  uChecksumVerif in '..\..\..\Libraries\librairies\uChecksumVerif.pas',
  u_md5 in '..\..\..\Libraries\librairies\u_md5.pas',
  uConsts in '..\uConsts.pas',
  DelphiZXIngQRCode in '..\..\..\Libraries\DelphiZXingQRCode\Source\DelphiZXIngQRCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

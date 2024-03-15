program QRCodeGenerator_VCL;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {frmMain},
  uConsts in '..\uConsts.pas',
  DelphiZXIngQRCode in '..\..\..\Libraries\DelphiZXingQRCode\Source\DelphiZXIngQRCode.pas',
  Olf.RTL.Checksum in '..\..\..\Libraries\librairies\src\Olf.RTL.Checksum.pas',
  u_md5 in '..\..\..\Libraries\librairies\src\u_md5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

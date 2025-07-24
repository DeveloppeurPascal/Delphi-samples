program MultiFormOnMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  fSecondForm in 'fSecondForm.pas' {frmSecondForm},
  fThirdWithCallback in 'fThirdWithCallback.pas' {frmThirdWithCallBack};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

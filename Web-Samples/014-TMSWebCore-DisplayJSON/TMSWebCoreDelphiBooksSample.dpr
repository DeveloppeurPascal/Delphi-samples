program TMSWebCoreDelphiBooksSample;

uses
  Vcl.Forms,
  WEBLib.Forms,
  PageWeb1 in 'PageWeb1.pas' {Form1: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

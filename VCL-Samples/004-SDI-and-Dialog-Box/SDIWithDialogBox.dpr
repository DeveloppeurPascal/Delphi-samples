program SDIWithDialogBox;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form1},
  fDialogBox in 'fDialogBox.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

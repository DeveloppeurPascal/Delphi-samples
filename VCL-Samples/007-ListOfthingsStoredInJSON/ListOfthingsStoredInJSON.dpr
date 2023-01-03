program ListOfthingsStoredInJSON;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form1},
  fItem in 'fItem.pas' {Ligne: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

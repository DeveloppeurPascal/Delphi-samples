program TTouchKeyboard_with_Style;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

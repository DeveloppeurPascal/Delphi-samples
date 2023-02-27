program FolderOrFileSelect;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  udmAdobeStock_13945297 in 'udmAdobeStock_13945297.pas' {dmAdobeStock_13945297: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmAdobeStock_13945297, dmAdobeStock_13945297);
  Application.Run;
end.

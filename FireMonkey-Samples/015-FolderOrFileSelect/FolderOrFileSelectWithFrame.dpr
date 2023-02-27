program FolderOrFileSelectWithFrame;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMainBis in 'fMainBis.pas' {Form2},
  udmAdobeStock_13945297 in 'udmAdobeStock_13945297.pas' {dmAdobeStock_13945297: TDataModule},
  cadFileSelectionFrame in 'cadFileSelectionFrame.pas' {FileSelectionFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TdmAdobeStock_13945297, dmAdobeStock_13945297);
  Application.Run;
end.

program DownloadAndOpenAPDFFile;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  u_urlOpen in '..\..\Libraries\librairies\src\u_urlOpen.pas',
  u_download in '..\..\Libraries\librairies\src\u_download.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

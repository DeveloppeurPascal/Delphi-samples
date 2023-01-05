program VirtualImageList;

uses
  Vcl.Forms,
  fAccueil in 'fAccueil.pas' {frmAccueil},
  uDMImages in 'uDMImages.pas' {dmImages: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmAccueil, frmAccueil);
  Application.Run;
end.

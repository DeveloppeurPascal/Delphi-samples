unit fMainBis;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  cadFileSelectionFrame, FMX.Memo.Types, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo;

type
  TForm2 = class(TForm)
    FileSelectionFrame1: TFileSelectionFrame;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses System.IOUtils;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FileSelectionFrame1.SelectFile(tpath.GetDocumentsPath, tpath.GetDocumentsPath,
    procedure(fichier: string)
    begin
      Memo1.Lines.Insert(0, fichier);
    end);
end;

end.

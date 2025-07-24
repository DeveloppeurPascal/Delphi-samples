unit fSecondForm;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmSecondForm = class(TForm)
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

implementation

{$R *.fmx}

procedure TfrmSecondForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSecondForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(Android)}
  TThread.ForceQueue(nil,
    procedure
    begin
      Self.Free;
    end);
{$ENDIF}
end;

end.

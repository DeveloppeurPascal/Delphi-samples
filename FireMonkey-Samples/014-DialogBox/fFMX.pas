unit fFMX;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses
  FMX.DialogService;

procedure TForm2.Button1Click(Sender: TObject);
begin
  TDialogservice.MessageDialog('Bonjour, comment ça va bien ?',
    tmsgdlgtype.mtconfirmation, [tmsgdlgbtn.mbOk, tmsgdlgbtn.mbCancel],
    tmsgdlgbtn.mbOk, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrok:
          Showmessage('Tant mieux.');
        mrcancel:
          Showmessage('Retournez vous coucher');
      else
        raise exception.Create('pas glop');
      end;
    end);
end;

initialization

TDialogservice.PreferredMode := TDialogservice.TPreferredMode.Async;

end.

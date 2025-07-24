unit fMain;

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
  FMX.StdCtrls,
  FMX.Layouts,
  fThirdWithCallback;

type
  TfrmMain = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    btnOpenAndClose: TButton;
    btnOpenWithACallback: TButton;
    procedure btnOpenAndCloseClick(Sender: TObject);
    procedure btnOpenWithACallbackClick(Sender: TObject);
  private
  protected
    procedure btnOpenWithACallbackClickCallback(const Sender
      : TfrmThirdWithCallBack; const AModalResult: TModalResult);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  fSecondForm;

procedure TfrmMain.btnOpenAndCloseClick(Sender: TObject);
var
  frm: TfrmSecondForm;
begin
  frm := TfrmSecondForm.Create(self);
  try
{$IF Defined(IOS) or Defined(Android)}
    frm.Show;
{$ELSE}
    frm.ShowModal;
{$ENDIF}
  finally
{$IF Defined(IOS) or Defined(Android)}
{$ELSE}
    frm.Free;
{$ENDIF}
  end;
end;

procedure TfrmMain.btnOpenWithACallbackClick(Sender: TObject);
var
  frm: TfrmThirdWithCallBack;
begin
  frm := TfrmThirdWithCallBack.Create(self);
  try
    frm.OnThirdWithCallBackCloseEvent := btnOpenWithACallbackClickCallback;
{$IF Defined(IOS) or Defined(Android)}
    frm.Show;
{$ELSE}
    frm.ShowModal;
{$ENDIF}
  finally
{$IF Defined(IOS) or Defined(Android)}
{$ELSE}
    frm.Free;
{$ENDIF}
  end;
end;

procedure TfrmMain.btnOpenWithACallbackClickCallback(const Sender
  : TfrmThirdWithCallBack; const AModalResult: TModalResult);
begin
  case AModalResult of
    mrok:
      ShowMessage('ok');
    mrcancel:
      ShowMessage('Cancel');
  else
    ShowMessage('Unknown answer !');
  end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

unit fThirdWithCallback;

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
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmThirdWithCallBack = class;

  TThirdWithCallBackCloseEvent = procedure(const Sender: TfrmThirdWithCallBack;
    const AModalResult: TModalResult) of object;

  TfrmThirdWithCallBack = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    Layout1: TLayout;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOnThirdWithCallBackCloseEvent: TThirdWithCallBackCloseEvent;
    procedure SetOnThirdWithCallBackCloseEvent(const Value
      : TThirdWithCallBackCloseEvent);
  public
    property OnThirdWithCallBackCloseEvent: TThirdWithCallBackCloseEvent
      read FOnThirdWithCallBackCloseEvent
      write SetOnThirdWithCallBackCloseEvent;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

procedure TfrmThirdWithCallBack.btnCancelClick(Sender: TObject);
begin
  if assigned(FOnThirdWithCallBackCloseEvent) then
    FOnThirdWithCallBackCloseEvent(self, mrCancel);
  Close;
end;

procedure TfrmThirdWithCallBack.btnOkClick(Sender: TObject);
begin
  if assigned(FOnThirdWithCallBackCloseEvent) then
    FOnThirdWithCallBackCloseEvent(self, mrOk);
  Close;
end;

constructor TfrmThirdWithCallBack.Create(AOwner: TComponent);
begin
  inherited;
  FOnThirdWithCallBackCloseEvent := nil;
end;

procedure TfrmThirdWithCallBack.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(Android)}
  tthread.ForceQueue(nil,
    procedure
    begin
      self.Free;
    end);
{$ENDIF}
end;

procedure TfrmThirdWithCallBack.SetOnThirdWithCallBackCloseEvent
  (const Value: TThirdWithCallBackCloseEvent);
begin
  FOnThirdWithCallBackCloseEvent := Value;
end;

end.

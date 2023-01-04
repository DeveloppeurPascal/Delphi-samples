unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniButton, uniBitBtn, uniEdit,
  uniGUIBaseClasses, uniLabel;

type
  TMainForm = class(TUniForm)
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniBitBtn1: TUniBitBtn;
    procedure UniFormCreate(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniBitBtn1Click(Sender: TObject);
begin
  showmessage(UniEdit1.text);
  UniEdit1.setfocus;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  UniEdit1.text := '';
  UniEdit1.setfocus;
end;

initialization

RegisterAppFormClass(TMainForm);

end.

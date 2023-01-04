unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniDBNavigator, uniButton;

type
  TMainForm = class(TUniForm)
    UniDBNavigator1: TUniDBNavigator;
    UniDBGrid1: TUniDBGrid;
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Unit1, Unit2;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
  uniform2.ShowModalN;
end;

initialization

RegisterAppFormClass(TMainForm);

end.

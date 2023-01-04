unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniImageList, uniButton,
  uniBitBtn, uniEdit, uniDBEdit;

type
  TUniForm2 = class(TUniForm)
    UniDBEdit1: TUniDBEdit;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    UniImageList1: TUniImageList;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniForm2: TUniForm2;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Unit1, data.db;

function UniForm2: TUniForm2;
begin
  Result := TUniForm2(UniMainModule.GetFormInstance(TUniForm2));
end;

procedure TUniForm2.UniBitBtn1Click(Sender: TObject);
begin
  if DataModule1.EmployeeTable.State in [dsEdit, dsInsert] then
  begin
    DataModule1.EmployeeTable.Post;
  end;
end;

procedure TUniForm2.UniBitBtn2Click(Sender: TObject);
begin
  if DataModule1.EmployeeTable.State in [dsEdit, dsInsert] then
  begin
    DataModule1.EmployeeTable.Cancel;
  end;
end;

end.

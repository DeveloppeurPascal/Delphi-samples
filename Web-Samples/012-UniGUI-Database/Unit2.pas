(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Set of projects demonstrating the features of the Delphi development
  environment, its libraries and its programming language.

  Some of the projects have been presented at conferences, on training
  courses or online coding sessions.

  The programs are up to date with the Community Edition and the commercial
  version of Delphi or RAD Studio.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://samples.developpeur-pascal.fr

  Project site :
  https://github.com/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-02-09T11:12:21.071+01:00
  Signature : 729beedef591615285683b5f095eca24c8e662de
  ***************************************************************************
*)

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

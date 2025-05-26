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
  File last update : 2025-05-14T11:12:18.093+02:00
  Signature : 38dddb9d08bc57d7f2cd6646734b69b6f4324a32
  ***************************************************************************
*)

unit UnitFormMain;

// Original TParallel.For() sample from Danny Wind for the Code Rage 9
// https://dannywind.nl/delphi/coderage9/
//
// LoopState and Break added by Patrick Prémartin & Bernard Roussely (https://www.cyberens.fr)

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
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Memo,
  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox;

type
  TFormMain = class(TForm)
    Memo1: TMemo;
    ButtonStartParallelFor: TButton;
    procedure ButtonStartParallelForClick(Sender: TObject);
  private
  public
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  System.Threading;

procedure TFormMain.ButtonStartParallelForClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  TParallel.For(0, 100,
    procedure(Index: Integer; LoopState: TParallel.TLoopState)
    begin
      if LoopState.ShouldExit then
      begin
        TThread.Queue(TThread.CurrentThread,
          procedure
          begin
            Memo1.Lines.Add(Index.ToString + ' - Should Exit');
          end);
        exit;
      end;
      Sleep(100);
      TThread.Queue(TThread.CurrentThread,
        procedure
        begin
          Memo1.Lines.Add(Index.ToString);
        end);
      if (index > 6) then
      begin
        LoopState.break;
        exit;
      end;
    end);
end;

end.

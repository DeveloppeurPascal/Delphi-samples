(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-10-25T20:59:09.710+02:00
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

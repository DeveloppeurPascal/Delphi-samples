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
  File last update : 2025-10-25T20:59:09.718+02:00
  Signature : 8e41d931d875dfcd26004c8cfda9bb7312e66156
  ***************************************************************************
*)

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

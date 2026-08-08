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
  File last update : 2026-07-01T11:57:02.000+02:00
  Signature : c40ff0a6c07f886e3eb564108b5551621fa3e9e2
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Messaging,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
protected
procedure DoSomethingAfterReceivingTheMessage(const Sender: TObject; const M: TMessage);
  public
  end;

type
  TMyMessage = class(TMessage)
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TMessageManager.DefaultManager.SendMessage(self,TMyMessage.Create,true);
end;

procedure TForm1.DoSomethingAfterReceivingTheMessage(const Sender: TObject;
  const M: TMessage);
begin
  Memo1.Lines.Add(m.ClassName+' received');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TMessageManager.DefaultManager.SubscribeToMessage(TMyMessage,DoSomethingAfterReceivingTheMessage);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  TMessageManager.DefaultManager.Unsubscribe(TMyMessage,DoSomethingAfterReceivingTheMessage);
end;

end.

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
  File last update : 2025-12-24T17:00:46.593+01:00
  Signature : 797b5cb63ee47069c235d0b296263fc995b03749
  ***************************************************************************
*)

unit fSelectMedia;

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
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.ListView,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uDB,
  System.Rtti,
  System.Bindings.Outputs,
  Fmx.Bind.Editors,
  Data.Bind.EngExt,
  Fmx.Bind.DBEngExt,
  Data.Bind.Components,
  Data.Bind.DBScope,
  FMX.Grid.Style,
  Fmx.Bind.Grid,
  Data.Bind.Grid,
  FMX.ScrollBox,
  FMX.Grid;

type
  TDoOnCloseProc = procedure(media_id: integer) of object;
  TfrmSelectMedia = class(TForm)
    FDTable1: TFDTable;
    ListView1: TListView;
    btnClose: TButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    FDTable1id: TFDAutoIncField;
    FDTable1titre: TStringField;
    FDTable1gencod: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure ListView1ButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure FormCreate(Sender: TObject);
  private
    FSelectedId: integer;
    FOnDoOnClose: TDoOnCloseProc;
    procedure SetSelectedId(const Value: integer);
    procedure SetOnDoOnClose(const Value: TDoOnCloseProc);
  protected
  public
    property OnDoOnClose: TDoOnCloseProc read FOnDoOnClose write SetOnDoOnClose;
    property SelectedId: integer read FSelectedId write SetSelectedId;
    class function Execute(const DoOnClose: TDoOnCloseProc = nil): integer;
  end;

implementation

{$R *.fmx}

procedure TfrmSelectMedia.btnCloseClick(Sender: TObject);
begin
  Close;
end;

class function TfrmSelectMedia.Execute(const DoOnClose: TDoOnCloseProc): integer;
var
  f: TfrmSelectMedia;
begin
  f := TfrmSelectMedia.Create(nil);
  f.OnDoOnClose := DoOnClose;
{$IF Defined(IOS) or Defined(ANDROID)}
  // Asynchronous
  f.Show;
{$ELSE}
  // Synchronous
  try
    f.ShowModal;
    result := f.SelectedId;
  finally
    f.Free;
    if assigned(DoOnClose) then
      DoOnClose(result);
  end;
{$ENDIF}
end;

procedure TfrmSelectMedia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  TThread.ForceQueue(nil, procedure
    var
      DoOnClose: TDoOnCloseProc;
      SelecteID: integer;
    begin
      DoOnClose := Self.FOnDoOnClose;
      SelectedID := FSelectedId;
      Self.Free;
      if assigned(DoOnClose) then
        DoOnClose(SelectedId);
    end);
{$ENDIF}
end;

procedure TfrmSelectMedia.FormCreate(Sender: TObject);
begin
  FSelectedId := -1;
  FDTable1.Open;
end;

procedure TfrmSelectMedia.ListView1ButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
begin
  if assigned(aitem) and (FDTable1.FieldByName('id').AsInteger >= 0) then
  begin
    SelectedId := FDTable1.FieldByName('id').AsInteger;
    close;
  end;
end;

procedure TfrmSelectMedia.SetOnDoOnClose(const Value: TDoOnCloseProc);
begin
  FOnDoOnClose := Value;
end;

procedure TfrmSelectMedia.SetSelectedId(const Value: integer);
begin
  FSelectedId := Value;
end;

end.


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
  File last update : 2025-12-24T17:00:46.587+01:00
  Signature : d30748996d0684759bb84cd97c11a377d217e548
  ***************************************************************************
*)

unit fEmprunts;

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
  Data.Bind.Controls,
  System.Rtti,
  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.Layouts,
  Fmx.Bind.Navigator,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  uDB,
  Data.Bind.EngExt,
  Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid,
  System.Bindings.Outputs,
  Fmx.Bind.Editors,
  Data.Bind.Components,
  Data.Bind.Grid,
  Data.Bind.DBScope;

type
{$SCOPEDENUMS ON}
  TEmpruntFilterType = (None, Media, Emprunteur);

  TfrmEmprunts = class(TForm)
    btnClose: TButton;
    BindNavigator1: TBindNavigator;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    GridPanelLayout1: TGridPanelLayout;
    btnRendreLeMedia: TButton;
    btnNouvelEmprunt: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnRendreLeMediaClick(Sender: TObject);
    procedure btnNouvelEmpruntClick(Sender: TObject);
  private
    FFilterID: integer;
    FFilterType: TEmpruntFilterType;
    procedure SetFilterID(const Value: integer);
    procedure SetFilterType(const Value: TEmpruntFilterType);
    procedure btnNouvelEmpruntClick_Phase2(media_id: integer);
    procedure btnNouvelEmpruntClick_Phase3(media_id, emprunteur_id: integer);
  protected
    procedure UpdateFilter;
  public
    property FilterType: TEmpruntFilterType read FFilterType write SetFilterType;
    property FilterID: integer read FFilterID write SetFilterID;
  end;

implementation

{$R *.fmx}

uses
  Data.DB,
  fSelectMedia,
  fSelectEmprunteur;

procedure TfrmEmprunts.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmprunts.btnNouvelEmpruntClick(Sender: TObject);
begin
  // choix du média
  if FFilterType = TEmpruntFilterType.Media then
    btnNouvelEmpruntClick_Phase2(FFilterID)
  else
    TfrmSelectMedia.Execute(btnNouvelEmpruntClick_Phase2);
end;

procedure TfrmEmprunts.btnNouvelEmpruntClick_Phase2(media_id: integer);
var
  Nb: integer;
begin
  if media_id < 0 then
    exit;

  // vérifier que le media est libre (pas d'enregistrement à rendu='0')
  nb := dmdb.FDConnection1.ExecSQLScalar('select count(*) from emprunts where media_id=:mi and rendu=0', [media_id]);
  if nb > 0 then
  begin
    showmessage('Déja emprunté !');
    exit;
  end;

  // choix de l'emprunteur
  if FFilterType = TEmpruntFilterType.Emprunteur then
    btnNouvelEmpruntClick_Phase3(media_id, FFilterID)
  else
    TfrmSelectEmprunteur.Execute(btnNouvelEmpruntClick_Phase3, media_id);
end;

procedure TfrmEmprunts.btnNouvelEmpruntClick_Phase3(media_id,
  emprunteur_id: integer);
var
  CurDate: TDateTime;
begin
  if media_id < 0 then
    exit;

  if emprunteur_id < 0 then
    exit;

  // enregistrer l'emprunt
  dmdb.tabEmprunts.Insert;
  try
    CurDate := now;
    dmdb.tabEmprunts.FieldByName('date_loc').AsDateTime := CurDate;
    dmdb.tabEmprunts.FieldByName('heure_loc').AsDateTime := CurDate;
    dmdb.tabEmprunts.FieldByName('media_id').AsInteger := media_id;
    dmdb.tabEmprunts.FieldByName('personne_id').AsInteger := emprunteur_id;
    dmdb.tabEmprunts.FieldByName('rendu').AsBoolean := false;
    dmdb.tabEmprunts.Post;
  except
    dmdb.tabEmprunts.Cancel;
    ShowMessage('Error : emprunt annulé, resaisissez le.');
  end;
end;

procedure TfrmEmprunts.btnRendreLeMediaClick(Sender: TObject);
begin
  if (dmDB.tabEmprunts.State = dsBrowse) and (not dmDB.tabEmprunts.FieldByName('rendu').AsBoolean) then
  begin
    dmDB.tabEmprunts.Edit;
    dmDB.tabEmprunts.FieldByName('rendu').AsBoolean := true;
    dmDB.tabEmprunts.post;
  end;
end;

procedure TfrmEmprunts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IF Defined(IOS) or Defined(ANDROID)}
  TThread.ForceQueue(nil, procedure
    begin
      Self.Free;
    end);
{$ENDIF}
end;

procedure TfrmEmprunts.FormCreate(Sender: TObject);
begin
  FFilterID := -1;
  ffiltertype := TEmpruntFilterType.none;
  UpdateFilter;
end;

procedure TfrmEmprunts.SetFilterID(const Value: integer);
begin
  FFilterID := Value;
  UpdateFilter;
end;

procedure TfrmEmprunts.SetFilterType(const Value: TEmpruntFilterType);
begin
  FFilterType := Value;
  UpdateFilter;
end;

procedure TfrmEmprunts.UpdateFilter;
begin
  if (FFilterID < 0) or (FFilterType = TEmpruntFilterType.None) then
  begin
    dmDB.tabEmprunts.Filtered := false;
  end
  else if FFilterType = TEmpruntFilterType.Media then
  begin
    dmDB.tabEmprunts.Filter := 'media_id = ' + FFilterID.ToString;
    dmDB.tabEmprunts.Filtered := true;
  end
  else
  begin
    dmDB.tabEmprunts.Filter := 'personne_id = ' + FFilterID.ToString;
    dmDB.tabEmprunts.Filtered := true;
  end;
end;

end.


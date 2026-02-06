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
  File last update : 2025-12-22T20:09:02.233+01:00
  Signature : 9404d8c1dedfc8bd7909ee3a97aaa71bb5578af2
  ***************************************************************************
*)

unit uDB;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.FMXUI.Wait,
  FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util,
  FireDAC.Comp.Script,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TdmDB = class(TDataModule)
    FDConnection1: TFDConnection;
    FDScript1: TFDScript;
    tabMediaType: TFDTable;
    tabEmprunteurs: TFDTable;
    tabMedia: TFDTable;
    tabMediaid: TFDAutoIncField;
    tabMediatitre: TStringField;
    tabMediagencod: TStringField;
    tabMediasupport_type_id: TIntegerField;
    tabMediaMediaTypeLibelle: TStringField;
    tabEmprunts: TFDTable;
    tabEmpruntsid: TFDAutoIncField;
    tabEmpruntsdate_loc: TDateField;
    tabEmpruntsheure_loc: TTimeField;
    tabEmpruntsmedia_id: TIntegerField;
    tabEmpruntspersonne_id: TIntegerField;
    tabEmpruntsrendu: TBooleanField;
    tabEmpruntsemprunteur: TStringField;
    tabEmpruntsmedia: TStringField;
    tabEmpruntsestrendu: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure tabEmpruntsCalcFields(DataSet: TDataSet);
  private
  protected
    FDBExists: boolean;
  public
    function GetDBFilePath: string;
    function GetDBVersionFilePath: string;
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils;

procedure TdmDB.DataModuleCreate(Sender: TObject);
begin
  fdbexists := tfile.exists(getdbfilepath);
  FDConnection1.Open;
end;

procedure TdmDB.FDConnection1AfterConnect(Sender: TObject);
var
  i: integer;
  NumVersion: integer;
begin
{$IF CompilerVersion<35}
  // Before Delphi 13 Florence
  if fdbexists and tfile.Exists(GetDBVersionFilePath) then
    numversion := tfile.ReadAllText(GetDBVersionFilePath).ToInteger
  else
    numversion := -1;
{$ELSE}
  // Since Delphi 13 Florence
  numversion := if (fdbexists and tfile.Exists(GetDBVersionFilePath)) then
    tfile.ReadAllText(GetDBVersionFilePath).ToInteger
  else
    - 1;
{$ENDIF}

  for i := NumVersion + 1 to FDScript1.SQLScripts.Count - 1 do
  begin
    FDScript1.ExecuteScript(FDScript1.SQLScripts[i].SQL);
    tfile.WriteAllText(GetDBVersionFilePath, i.ToString);
  end;

  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TFDTable) and ((Components[i] as TFDTable).Connection = FDConnection1) then
      (Components[i] as TFDTable).Open;
end;

procedure TdmDB.FDConnection1BeforeConnect(Sender: TObject);
begin
  FDConnection1.Params.Values['Database'] := GetDBFilePath;
  if not FDBExists then
  begin
    // create the DB file if needed (not necessary for SQLite)
  end;
end;

function TdmDB.GetDBFilePath: string;
begin
{$IFDEF RELEASE}
{$IFDEF IOS}
  result := tpath.Combine(TPath.GetDocumentsPath, 'SimpleMediatek');
{$ELSE}
  result := tpath.Combine(TPath.GetHomePath, 'SimpleMediatek');
{$ENDIF}
{$ELSE}
  result := tpath.Combine(TPath.GetDocumentsPath, 'SimpleMediatek-DEBUG');
{$ENDIF}
  if not TDirectory.Exists(result) then
    TDirectory.CreateDirectory(result);
{$IFDEF RELEASE}
  result := tpath.Combine(result, 'sm.db');
{$ELSE}
  result := tpath.Combine(result, 'sm-DEBUG.db');
{$ENDIF}
end;

function TdmDB.GetDBVersionFilePath: string;
begin
{$IFDEF RELEASE}
{$IFDEF IOS}
  result := tpath.Combine(TPath.GetDocumentsPath, 'SimpleMediatek');
{$ELSE}
  result := tpath.Combine(TPath.GetHomePath, 'SimpleMediatek');
{$ENDIF}
{$ELSE}
  result := tpath.Combine(TPath.GetDocumentsPath, 'SimpleMediatek-DEBUG');
{$ENDIF}
  if not TDirectory.Exists(result) then
    TDirectory.CreateDirectory(result);
{$IFDEF RELEASE}
  result := tpath.Combine(result, 'sm.dbv');
{$ELSE}
  result := tpath.Combine(result, 'sm-DEBUG.dbv');
{$ENDIF}
end;

procedure TdmDB.tabEmpruntsCalcFields(DataSet: TDataSet);
begin
{$IF CompilerVersion<35}
  if dataset.FieldByName('rendu').AsBoolean then
    dataset.FieldByName('estrendu').asstring := 'Oui'
  else
    dataset.FieldByName('estrendu').asstring := 'Non';
{$ELSE}
  dataset.FieldByName('estrendu').asstring := if dataset.FieldByName('rendu').AsBoolean then
    'Oui'
  else
    'Non';
{$ENDIF}
end;

end.


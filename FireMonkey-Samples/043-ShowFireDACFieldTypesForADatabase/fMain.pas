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
  File last update : 2026-08-08T17:35:56.000+02:00
  Signature : c62ded7cdc12d103ca533bcafafd6cda95d81ce2
  ***************************************************************************
*)

unit fMain;

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
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.FMXUI.Wait,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef,
  System.Rtti,
  FMX.Grid.Style,
  FMX.Memo.Types,
  FireDAC.Phys.SQLite,
  FMX.Memo,
  FMX.Layouts,
  FMX.StdCtrls,
  FMX.Grid,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TfrmMain = class(TForm)
    FDConnection1: TFDConnection;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    Button1: TButton;
    VertScrollBox1: TVertScrollBox;
    Memo1: TMemo;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1Resized(Sender: TObject);
    procedure VertScrollBox1Resized(Sender: TObject);
  private
  protected
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.Button1Click(Sender: TObject);
var
  FDTable: TFDTable;
  Catalogs, Schemas, Tables, FieldTypes: TStringList;
  row, c, s, t, f: integer;
begin
  // Change the ConnectionDefName if you want, we use the "SQLite_Demo" from Embarcadero Samples
  FDConnection1.Open;

  row := 0;
  FieldTypes := TStringList.Create;
  try
    FieldTypes.Sorted := true;
    FieldTypes.Duplicates := TDuplicates.dupIgnore;
    Catalogs := TStringList.Create;
    try
      FDConnection1.GetCatalogNames('', Catalogs);
      Catalogs.Add('');
      for c := 0 to Catalogs.Count - 1 do
      begin
        Schemas := TStringList.Create;
        try
          FDConnection1.GetSchemaNames(Catalogs[c], '', Schemas);
          Schemas.Add('');
          for s := 0 to Schemas.Count - 1 do
          begin
            Tables := TStringList.Create;
            try
              FDConnection1.GetTableNames(Catalogs[c], Schemas[s], '', Tables);
              for t := 0 to Tables.Count - 1 do
              begin
                StringGrid1.RowCount := row + 1;
                StringGrid1.Cells[0, row] := Catalogs[c];
                StringGrid1.Cells[1, row] := Schemas[s];
                StringGrid1.Cells[2, row] := Tables[t];
                row := row + 1;

                FDTable := TFDTable.Create(self);
                try
                  FDTable.Connection := FDConnection1;
                  FDTable.TableName := Tables[t];
                  try
                    FDTable.Open;
                  except
                    on E: Exception do
                      Memo1.Lines.Add('*** "' + Catalogs[c] + '" - "' +
                        Schemas[s] + '" - "' + Tables[t] + '" => ' + E.Message);
                  end;
                  if FDTable.Active then
                    try
                      for f := 0 to FDTable.Fields.Count - 1 do
                        FieldTypes.Add(FDTable.Fields[f].ClassName);
                    finally
                      FDTable.close;
                    end;
                finally
                  FDTable.Free;
                end;
              end;
            finally
              Tables.Free;
            end;
          end;
        finally
          Schemas.Free;
        end;
      end;
    finally
      Catalogs.Free;
    end;
    Memo1.Lines.Add(FieldTypes.Text);
  finally
    FieldTypes.Free;
  end;
end;

procedure TfrmMain.StringGrid1Resized(Sender: TObject);
begin
  StringColumn1.Width := (StringGrid1.Width - 30) / 3;
  StringColumn2.Width := StringColumn1.Width;
  StringColumn3.Width := StringColumn1.Width;
end;

procedure TfrmMain.VertScrollBox1Resized(Sender: TObject);
var
  h: single;
begin
  h := (VertScrollBox1.ClientHeight - Button1.Margins.Top -
    Button1.Margins.Height - Button1.Margins.Bottom) / 2;
  if h < 200 then
    h := 200;
  StringGrid1.Height := h - StringGrid1.Margins.Top -
    StringGrid1.Margins.Bottom;
  Memo1.Height := h - Memo1.Margins.Top - Memo1.Margins.Bottom;
end;

initialization
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
end.


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
  File last update : 2025-10-25T20:59:09.591+02:00
  Signature : 8e4d0353dfb3e52445b40790953213981cd610e3
  ***************************************************************************
*)

unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageXML;

type
  TDataModule2 = class(TDataModule)
    FDMemTable1: TFDMemTable;
    FDMemTable1id: TAutoIncField;
    FDMemTable1libelle: TStringField;
    FDMemTable1coche: TBooleanField;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure valider_modification_en_cours;
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

uses System.ioutils;

const
  FichName = 'Presentation-RADStudio-Delphi.xml';

procedure TDataModule2.DataModuleCreate(Sender: TObject);
var
  nomfichier: string;
begin
  nomfichier := tpath.Combine(tpath.GetDocumentsPath, FichName);
  if tfile.Exists(tpath.Combine(tpath.GetDocumentsPath, FichName)) then
  begin
    FDMemTable1.LoadFromFile(tpath.Combine(tpath.GetDocumentsPath, FichName), tfdstorageformat.sfXML);
    FDMemTable1.Refresh;
  end;
end;

procedure TDataModule2.DataModuleDestroy(Sender: TObject);
begin
  FDMemTable1.SaveToFile(tpath.Combine(tpath.GetDocumentsPath, FichName), tfdstorageformat.sfXML);
end;

procedure TDataModule2.valider_modification_en_cours;
begin
if (FDMemTable1.State in [dsEdit, dsInsert]) then FDMemTable1.Post;
end;

end.

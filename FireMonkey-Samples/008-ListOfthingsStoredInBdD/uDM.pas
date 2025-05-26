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
  File last update : 2025-02-09T11:12:20.881+01:00
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

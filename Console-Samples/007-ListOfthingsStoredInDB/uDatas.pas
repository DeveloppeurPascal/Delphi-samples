unit uDatas;

interface

type
  TElem = record
    id: integer;
    libelle: string[50];
    coche: boolean;
  end;

  TListe = array of TElem;

function ajouter(libelle: string): integer;
procedure modifier(id: integer; libelle: string);
procedure supprimer(id: integer);
procedure cocher(id: integer);
procedure decocher(id: integer);
function estCoché(id: integer): boolean;
function lister: TListe;

implementation

uses system.sysutils, system.ioutils, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

const
  FichName = 'Presentation-RADStudio-Delphi.db';

var
  connection: tfdconnection;
  qry: tfdquery;

function ajouter(libelle: string): integer;
begin
  qry.Insert;
  qry.FieldByName('libelle').AsString := libelle;
  qry.Post;
  qry.Refresh;
end;

procedure modifier(id: integer; libelle: string);
begin
  if qry.Locate('id', id) then
  begin
    qry.Edit;
    qry.FieldByName('libelle').AsString := libelle;
    qry.Post;
  end;
end;

procedure supprimer(id: integer);
begin
  if qry.Locate('id', id) then
    qry.Delete;
end;

procedure cocher(id: integer);
begin
  if qry.Locate('id', id) then
  begin
    qry.Edit;
    qry.FieldByName('coche').AsInteger := 1;
    qry.Post;
  end;
end;

procedure decocher(id: integer);
begin
  if qry.Locate('id', id) then
  begin
    qry.Edit;
    qry.FieldByName('coche').AsInteger := 0;
    qry.Post;
  end;
end;

function estCoché(id: integer): boolean;
begin
  result := qry.Locate('id', id) and (qry.FieldByName('coche').AsInteger = 1);
end;

function lister: TListe;
begin
  setlength(result, 0);
  if (qry.FindFirst) then
    repeat
      setlength(result, length(result) + 1);
      result[length(result) - 1].id := qry.FieldByName('id').AsInteger;
      result[length(result) - 1].libelle := qry.FieldByName('libelle').AsString;
      result[length(result) - 1].coche := qry.FieldByName('coche').AsInteger = 1;
    until not qry.FindNext;
end;

procedure create;
var
  nom_fichier: string;
  database_existante: boolean;
begin
  nom_fichier := tpath.Combine(tpath.GetDocumentsPath, FichName);
  database_existante := tfile.Exists(nom_fichier);
  connection := tfdconnection.create(nil);
  connection.Params.Clear;
  connection.Params.Values['DriverID'] := 'SQLite';
  connection.Params.Values['Database'] := nom_fichier;
{$IFDEF DEBUG}
  connection.Params.Values['Password'] := '';
  connection.Params.Values['Encrypt'] := '';
{$ELSE}
  connection.Params.Values['Password'] := FilePassword;
  connection.Params.Values['Encrypt'] := 'aes-256';
{$ENDIF}
  connection.LoginPrompt := false;
  connection.Connected := true;
  if not database_existante then
  begin
    connection.ExecSQL('CREATE TABLE IF NOT EXISTS liste (' + 'id INTEGER PRIMARY Key, ' + 'libelle VARCHAR(50) DEFAULT "", ' +
      'coche INTEGER DEFAULT 0' + ')');
    connection.ExecSQL('CREATE INDEX IF NOT EXISTS liste_by_id ON liste (id,libelle)');
    connection.ExecSQL('CREATE INDEX IF NOT EXISTS liste_by_libelle ON liste (libelle,id)');
  end;
  qry := tfdquery.create(nil);
  qry.connection := connection;
  qry.Open('select * from liste order by id');
end;

procedure destroy;
begin
  if assigned(qry) then
    freeandnil(qry);
  if assigned(connection) then
    freeandnil(connection);
end;

initialization

create;

finalization

destroy;

end.

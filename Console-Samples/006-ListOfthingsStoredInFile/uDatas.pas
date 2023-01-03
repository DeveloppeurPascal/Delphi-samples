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

uses system.ioutils;

const
  FichName = 'Presentation-RADStudio-Delphi.rcd';

type
  TFichier = file of TElem;

var
  liste: TListe;
  id_max: integer;
  liste_modifiee: boolean;

function ajouter(libelle: string): integer;
var
  num: integer;
begin
  inc(id_max);
  num := length(liste);
  setlength(liste, num + 1);
  liste[num].id := id_max;
  liste[num].libelle := libelle;
  liste[num].coche := false;
  liste_modifiee := true;
end;

procedure modifier(id: integer; libelle: string);
var
  num: integer;
begin
  num := 0;
  while (num < length(liste)) and (liste[num].id <> id) do
    inc(num);
  if (num < length(liste)) then
  begin
    liste[num].libelle := libelle;
    liste_modifiee := true;
  end;
end;

procedure supprimer(id: integer);
var
  num: integer;
begin
  num := 0;
  while (num < length(liste)) and (liste[num].id <> id) do
    inc(num);
  if (num < length(liste)) then
  begin
    while (num < length(liste) - 1) do
    begin
      liste[num] := liste[num + 1];
      inc(num);
    end;
    setlength(liste, length(liste) - 1);
    liste_modifiee := true;
  end;
end;

procedure cocher(id: integer);
var
  num: integer;
begin
  num := 0;
  while (num < length(liste)) and (liste[num].id <> id) do
    inc(num);
  if (num < length(liste)) then
  begin
    liste[num].coche := true;
    liste_modifiee := true;
  end;
end;

procedure decocher(id: integer);
var
  num: integer;
begin
  num := 0;
  while (num < length(liste)) and (liste[num].id <> id) do
    inc(num);
  if (num < length(liste)) then
  begin
    liste[num].coche := false;
    liste_modifiee := true;
  end;
end;

function estCoché(id: integer): boolean;
var
  num: integer;
begin
  num := 0;
  while (num < length(liste)) and (liste[num].id <> id) do
    inc(num);
  result := (num < length(liste)) and liste[num].coche;
end;

function lister: TListe;
begin
  result := liste;
end;

procedure load;
var
  f: TFichier;
  path: string;
begin
  id_max := 0;
  setlength(liste, 0);
  path := tpath.Combine(tpath.GetDocumentsPath, FichName);
  if (tfile.Exists(path)) then
  begin
    assignfile(f, path);
    reset(f);
    while not eof(f) do
    begin
      setlength(liste, length(liste) + 1);
      read(f, liste[length(liste) - 1]);
      if (id_max < liste[length(liste) - 1].id) then
        id_max := liste[length(liste) - 1].id;
    end;
    closefile(f);
  end;
  liste_modifiee := false;
end;

procedure save;
var
  f: TFichier;
  e: TElem;
begin
  assignfile(f, tpath.Combine(tpath.GetDocumentsPath, FichName));
  rewrite(f);
  for e in liste do
    write(f, e);
  closefile(f);
  liste_modifiee := false;
end;

initialization

id_max := 0;
liste_modifiee := false;
setlength(liste, 0);
load;

finalization

if liste_modifiee then
  save;

end.

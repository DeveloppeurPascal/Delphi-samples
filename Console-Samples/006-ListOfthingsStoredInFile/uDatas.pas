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
  File last update : 2025-10-25T20:59:09.470+02:00
  Signature : 82744c1195bbe87905e32ea51345da08ec0f0adc
  ***************************************************************************
*)

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
function estCoche(id: integer): boolean;
function lister: TListe;

implementation

uses
  system.ioutils;

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

function estCoche(id: integer): boolean;
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

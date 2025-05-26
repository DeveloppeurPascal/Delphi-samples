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
  File last update : 2025-02-09T11:12:20.805+01:00
  Signature : 7158af8617acb9fce1ec0867a4aff03309e038f8
  ***************************************************************************
*)

unit uMenu;

interface

procedure doMain;

implementation

uses System.SysUtils, uDatas;

procedure doMain;
var
  e: telem;
  l: tliste;
  sortie: boolean;
  keyok: boolean;
  ch: string;
  c: char;
  num: integer;
begin
  sortie := false;
  repeat
    l := lister;
    if (length(l) > 0) then
    begin
      writeln('');
      writeln('****************************************');
      writeln('');
      for e in l do
      begin
        write(e.id.tostring + ' ');
        if (e.coche) then
          write('X ')
        else
          write('- ');
        writeln(e.libelle);
      end;
      writeln('');
      writeln('****************************************');
      writeln('');
      writeln('(A)jouter - (M)odifier - (S)upprimer - (C)ocher - (D)écocher - (Q)uitter');
    end
    else
      writeln('(A)jouter - (Q)uitter');
    repeat
      readln(c);
      keyok := sametext(c, 'A') or sametext(c, 'M') or sametext(c, 'S') or
        sametext(c, 'C') or sametext(c, 'D') or sametext(c, 'Q');
    until keyok;
    if sametext(c, 'A') then
    begin
      writeln('Libellé à ajouter ?');
      readln(ch);
      if (ch.Trim.length > 0) then
        ajouter(ch.Trim);
    end
    else if sametext(c, 'M') or sametext(c, 'S') or sametext(c, 'C') or
      sametext(c, 'D') then
    begin
      writeln('Quelle ligne ?');
      repeat
        readln(ch);
        try
          num := strtoint(ch);
        except
          num := -1;
        end;
      until (num >= 0);
      if sametext(c, 'M') then
      begin
        writeln('Nouveau libellé ?');
        readln(ch);
        if (ch.Trim.length > 0) then
          modifier(num, ch.Trim);
      end
      else if sametext(c, 'S') then
        supprimer(num)
      else if sametext(c, 'C') then
        cocher(num)
      else if sametext(c, 'D') then
        decocher(num);
    end
    else
      sortie := sametext(c, 'q');
  until sortie;
end;

end.

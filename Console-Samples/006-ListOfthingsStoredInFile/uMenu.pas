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

program TListSortSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Generics.Defaults,
  System.Generics.Collections;

procedure GenericTListSort;
var
  i: Integer;
  liste: tlist<Integer>;
begin
  randomize;

  liste := tlist<Integer>.create;
  try
    for i := 1 to 10 do
    begin
      liste.Add(random(1000));
    end;

    liste.Sort(TComparer<Integer>.Construct(
      function(const a, b: Integer): Integer
      begin
        if a = b then
          result := 0
        else if a > b then
          result := 1
        else
          result := -1;
      end));

    for i in liste do
    begin
      writeln(i.ToString);
    end;
  finally
    freeandnil(liste);
  end;
end;

begin
  try
    GenericTListSort;
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  writeln;
  writeln('Ctrl+C to close this program.');
  readln;

end.

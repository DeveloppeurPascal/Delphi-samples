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
  File last update : 2025-02-09T11:12:22.000+01:00
  Signature : c51e28307d9b29ff2ef3dbaa472d2b62fd615593
  ***************************************************************************
*)

program Recursivity;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

function calculer(nb1, nb2: integer): integer;
begin
  if (nb1 > 0) then
    Result := calculer(nb1 - 1, nb2)
  else
    Result := nb1;
end;

var
  nb1, nb2: integer;
  ch: string;

begin
  try
    repeat
      writeln('Nombre 1 ?');
      readln(ch);
      try
        nb1 := strtoint(ch);
      except
        writeln('Veuillez saisir une valeur numérique entière.');
        nb1 := 0;
      end;
    until (nb1 > 0);
    repeat
      writeln('Nombre 2 ?');
      readln(ch);
      try
        nb2 := strtoint(ch);
      except
        writeln('Veuillez saisir une valeur numérique entière.');
        nb2 := 0;
      end;
    until (nb2 > 0);
    writeln('Résultat : ', IntToStr(calculer(nb1, nb2)));
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  writeln('Ctrl+C to exit');
  while (true) do;

end.

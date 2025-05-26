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
  Signature : a6d5e5273ca23c0eb9fc67e04172a1ecf5310bd0
  ***************************************************************************
*)

program ForLoopSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, System.math;

function calculer(nb1, nb2: integer): integer;
var
  i: integer;
begin
  if (nb1 > 0) then
    Result := calculer(nb1 - 1, nb2)
  else
  begin
    Result := 0;
    for i := 0 to nb2 do
      inc(Result);
  end;
end;

function GetNombre(n: integer): integer;
var
  nb: integer;
  ch: string;
begin
  repeat
    writeln('Nombre ' + n.ToString + ' ?');
    readln(ch);
    try
      nb := strtoint(ch);
    except
      writeln('Veuillez saisir une valeur numérique entière.');
      nb := 0;
    end;
  until (nb > 0);
  exit(nb);
end;

var
  nb1, nb2: integer;
  ch: string;

begin
  try
    nb1 := GetNombre(1);
    nb2 := GetNombre(2);
    writeln('Résultat : ', cos(Power(2, calculer(nb1, nb2))));
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  writeln('Ctrl+C to exit');
  while (true) do;

end.

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
  File last update : 2025-06-07T11:25:10.000+02:00
  Signature : 4a255b3641faa2a0f4eff58b5c9ff9cb549b73d5
  ***************************************************************************
*)

program GotoSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

label
  Bloc1, Bloc2;

begin
  try

  Bloc1:
    // fait des trucs
    if random(10) < 5 then
      goto Bloc1
    else
      goto Bloc2;

  Bloc2:
    // fait des trucs  à la suite de l'autre
    goto Bloc1;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.

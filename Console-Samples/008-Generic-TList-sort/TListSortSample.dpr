/// <summary>
/// ***************************************************************************
///
/// Delphi sample projects
///
/// Copyright 2023-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Set of projects demonstrating the features of the Delphi development
/// environment, its libraries and its programming language.
///
/// Some of the projects have been presented at conferences, on training
/// courses or online coding sessions.
///
/// The programs are up to date with the Community Edition and the commercial
/// version of Delphi or RAD Studio.
///
/// ***************************************************************************
///
/// Author(s) :
///      Patrick PREMARTIN
///
/// Site :
///      https://samples.developpeur-pascal.fr
///
/// Project site :
///      https://github.com/DeveloppeurPascal/Delphi-samples
///
/// ***************************************************************************
/// File last update : 04/08/2024 09:03:36
/// Signature : 145266d58d0bb4171f3029e1b28b32a22b212ea6
/// ***************************************************************************
/// </summary>

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

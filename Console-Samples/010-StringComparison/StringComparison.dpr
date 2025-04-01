/// <summary>
/// ***************************************************************************
///
/// Delphi Sample Projects
///
/// Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.
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
/// Patrick PREMARTIN
///
/// Site :
/// https://samples.developpeur-pascal.fr
///
/// Project site :
/// https://github.com/DeveloppeurPascal/Delphi-samples
///
/// ***************************************************************************
/// File last update : 2025-04-01T11:42:32.293+02:00
/// Signature : ff595a60024b749de0b1dd1e2a918d034b8c7834
/// ***************************************************************************
/// </summary>

program StringComparison;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

var
  s1, s1L, s1U, s2, s2L, s2U: string;

begin
  try
    s1 := 'IciOuPas';
    s1L := s1.ToLower;
    s1U := s1.ToUpper;
    s2 := 'icioupas';
    s2L := s2.ToLower;
    s2U := s2.ToUpper;

    writeln('s1');
    writeln(s1);
    writeln(s1L);
    writeln(s1U);

    writeln('s2');
    writeln(s2);
    writeln(s2L);
    writeln(s2U);

    writeln('s1 = s2');
    writeln(s1 = s2);
    writeln(s1L = s2L);
    writeln(s1U = s2U);

    writeln('CompareStr');
    writeln(comparestr(s1, s2));
    writeln(comparestr(s1L, s2L));
    writeln(comparestr(s1U, s2U));

    writeln('CompareText');
    writeln(comparetext(s1, s2));
    writeln(comparetext(s1L, s2L));
    writeln(comparetext(s1U, s2U));

    readln;
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;

end.

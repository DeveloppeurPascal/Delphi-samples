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
  File last update : 2025-03-16T18:37:53.337+01:00
  Signature : a4acbf52fbe4270c1a3a9400e7b1324557a9a30f
  ***************************************************************************
*)

program TypeInferenceOnADecimalValueSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  TExtendedHelper = record helper for
    Extended
    function GetType: string;
  end;

  TCurrencyHelper = record helper for Currency
    function GetType: string;
  end;

  TIntegerHelper = record helper for
    Integer
    function GetType: string;
  end;

  TInt64Helper = record helper for Int64
    function GetType: string;
  end;

  { TExtendedHelper }

function TExtendedHelper.GetType: string;
begin
  writeln('Extended');
end;

{ TCurrencyHelper }

function TCurrencyHelper.GetType: string;
begin
  writeln('Currency');
end;

{ TIntegerHelper }

function TIntegerHelper.GetType: string;
begin
  writeln('Integer');
end;

{ TInt64Helper }

function TInt64Helper.GetType: string;
begin
  writeln('Int64');
end;

begin
  try
    var
    Nb := 12.5;
    writeln(Nb.GetType);
    var
      Cur: Currency := 12.5;
    writeln(Cur.GetType);
    var
      Ext: Extended := 12.5;
    writeln(Ext.GetType);
    var
    Nb2 := 12;
    writeln(Nb2.GetType);
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  readln;

end.

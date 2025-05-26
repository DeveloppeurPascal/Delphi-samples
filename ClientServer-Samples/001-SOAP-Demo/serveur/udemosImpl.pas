(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Pr�martin under AGPL 3.0 license.

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
  File last update : 2025-02-09T11:12:20.772+01:00
  Signature : c45256c1cf22257db7a2697602df4a2e78404cde
  ***************************************************************************
*)

{ Fichier d'impl�mentation invocable pour Tdemos impl�mentant Idemos }

unit udemosImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, udemosIntf;

type

  { Tdemos }
  Tdemos = class(TInvokableClass, Idemos)
  public
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
  end;

implementation

function Tdemos.echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
begin
  {TODO : Impl�menter la m�thode echoEnum }
  Result := Value;
end;

function Tdemos.echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
begin
  {TODO : Impl�menter la m�thode echoDoubleArray }
  Result := Value;
end;

function Tdemos.echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
begin
  {TODO : Impl�menter la m�thode echoMyEmployee }
  Result := Value;
end;

function Tdemos.echoDouble(const Value: Double): Double; stdcall;
begin
  {TODO : Impl�menter la m�thode echoDouble }
  Result := Value;
end;


initialization
{ Les classes invocables doivent �tre enregistr�es }
   InvRegistry.RegisterInvokableClass(Tdemos);
end.


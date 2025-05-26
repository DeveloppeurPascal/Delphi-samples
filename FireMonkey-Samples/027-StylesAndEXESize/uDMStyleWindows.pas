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
  File last update : 2025-04-08T09:47:10.585+02:00
  Signature : 047b40ff2761f652f7a66fae185f96d6ce4a0dce
  ***************************************************************************
*)

unit uDMStyleWindows;

interface

{$IFDEF MSWINDOWS}

uses
  System.SysUtils,
  System.Classes,
  FMX.Types,
  FMX.Controls;

type
  TdmStyleWindows = class(TDataModule)
    StyleBook1: TStyleBook;
  private
  public
  end;

var
  GStyleWindows: TdmStyleWindows;
{$ENDIF}

implementation

{$IFDEF MSWINDOWS}
{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}
{$ENDIF}

initialization

{$IFDEF MSWINDOWS}
  GStyleWindows := nil;
{$ENDIF}

finalization

{$IFDEF MSWINDOWS}
  GStyleWindows.Free;
{$ENDIF}

end.

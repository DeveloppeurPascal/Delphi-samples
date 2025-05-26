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
  File last update : 2025-04-08T09:47:10.581+02:00
  Signature : f739bbc3b0453a9572d2c4a829c073d754bfed10
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    btnUseTheStyleBook: TButton;
    procedure btnUseTheStyleBookClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  FMX.Styles
{$IF Defined(ANDROID)}
    ,
  uDMStyleAndroid
{$ELSEIF Defined(MSWINDOWS)}
    ,
  uDMStyleWindows
{$ELSE}
{$MESSAGE WARN 'No style available for this platform.'}
{$ENDIF}
    ;

procedure TfrmMain.btnUseTheStyleBookClick(Sender: TObject);
Var
  StyleBook: TStyleBook;
begin
{$IF Defined(ANDROID)}
  if not assigned(GStyleAndroid) then
    GStyleAndroid := TdmStyleAndroid.Create(nil);
  StyleBook := GStyleAndroid.StyleBook1;
{$ELSEIF Defined(MSWINDOWS)}
  if not assigned(GStyleWindows) then
    GStyleWindows := TdmStyleWindows.Create(nil);
  StyleBook := GStyleWindows.StyleBook1;
{$ELSE}
  StyleBook := nil;
{$ENDIF}
  if assigned(StyleBook) then
  begin
    // Do what you want with your style book
  end;
end;

end.

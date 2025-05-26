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
  File last update : 2025-02-09T11:12:20.776+01:00
  Signature : c6356e6bbdb5396d0be60e6d2d9454c90967cfc7
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
  FMX.StdCtrls;

type
  TfrmMain = class(TForm)
    ImageControl1: TImageControl;
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }

    procedure GetBitmapStream(ABitmapStream: TStream);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  uDMAppTetheringReceiver;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  dmAppTetheringReceiver.onReceiveBitmapStream := GetBitmapStream;
end;

procedure TfrmMain.GetBitmapStream(ABitmapStream: TStream);
begin
  if assigned(ABitmapStream) and (ABitmapStream.Size > 0) then
  begin
    ABitmapStream.Position := 0;
    ImageControl1.Bitmap.LoadFromStream(ABitmapStream);
  end;
end;

end.

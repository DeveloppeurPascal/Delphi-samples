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
  File last update : 2025-02-09T11:12:20.876+01:00
  Signature : 9034b014e73a7c9cebab380483ebd39fbcd71397
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Ani, FMX.ExtCtrls,
  FMX.Filter.Effects, FMX.Effects;

type
  TForm1 = class(TForm)
    FlowLayout1: TFlowLayout;
    Layout1: TLayout;
    Button1: TButton;
    VertScrollBox1: TVertScrollBox;
    ImageViewer1: TImageViewer;
    BitmapListAnimation1: TBitmapListAnimation;
    ReflectionEffect1: TReflectionEffect;
    BandsEffect1: TBandsEffect;
    TilerEffect1: TTilerEffect;
    procedure Button1Click(Sender: TObject);
  private
    FButtonNumber: integer;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  inc(FButtonNumber);
  with (Button1.Clone(Self) as TButton) do
  begin
    Text := FButtonNumber.ToString;
    parent := FlowLayout1;
    onclick := Button1.onclick;
    AnimateFloat('RotationAngle',FButtonNumber*10 mod 360,5);
  end;
end;

end.

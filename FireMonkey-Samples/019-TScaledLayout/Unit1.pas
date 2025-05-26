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
  File last update : 2025-02-09T11:12:20.922+01:00
  Signature : ee258021afc16733383d7aadef58aaeea662970e
  ***************************************************************************
*)

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Layouts;

type
  TForm1 = class(TForm)
    ScaledLayout1: TScaledLayout;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    procedure TrackBar1Tracking(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar2Tracking(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    w, h: single;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  w := ScaledLayout1.OriginalWidth;
  h := ScaledLayout1.OriginalHeight;
end;

procedure TForm1.TrackBar1Tracking(Sender: TObject);
begin
  ScaledLayout1.OriginalWidth := w * TrackBar1.value / 50;
  ScaledLayout1.OriginalHeight := h * TrackBar1.value / 50;
  ScaledLayout1.Repaint;
end;

procedure TForm1.TrackBar2Tracking(Sender: TObject);
begin
  ScaledLayout1.Width := w * TrackBar2.value / 50;
  ScaledLayout1.Height := h * TrackBar2.value / 50;
end;

end.

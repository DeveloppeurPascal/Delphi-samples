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
  File last update : 2025-06-09T10:30:28.000+02:00
  Signature : 3b532068e475ee09e05a09a5377104496ac2c734
  ***************************************************************************
*)

unit Unit1;

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
  FMX.Objects,
  FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TLockAndExecuteCallbackProc = TProc<TProc>;

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    procedure LockAndExecute(const AControl: TControl;
      const AProc: TLockAndExecuteCallbackProc);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.Net.HttpClient,
  System.Net.URLClient;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.Enabled := false;
  LockAndExecute(Image1,
    procedure(ACallback: TProc)
    var
      URL: string;
    begin
      try
        case random(10) of
          0:
            URL := 'https://www.dropbox.com/scl/fi/jhgmonmxpnu1z4eroc2q0/AdobeStock_4094465-800x800.jpeg?rlkey=0xikyy8stqiz0yrzu1vjs0jgc&dl=1';
          1:
            URL := 'https://www.dropbox.com/scl/fi/62oy6n56uqurit5jl3juk/AdobeStock_26084381-800x800.jpeg?rlkey=wac9pnkzj3w7uzd52br9w797q&dl=1';
          2:
            URL := 'https://www.dropbox.com/scl/fi/hoe6phi7fqqxd8cfi14fj/AdobeStock_15289151-800x800.jpeg?rlkey=yoh309f5pzd00lm8eddo4j8xt&dl=1';
          3:
            URL := 'https://www.dropbox.com/scl/fi/9nci6szh2jw1lwjkznu25/AdobeStock_46557572-800x800.jpeg?rlkey=wu7cp4iio5i8rtdinq80p0xk1&dl=1';
          4:
            URL := 'https://www.dropbox.com/scl/fi/7q0kjjn9pzkgn9ubl8vn5/AdobeStock_52456006-800x800.jpeg?rlkey=hfxcg0jtxy5yv52ga87mhn8w1&dl=1';
          5:
            URL := 'https://www.dropbox.com/scl/fi/burc5fwu1wmlsz4iv7rcr/AdobeStock_66837173-800x800.jpeg?rlkey=p2o3jdivsc206ugm8ylmixz11&dl=1';
          6:
            URL := 'https://www.dropbox.com/scl/fi/4g5unr79b7wvh3nqur4jj/AdobeStock_119508003-800x800.jpeg?rlkey=t6ojfovd34yyws48nv4c6ybg2&dl=1';
          7:
            URL := 'https://www.dropbox.com/scl/fi/elk2f0o0wq2sl95dpuxz2/AdobeStock_168498904-800x800.jpeg?rlkey=qjpf08lqgwyk6nw3mnst67p1z&dl=1';
          8:
            URL := 'https://www.dropbox.com/scl/fi/n59swjx1ejbegxl9l3c2b/Fotolia_47708299_XL-800x800.jpg?rlkey=hv5r86vniuzu5tr2uljf0tuw1&dl=1';
          9:
            URL := 'https://www.dropbox.com/scl/fi/nh8thmlg66n5ssbqcyx24/AdobeStock_129250603-800x800.jpeg?rlkey=5vhvoc9iqoigo0kfl71zgdzib&dl=1';
        else
          raise exception.create
            ('Cas non traité. Cette erreur ne doit jamais se produire.');
        end;

        turlstream.create(URL,
          procedure(AStream: TStream)
          begin
            try
              Image1.bitmap.LoadFromStream(AStream);
            finally
              Button1.Enabled := true;
              if assigned(ACallback) then
                ACallback;
            end;
          end);
      except
        Button1.Enabled := true;
      end;
    end);
end;

procedure TForm1.LockAndExecute(const AControl: TControl;
const AProc: TLockAndExecuteCallbackProc);
var
  ani: TAniIndicator;
  rect: TRectangle;
begin
  if not assigned(AProc) then
    exit;

  rect := TRectangle.create(self);
  try
    if assigned(AControl) then
      rect.parent := AControl
    else
      rect.parent := self;
    rect.Align := talignlayout.Contents;
    rect.Opacity := 0.3;
    rect.fill.Kind := tbrushkind.Solid;
    rect.fill.Color := talphacolors.Orangered;
    rect.HitTest := true;

    ani := TAniIndicator.create(self);
    try
      if assigned(AControl) then
        ani.parent := AControl
      else
        ani.parent := self;
      ani.Align := talignlayout.Contents;
      ani.Visible := true;
      ani.Enabled := true;

      AProc(
        procedure
        begin
          ani.free;
          rect.free;
        end);

    except
      ani.free;
    end;
  except
    rect.free;
  end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}
randomize;

end.

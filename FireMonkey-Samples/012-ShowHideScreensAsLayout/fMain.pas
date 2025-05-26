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
  File last update : 2025-02-09T11:12:20.913+01:00
  Signature : b63a20f385706c500b1fcc01d5d193549f04aef6
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Ani, FMX.StdCtrls, FMX.Controls.Presentation;

type
{$SCOPEDENUMS ON}
  TGameScreen = (Home, Credit, Options, Game);

  TfrmMain = class(TForm)
    ScreenHome: TLayout;
    ScreenGame: TLayout;
    ScreenCredit: TLayout;
    ScreenSettings: TLayout;
    Background: TLayout;
    Rectangle1: TRectangle;
    animHideScreen: TFloatAnimation;
    animShowScreen: TFloatAnimation;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Rectangle2: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure animHideScreenFinish(Sender: TObject);
    procedure animShowScreenFinish(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
    DisplayedScreen: TLayout;
  public
    { Déclarations publiques }
    procedure DisplayScreen(ScreenToDisplay: TGameScreen);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.animHideScreenFinish(Sender: TObject);
begin
  animHideScreen.enabled := false;
  Assert(animHideScreen.Parent is TLayout, animHideScreen.Parent.Name +
    ' is not a TLayout.');
  (animHideScreen.Parent as TLayout).Visible := false;
end;

procedure TfrmMain.animShowScreenFinish(Sender: TObject);
begin
  animShowScreen.enabled := false;
  Assert(animShowScreen.Parent is TLayout, animShowScreen.Parent.Name +
    ' is not a TLayout.');
  (animShowScreen.Parent as TLayout).Visible := true;
  (animShowScreen.Parent as TLayout).enabled := true;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  DisplayScreen(TGameScreen.Home);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  DisplayScreen(TGameScreen.Game);
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  DisplayScreen(TGameScreen.Options);
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  DisplayScreen(TGameScreen.Credit);
end;

procedure TfrmMain.DisplayScreen(ScreenToDisplay: TGameScreen);
var
  NewScreen: TLayout;
begin
  // Show the background if it's not shown
  if not Background.Visible then
  begin
    Background.Visible := true;
    Background.bringtofront;
  end;

  case ScreenToDisplay of
    TGameScreen.Home:
      NewScreen := ScreenHome;
    TGameScreen.Credit:
      NewScreen := ScreenCredit;
    TGameScreen.Options:
      NewScreen := ScreenSettings;
    TGameScreen.Game:
      NewScreen := ScreenGame;
  else
    raise exception.Create('Unknow Screen to display.');
  end;

  // Hide actual diplayed screen
  if assigned(DisplayedScreen) and (DisplayedScreen <> NewScreen) then
  begin
    if animHideScreen.enabled then
      raise exception.Create('An other screen is already hiding.');
    DisplayedScreen.enabled := false;
    animHideScreen.Parent := DisplayedScreen;
    animHideScreen.enabled := true;
  end;

  // Show new screen
  NewScreen.Opacity := 1;
  NewScreen.Visible := true;
  NewScreen.enabled := false;
  NewScreen.bringtofront;
  if animShowScreen.enabled then
    raise exception.Create('An other screen is already showing.');
  animShowScreen.Parent := NewScreen;
  animShowScreen.enabled := true;
  DisplayedScreen := NewScreen;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // Hide all screens
  for var i := 0 to ChildrenCount - 1 do
    if (children[i] is TLayout) then
      (children[i] as TLayout).Visible := false;

  DisplayedScreen := nil;

  // Defer Home screen display
  tthread.ForceQueue(nil,
    procedure
    begin
      DisplayScreen(TGameScreen.Home);
    end);
end;

end.

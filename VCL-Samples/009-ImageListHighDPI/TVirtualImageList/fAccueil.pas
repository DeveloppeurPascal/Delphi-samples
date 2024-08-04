/// <summary>
/// ***************************************************************************
///
/// Delphi sample projects
///
/// Copyright 2023-2024 Patrick Prémartin under AGPL 3.0 license.
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
///      Patrick PREMARTIN
///
/// Site :
///      https://samples.developpeur-pascal.fr
///
/// Project site :
///      https://github.com/DeveloppeurPascal/Delphi-samples
///
/// ***************************************************************************
/// File last update : 04/08/2024 09:03:36
/// Signature : 5dfec282f95f6b3adf5c327c5319db07f8c0e1b4
/// ***************************************************************************
/// </summary>

unit fAccueil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Menus,
  System.Actions, Vcl.ActnList, uDMImages, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList;

type
  TfrmAccueil = class(TForm)
    ActionList1: TActionList;
    actQuitter: TAction;
    actButton: TAction;
    actBitBtn: TAction;
    actSpeedButton: TAction;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    Quitter1: TMenuItem;
    Actions1: TMenuItem;
    Bouton1: TMenuItem;
    BitBtn2: TMenuItem;
    SpeedButton2: TMenuItem;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    VirtualImageList1: TVirtualImageList;
    procedure actQuitterExecute(Sender: TObject);
    procedure actButtonExecute(Sender: TObject);
    procedure actSpeedButtonExecute(Sender: TObject);
    procedure actBitBtnExecute(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  frmAccueil: TfrmAccueil;

implementation

{$R *.dfm}

procedure TfrmAccueil.actBitBtnExecute(Sender: TObject);
begin
  //
end;

procedure TfrmAccueil.actButtonExecute(Sender: TObject);
begin
  //
end;

procedure TfrmAccueil.actQuitterExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmAccueil.actSpeedButtonExecute(Sender: TObject);
begin
  //
end;

end.

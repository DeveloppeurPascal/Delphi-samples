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
/// Signature : a7735e1fe59726c661c88a357383401987483753
/// ***************************************************************************
/// </summary>

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, CLPacket, Mitov.Types, CLBasicComponent, CLComPort, FMX.Objects, Radiant.Shapes,
  SLCommonFilter, SLGenericRealValue, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, SLCommonGen, SLGenericRealValueGen, LPComponent,
  SLBasicGenericFilter, SLGenericFilter, SLStructure;

type
  TForm1 = class(TForm)
    CLComPort1: TCLComPort;
    CLUnpacket1: TCLUnpacket;
    stick: TRadiantCircle;
    SLGenericRealValue1: TSLGenericRealValue;
    SLGenericRealValue2: TSLGenericRealValue;
    procedure SLGenericRealValue1ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
    procedure SLGenericRealValue2ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SLGenericRealValueGen1Generate(Sender: TObject; var OutValue: Real; var Populated, Finished: Boolean);
  private
    { Déclarations privées }
    procedure bouton(appuye: Boolean);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.bouton(appuye: Boolean);
begin
  if appuye then
    stick.Fill.Color := talphacolors.lightgreen
  else
    stick.Fill.Color := talphacolors.Red;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  stick.Position.x := (width - stick.width) * 0.5;
  stick.Position.y := (height - stick.height) * 0.5;
  bouton(false);
end;

procedure TForm1.SLGenericRealValue1ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
begin
  stick.Position.x := width * InValue - stick.width / 2;
end;

procedure TForm1.SLGenericRealValue2ProcessData(Sender: TObject; InValue: Real; var OutValue: Real; var SendOutputData: Boolean);
begin
  stick.Position.y := height * InValue - stick.height / 2;
end;

procedure TForm1.SLGenericRealValueGen1Generate(Sender: TObject; var OutValue: Real; var Populated, Finished: Boolean);
begin
  bouton(Populated);
end;

end.

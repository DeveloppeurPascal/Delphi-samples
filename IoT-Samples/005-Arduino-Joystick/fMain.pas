(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-10-25T20:59:09.749+02:00
  Signature : 1d261c172302bef082c520acb83cfbcb28b6582f
  ***************************************************************************
*)

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

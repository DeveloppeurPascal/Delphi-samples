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

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

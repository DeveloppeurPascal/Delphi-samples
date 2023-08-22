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

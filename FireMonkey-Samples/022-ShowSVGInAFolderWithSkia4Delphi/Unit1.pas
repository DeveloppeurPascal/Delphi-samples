unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ListBox;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    ListBox1: TListBox;
    Layout1: TLayout;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Change(Sender: TObject);
  private
    { Déclarations privées }
    procedure ShowPicture(Const FileName: string);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.Skia,
  FMX.Skia,
  System.IOUtils;

procedure TForm1.Button1Click(Sender: TObject);
var
  files: TStringDynArray;
  i: integer;
  folder: string;
begin
  if SelectDirectory('SVG directory ?', '', folder) and tdirectory.Exists(folder)
  then
  begin
    files := tdirectory.GetFiles(folder);
    ListBox1.BeginUpdate;
    try
      ListBox1.Clear;
      for i := 0 to length(files) - 1 do
        if files[i].ToLower.EndsWith('.svg') then
          ListBox1.Items.Add(files[i]);
    finally
      ListBox1.EndUpdate;
    end;
  end;
end;

procedure TForm1.ListBox1Change(Sender: TObject);
begin
  if assigned(ListBox1.Selected) then
    ShowPicture(ListBox1.Selected.Text);
end;

procedure TForm1.ShowPicture(const FileName: string);
begin
  if Image1.Bitmap.IsEmpty then
    Image1.Bitmap.SetSize(trunc(Image1.Width), trunc(Image1.Height));

  Image1.Bitmap.SkiaDraw(
    procedure(const ACanvas: ISKCanvas)
    var
      LSvgBrush: TSkSvgBrush;
    begin
      LSvgBrush := TSkSvgBrush.Create;
      try
        LSvgBrush.Source := TFile.ReadAllText(FileName);
        LSvgBrush.Render(ACanvas, RectF(0, 0, Image1.Bitmap.Width,
          Image1.Bitmap.Height), 1);
      finally
        LSvgBrush.Free;
      end;
    end);
end;

end.

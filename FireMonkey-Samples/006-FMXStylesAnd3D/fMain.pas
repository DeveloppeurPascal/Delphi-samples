unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, System.ImageList, FMX.ImgList,
  FMX.TabControl, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, System.Math.Vectors, FMX.MaterialSources, FMX.Controls3D,
  FMX.Objects3D, FMX.Viewport3D, FMX.TreeView, FMX.ListView, FMX.Edit;

type
  TForm1 = class(TForm)
    StyleBook1: TStyleBook;
    StyleBook2: TStyleBook;
    StyleBook3: TStyleBook;
    StyleBook4: TStyleBook;
    GridPanelLayout1: TGridPanelLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ListView1: TListView;
    TreeView1: TTreeView;
    TreeViewItem1: TTreeViewItem;
    TreeViewItem2: TTreeViewItem;
    TreeViewItem3: TTreeViewItem;
    TreeViewItem4: TTreeViewItem;
    TreeViewItem5: TTreeViewItem;
    TreeViewItem6: TTreeViewItem;
    TreeViewItem7: TTreeViewItem;
    TreeViewItem8: TTreeViewItem;
    TreeViewItem9: TTreeViewItem;
    TreeViewItem10: TTreeViewItem;
    TreeViewItem11: TTreeViewItem;
    TreeViewItem12: TTreeViewItem;
    TreeViewItem13: TTreeViewItem;
    TreeViewItem14: TTreeViewItem;
    TreeViewItem15: TTreeViewItem;
    TreeViewItem16: TTreeViewItem;
    TreeViewItem17: TTreeViewItem;
    TreeViewItem18: TTreeViewItem;
    TreeViewItem19: TTreeViewItem;
    TreeViewItem20: TTreeViewItem;
    TreeViewItem21: TTreeViewItem;
    TreeViewItem22: TTreeViewItem;
    TreeViewItem23: TTreeViewItem;
    TreeViewItem24: TTreeViewItem;
    TreeViewItem25: TTreeViewItem;
    TreeViewItem26: TTreeViewItem;
    TreeViewItem27: TTreeViewItem;
    Viewport3D1: TViewport3D;
    Sphere1: TSphere;
    TextureMaterialSource1: TTextureMaterialSource;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  StyleBook := StyleBook1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  StyleBook := StyleBook2;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  StyleBook := StyleBook3;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  StyleBook := StyleBook4;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
  e: tlistviewitem;
begin
  TabControl1.ActiveTab := TabItem1;
  for i := 0 to 50 do
  begin
    e := ListView1.items.Add;
    case random(10) of
      0:
        e.Purpose := TListItemPurpose.Header;
      1:
        e.Purpose := TListItemPurpose.Footer;
    end;
    e.Text := 'ligne ' + i.ToString;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Sphere1.RotationAngle.X := Sphere1.RotationAngle.X + random(50) / 5;
  while (Sphere1.RotationAngle.X > 359) do
    Sphere1.RotationAngle.X := Sphere1.RotationAngle.X - 360;
  Sphere1.RotationAngle.y := Sphere1.RotationAngle.y + random(50) / 5;
  while (Sphere1.RotationAngle.y > 359) do
    Sphere1.RotationAngle.y := Sphere1.RotationAngle.y - 360;
  Sphere1.RotationAngle.z := Sphere1.RotationAngle.z + random(50) / 5;
  while (Sphere1.RotationAngle.z > 359) do
    Sphere1.RotationAngle.z := Sphere1.RotationAngle.z - 360;
end;

end.

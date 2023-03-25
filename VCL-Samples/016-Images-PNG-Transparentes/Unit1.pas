unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.VirtualImageList,
  Vcl.VirtualImage, Vcl.BaseImageCollection, Vcl.ImageCollection, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    Button1: TButton;
    ImageCollection1: TImageCollection;
    VirtualImage1: TVirtualImage;
    Button2: TButton;
    VirtualImageList1: TVirtualImageList;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.

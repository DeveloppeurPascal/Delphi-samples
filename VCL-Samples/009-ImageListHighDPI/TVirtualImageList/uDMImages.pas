unit uDMImages;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdmImages = class(TDataModule)
    ImageCollection1: TImageCollection;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  dmImages: TdmImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

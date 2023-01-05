unit PageWeb1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.REST, Vcl.Controls, Vcl.Grids,
  WEBLib.DBCtrls, Data.DB, WEBLib.DB, WEBLib.CDS, WEBLib.ExtCtrls;

type
  TForm1 = class(TWebForm)
    WebClientConnection1: TWebClientConnection;
    WebClientDataSet1: TWebClientDataSet;
    WebDataSource1: TWebDataSource;
    WebDBGrid1: TWebDBGrid;
    WebImageControl1: TWebImageControl;
    procedure WebDataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WebDataSource1DataChange(Sender: TObject; Field: TField);
begin
  WebImageControl1.URL := WebClientDataSet1.FieldByName('thumb').AsString;
end;

end.

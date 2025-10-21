(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

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
  https://github.com/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-02-09T11:12:20.805+01:00
  Signature : f8ec4f234e3e3307099da8f61caad0ae893994a6
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti, FMX.Grid.Style, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.CDataRSS, FireDAC.Phys.CDataRSSDef,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.Bind.Grid,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Layouts, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, FMX.Objects, FMX.StdCtrls, FMX.WebBrowser, FMX.Edit;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    FDConnection1: TFDConnection;
    FDPhysCDataRSSDriverLink1: TFDPhysCDataRSSDriverLink;
    FDQuery1: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    Layout1: TLayout;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    WebBrowser1: TWebBrowser;
    Button4: TButton;
    Splitter1: TSplitter;
    Edit1: TEdit;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    LinkPropertyToFieldURL: TLinkPropertyToField;
    FDQuery1Guid: TWideStringField;
    FDQuery1Link: TWideStringField;
    FDQuery1PubDate: TSQLTimeStampField;
    FDQuery1Title: TWideStringField;
    FDQuery1FeedDescription: TWideStringField;
    FDQuery1FeedImageLink: TWideStringField;
    FDQuery1FeedImageTitle: TWideStringField;
    FDQuery1FeedImageUrl: TWideStringField;
    FDQuery1FeedLanguage: TWideStringField;
    FDQuery1FeedLastBuildDate: TSQLTimeStampField;
    FDQuery1FeedLink: TWideStringField;
    FDQuery1FeedLinkHref: TWideStringField;
    FDQuery1FeedLinkRel: TWideStringField;
    FDQuery1FeedLinkType: TWideStringField;
    FDQuery1FeedTitle: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Déclarations privées }
    procedure lire_feed(url: string);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  lire_feed('https://developpeur-pascal.fr/rss.php');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  lire_feed('https://serialstreameur.fr/rss.php');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  lire_feed('https://blogs.embarcadero.com/feed/');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  sql: string;
begin
  if FDQuery1.Active then
    if Edit1.Text.Trim.Length > 0 then
    begin
      sql := 'select * from RSSFeed where Title like :keyword order by PubDate desc';
      FDQuery1.Close;
      FDQuery1.Open(sql, ['%' + Edit1.Text.Trim + '%'], [tfieldtype.ftString]);
    end
    else
    begin
      sql := 'select * from RSSFeed order by PubDate desc';
      FDQuery1.Close;
      FDQuery1.Open(sql);
    end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  Edit1.SelectAll;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConnection1.connected := false;
end;

procedure TForm1.lire_feed(url: string);
begin
  if FDConnection1.connected then
    FDConnection1.Close;
  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('DriverID=CDataRSS');
  FDConnection1.Params.Add('URI=' + url);
  FDConnection1.connected := true;
  FDQuery1.Open('select * from RSSFeed order by PubDate desc');
end;

end.

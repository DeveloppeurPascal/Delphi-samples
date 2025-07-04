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
  File last update : 2025-02-09T11:12:21.081+01:00
  Signature : abbc9e4d483791afd7495135913c3a64f8258c93
  ***************************************************************************
*)

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

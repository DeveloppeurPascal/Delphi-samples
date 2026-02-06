(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2026-01-24T10:34:42.000+01:00
  Signature : 074d1c2e769d9ae47866b45d1fd34ec626176714
  ***************************************************************************
*)

unit fMain;

interface

// The TWebBrowser of FireMonkey uses old IE API by default. The JavaScript
// code used in the sample HTML page is not started.

// To use this sample is real situation, install the Edge API from GetIt and
// copy the x86 or x64 DLL in your EXE folder before running it.

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.WebBrowser,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  IdBaseComponent,
  IdComponent,
  IdCustomTCPServer,
  IdCustomHTTPServer,
  IdHTTPServer,
  IdContext;

type
  TForm1 = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    btnStartLocalServer: TButton;
    Edit1: TEdit;
    WebBrowser1: TWebBrowser;
    Layout1: TLayout;
    btnStopLocalServer: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnStartLocalServerClick(Sender: TObject);
    procedure btnStopLocalServerClick(Sender: TObject);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  System.JSON;

procedure TForm1.btnStartLocalServerClick(Sender: TObject);
begin
  btnStartLocalServer.Enabled := false;
  IdHTTPServer1.active := true;
  btnStopLocalServer.Enabled := true;

  WebBrowser1.Navigate('file://' + TPath.Combine(TPath.GetDirectoryName(paramstr(0)), '..', '..', 'webpage.html').Replace('\',
    '/'));
  // The path to the webpage is calculated for Windows only as sample and supposing the project is compiled in "DEBUG/Win32/" folder (or similar)
end;

procedure TForm1.btnStopLocalServerClick(Sender: TObject);
begin
  btnStopLocalServer.Enabled := false;
  IdHTTPServer1.active := false;
  btnStartLocalServer.Enabled := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  btnStartLocalServer.Enabled := true;
  btnStopLocalServer.Enabled := false;
  edit1.Text := '';
end;

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  jso: TJSONObject;
begin
  aresponseinfo.CustomHeaders.AddValue('Content-Type', 'application/json');
  aresponseinfo.CustomHeaders.AddValue('Access-Control-Allow-Origin', '*');
  jso := tjsonobject.Create;
  try
    jso.AddPair('edit1', Edit1.Text);
    aresponseinfo.ContentText := jso.ToJSON;
  finally
    jso.free;
  end;
end;

end.


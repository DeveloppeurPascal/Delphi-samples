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
  File last update : 2025-12-02T16:48:23.996+01:00
  Signature : 71cc15e616065b4f2ec2db02d07b6af2c55c8e0c
  ***************************************************************************
*)

unit WebModuleUnit1;

interface

uses
  System.SysUtils,
  System.Classes,
  Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1AddImageWebActionAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
  public
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.IOUtils,
  Web.ReqMulti,
  FormUnit1;

procedure TWebModule1.WebModule1AddImageWebActionAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  MultiReq: tmultipartcontentparser;
  FileName: string;
  fs: TFileStream;
begin
  //N'ayez AUCUNE confiance dans les données transmises par l'autre côté. Le
  //nom du fichier pourrait être différent de son contenu réel. Ne stockez
  //rien sous le nom d'origine côté serveur et autant que possible ne tenez
  //pas compte de l'extension du fichier transmis.

  // Do NOT trust any data transmitted by the other party. The file name may
  //differ from its actual content. Do not store anything under its original
  //name on the server side, and as much as possible, disregard the file
  //extension of the transmitted file.

  if (tmultipartcontentparser.CanParse(Request)) then
    try
      MultiReq := tmultipartcontentparser.Create(Request);
    finally
      freeandnil(MultiReq);
    end;

  if request.files.Count <> 1 then
    raise Exception.Create('Expecting 1 file.');

  if assigned(Form2) then
  begin
    // BEWARE: I do things WE MUST NOT do in a real project !
    FileName := TPath.GetTempFileName + TPath.GetExtension(request.Files[0].FileName);

    fs := TFileStream.Create(FileName, fmCreate);
    try
      request.Files[0].Stream.Position := 0;
      fs.CopyFrom(request.Files[0].Stream);
    finally
      fs.Free;
    end;
    TThread.Queue(nil, procedure
      begin
        Form2.ShowPicture(FileName);
        TFile.Delete(FileName);
      end);
  end;
end;

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
  '<html>' +
  '<head><title>Web Server Application</title></head>' +
  '<body>Web Server Application</body>' +
  '</html>';
end;

end.


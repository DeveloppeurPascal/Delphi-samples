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
  Signature : 88ccd6bebbeeaa9b703b13f5c25b4faf644f4f6e
  ***************************************************************************
*)

unit uSendFileToServer;

interface

procedure SendFileToServer(const AFileName, AURL, AEndPoint: string);

implementation

uses
  System.Net.HttpClient,
  System.Net.Mime,
  System.SysUtils,
  System.Classes;

procedure SendFileToServer(const AFileName, AURL, AEndPoint: string);
begin
  TThread.CreateAnonymousThread(procedure
    var
      Param: TMultipartFormData;
      Server: THTTPClient;
      Response: IHTTPResponse;
    begin
      Param := TMultipartFormData.Create;
      try
        param.AddFile('img', afilename);
        server := thttpclient.Create;
        try
          server.ContentType := 'multipart/form-data';
          response := server.Post(aurl + '/' + aendpoint, param);
          if response.StatusCode <> 200 then
            raise Exception.Create('Error ' + response.StatusCode.ToString + ' : ' + response.StatusText);
        finally
          server.free;
        end;
      finally
        Param.Free;
      end;
    end).Start;
end;

end.


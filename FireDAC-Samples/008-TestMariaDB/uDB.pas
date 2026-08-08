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
  File last update : 2026-07-31T12:21:56.000+02:00
  Signature : cbaf2bf92bc311746480bcc54776f808aac3db35
  ***************************************************************************
*)

unit uDB;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.ConsoleUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule2 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDQuery1: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
{$IF Defined(WIN64)}
  FDPhysMySQLDriverLink1.VendorHome := 'C:\Program Files\HeidiSQL\';
  FDPhysMySQLDriverLink1.VendorLib := '..\libmysql.dll';
  // C:\Program Files\HeidiSQL\libmysql.dll
{$ELSEIF Defined(WIN32)}
  FDPhysMySQLDriverLink1.VendorHome := 'C:\Dev\MySQL-Client\Win32\';
  FDPhysMySQLDriverLink1.VendorLib := 'libmysql.dll';
  // C:\Dev\MySQL-Client\Win32\lib\libmysql.dll
{$ELSEIF Defined(LINUX)}
  FDPhysMySQLDriverLink1.VendorHome := '';
  FDPhysMySQLDriverLink1.VendorLib := '';
  // "DLL" installed in a known standard folder by "libmariadb-dev" Debian package
{$ELSE}
  {$MESSAGE FATAL 'Platform not supported.'}
{$ENDIF}

  FDConnection1.Connected := true;
end;

procedure TDataModule2.FDConnection1AfterConnect(Sender: TObject);
begin
  if FDConnection1.Connected then
    writeln('Connected')
  else
    writeln('Not connected');
end;

procedure TDataModule2.FDConnection1BeforeConnect(Sender: TObject);
begin
{$IF Defined(MSWINDOWS)}
  FDConnection1.Params.Values['Database'] := 'yourDBname';
  FDConnection1.Params.Values['User_Name'] := 'yourDBuser';
  FDConnection1.Params.Values['Password'] := 'yourpassword';
  FDConnection1.Params.Values['Server'] := 'localhost';
  FDConnection1.Params.Values['Port'] := '3306';
{$ELSEIF Defined(LINUX)}
  FDConnection1.Params.Values['Database'] := 'yourDBname';
  FDConnection1.Params.Values['User_Name'] := 'yourDBuser';
  FDConnection1.Params.Values['Password'] := 'yourpassword';
  FDConnection1.Params.Values['Server'] := 'localhost';
  FDConnection1.Params.Values['Port'] := '3306';
{$ELSE}
  {$MESSAGE FATAL 'Platform not supported.'}
{$ENDIF}
end;

end.


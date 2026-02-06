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
  File last update : 2025-10-25T20:59:09.497+02:00
  Signature : a4acbf52fbe4270c1a3a9400e7b1324557a9a30f
  ***************************************************************************
*)

program TypeInferenceOnADecimalValueSample;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils;

type
  TExtendedHelper = record helper for
    Extended
    function GetType: string;
  end;

  TCurrencyHelper = record helper for Currency
    function GetType: string;
  end;

  TIntegerHelper = record helper for
    Integer
    function GetType: string;
  end;

  TInt64Helper = record helper for Int64
    function GetType: string;
  end;

  { TExtendedHelper }

function TExtendedHelper.GetType: string;
begin
  writeln('Extended');
end;

{ TCurrencyHelper }

function TCurrencyHelper.GetType: string;
begin
  writeln('Currency');
end;

{ TIntegerHelper }

function TIntegerHelper.GetType: string;
begin
  writeln('Integer');
end;

{ TInt64Helper }

function TInt64Helper.GetType: string;
begin
  writeln('Int64');
end;

begin
  try
    var
    Nb := 12.5;
    writeln(Nb.GetType);
    var
      Cur: Currency := 12.5;
    writeln(Cur.GetType);
    var
      Ext: Extended := 12.5;
    writeln(Ext.GetType);
    var
    Nb2 := 12;
    writeln(Nb2.GetType);
  except
    on E: Exception do
      writeln(E.ClassName, ': ', E.Message);
  end;
  readln;

end.

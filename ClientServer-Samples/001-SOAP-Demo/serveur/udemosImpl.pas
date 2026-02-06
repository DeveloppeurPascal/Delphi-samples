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
  File last update : 2025-10-25T20:59:09.353+02:00
  Signature : c45256c1cf22257db7a2697602df4a2e78404cde
  ***************************************************************************
*)

{ Fichier d'implémentation invocable pour Tdemos implémentant Idemos }

unit udemosImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, udemosIntf;

type

  { Tdemos }
  Tdemos = class(TInvokableClass, Idemos)
  public
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
  end;

implementation

function Tdemos.echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
begin
  {TODO : Implémenter la méthode echoEnum }
  Result := Value;
end;

function Tdemos.echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
begin
  {TODO : Implémenter la méthode echoDoubleArray }
  Result := Value;
end;

function Tdemos.echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
begin
  {TODO : Implémenter la méthode echoMyEmployee }
  Result := Value;
end;

function Tdemos.echoDouble(const Value: Double): Double; stdcall;
begin
  {TODO : Implémenter la méthode echoDouble }
  Result := Value;
end;


initialization
{ Les classes invocables doivent être enregistrées }
   InvRegistry.RegisterInvokableClass(Tdemos);
end.


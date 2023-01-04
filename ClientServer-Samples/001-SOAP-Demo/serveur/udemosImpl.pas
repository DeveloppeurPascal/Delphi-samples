{ Fichier d'impl�mentation invocable pour Tdemos impl�mentant Idemos }

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
  {TODO : Impl�menter la m�thode echoEnum }
  Result := Value;
end;

function Tdemos.echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
begin
  {TODO : Impl�menter la m�thode echoDoubleArray }
  Result := Value;
end;

function Tdemos.echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
begin
  {TODO : Impl�menter la m�thode echoMyEmployee }
  Result := Value;
end;

function Tdemos.echoDouble(const Value: Double): Double; stdcall;
begin
  {TODO : Impl�menter la m�thode echoDouble }
  Result := Value;
end;


initialization
{ Les classes invocables doivent �tre enregistr�es }
   InvRegistry.RegisterInvokableClass(Tdemos);
end.


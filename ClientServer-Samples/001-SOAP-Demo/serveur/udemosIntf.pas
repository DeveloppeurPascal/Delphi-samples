{ Interface invocable Idemos }

unit udemosIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type

  TEnumTest = (etNone, etAFew, etSome, etAlot);

  TDoubleArray = array of Double;

  TMyEmployee = class(TRemotable)
  private
    FLastName: UnicodeString;
    FFirstName: UnicodeString;
    FSalary: Double;
  published
    property LastName: UnicodeString read FLastName write FLastName;
    property FirstName: UnicodeString read FFirstName write FFirstName;
    property Salary: Double read FSalary write FSalary;
  end;

  { Les interfaces invocables doivent dériver de IInvokable }
  Idemos = interface(IInvokable)
  ['{0C40A3CD-F3B3-4ED9-9A3B-986E1676BA9D}']

    { Les méthodes de l'interface invocable ne doivent pas utiliser la valeur par défaut }
    { convention d'appel ; stdcall est recommandé }
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
  end;

implementation

initialization
  { Les interfaces invocables doivent être enregistrées }
  InvRegistry.RegisterInterface(TypeInfo(Idemos));

end.

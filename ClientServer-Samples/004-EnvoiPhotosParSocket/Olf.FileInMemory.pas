unit Olf.FileInMemory;

interface

uses
  System.Classes;

type
  TOlfFileContent = class
  private
    FContent: TMemoryStream;
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure LoadFromFile(const AFileName: string);
    procedure SaveToFile(const AFileName: string);
    procedure LoadFromStream(const AStream: TStream);
    procedure SaveToStream(const AStream: TStream);
  end;

implementation

uses
  System.SysUtils;

{ TOlfFileContent }

constructor TOlfFileContent.Create;
begin
  inherited;
  FContent := TMemoryStream.Create;
end;

destructor TOlfFileContent.Destroy;
begin
  FContent.Free;
  inherited;
end;

procedure TOlfFileContent.LoadFromFile(const AFileName: string);
begin
  FContent.LoadFromFile(AFileName);
end;

procedure TOlfFileContent.LoadFromStream(const AStream: TStream);
var
  size: int64;
begin
  if not assigned(AStream) then
    raise exception.Create('Need an existing stream to load from !');

  if (AStream.ReadData(size) <> sizeof(size)) then
    raise exception.Create('Wrong data format.')
  else if (size < 1) then
    FContent.Clear
  else
  begin
    FContent.Clear;
    FContent.Position := 0;
    if FContent.CopyFrom(AStream, size) <> size then
      raise exception.Create('Wrong source size.');
  end;
end;

procedure TOlfFileContent.SaveToFile(const AFileName: string);
begin
  FContent.SaveToFile(AFileName);
end;

procedure TOlfFileContent.SaveToStream(const AStream: TStream);
var
  size: int64;
begin
  if not assigned(AStream) then
    raise exception.Create('Need an existing stream to save to !');

  size := FContent.size;
  AStream.WriteData(size);
  if (size > 0) then
  begin
    FContent.Position := 0;
    AStream.CopyFrom(FContent, size);
  end;
end;

end.

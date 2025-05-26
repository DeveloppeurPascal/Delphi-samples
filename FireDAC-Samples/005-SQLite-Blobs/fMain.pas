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
  File last update : 2025-04-04T13:16:55.960+02:00
  Signature : c4d2ee3da4eaeac634920ab278a1d942929c1e7a
  ***************************************************************************
*)

unit fMain;

interface

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
  FMX.Memo.Types,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef,
  FMX.StdCtrls,
  FireDAC.Phys.SQLite,
  FireDAC.Comp.Client,
  Data.DB,
  FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    GridPanelLayout1: TGridPanelLayout;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    FDQuery1: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    btnSQL: TButton;
    btnTable: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FDConnection1BeforeConnect(Sender: TObject);
    procedure FDConnection1AfterConnect(Sender: TObject);
    procedure btnTableClick(Sender: TObject);
    procedure btnSQLClick(Sender: TObject);
  private
    HasToCreateDB: boolean;
  public
    procedure ShowTableContent;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  Olf.RTL.Params,
  System.IOUtils,
  uSQL,
  Olf.RTL.GenRandomID;

procedure TForm1.btnSQLClick(Sender: TObject);
var
  FileName, FileContent: string;
  Params: TFDParams;
begin
  FileName := 'File' + TOlfRandomIDGenerator.getIDBase10(5);
  FileContent := TOlfRandomIDGenerator.getIDBase62(20);
  Memo1.lines.Add('Append file : ' + FileName);
  Memo1.lines.Add(FileContent);

  try
    // Works for a simple "blob" type like a string.
    // FDConnection1.ExecSQL
    // ('insert into imyfiles (filename, filecontent) values (:fn, :fc)',
    // [FileName, FileContent], [tfieldtype.ftString, tfieldtype.ftBlob]);

    Params := TFDParams.Create;
    try
      Params.Add('fn', tfieldtype.ftString).Value := FileName;
      Params.Add('fc', tfieldtype.ftBlob).AsStream :=
        TStringStream.Create(FileContent);
      FDConnection1.ExecSQL
        ('insert into imyfiles (filename, filecontent) values (:fn, :fc)',
        Params);
    finally
      Params.Free;
    end;

    ShowTableContent;
  except
    on e: exception do
      Memo1.lines.Add(e.message);
  end;
end;

procedure TForm1.btnTableClick(Sender: TObject);
var
  ss: TStringStream;
  FileName, FileContent: string;
begin
  FileName := 'File' + TOlfRandomIDGenerator.getIDBase10(5);
  FileContent := TOlfRandomIDGenerator.getIDBase62(20);
  Memo1.lines.Add('Append file : ' + FileName);
  Memo1.lines.Add(FileContent);

  try
    FDTable1.Open('IMyFiles');
    try
      FDTable1.Append;
      try
        FDTable1.FieldByName('FileName').AsString := FileName;
        ss := TStringStream.Create(FileContent);
        try
          ss.position := 0;
          TBlobField(FDTable1.FieldByName('FileContent')).LoadFromStream(ss);
        finally
          ss.Free;
        end;
        FDTable1.Post;
      finally
        FDTable1.Cancel;
      end;
    finally
      FDTable1.close;
    end;
    ShowTableContent;
  except
    on e: exception do
      Memo1.lines.Add(e.message);
  end;
end;

procedure TForm1.FDConnection1AfterConnect(Sender: TObject);
begin
  if HasToCreateDB then
  begin
    FDConnection1.ExecSQL(CTableCreateSQL);
    FDConnection1.ExecSQL(CIndexCreateSQL);
  end;

  ShowTableContent;
end;

procedure TForm1.FDConnection1BeforeConnect(Sender: TObject);
var
  DBFileName: string;
begin
  DBFileName := TParams.getValue('DBFileName', '');
  if DBFileName.IsEmpty or (not tfile.Exists(DBFileName)) then
  begin
    DBFileName := tpath.GetTempFileName;
    TParams.SetValue('DBFileName', DBFileName);
    TParams.Save;
    HasToCreateDB := true;
  end
  else
    HasToCreateDB := false;
  Memo1.lines.Add(DBFileName);
  Memo1.lines.Add('----------');

  FDConnection1.Params.Clear;
  FDConnection1.Params.AddPair('DriverID', 'SQLite');
  FDConnection1.Params.AddPair('LockingMode', 'Normal');
  FDConnection1.Params.AddPair('Database', DBFileName);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FDConnection1.Open;
end;

procedure TForm1.ShowTableContent;
var
  FileName, FileContent: string;
  ss: TStringStream;
begin
  FDQuery1.Open('select * from IMyFiles order by FileName, Id');
  try
    while not FDQuery1.eof do
    begin
      FileName := FDQuery1.FieldByName('FileName').AsString;
      ss := TStringStream.Create;
      try
        TBlobField(FDQuery1.FieldByName('FileContent')).SaveToStream(ss);
        FileContent := ss.DataString;
      finally
        ss.Free;
      end;
      Memo1.lines.Add(FileName + ' - ' + FileContent);
      FDQuery1.Next;
    end;
  finally
    FDQuery1.close;
  end;
  Memo1.lines.Add('----------');
  Memo1.GoToTextEnd;
end;

initialization

TParams.InitDefaultFileNameV2('DeveloppeurPascal', 'DelphiSamples');

{$IFDEF DEBUG}
ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

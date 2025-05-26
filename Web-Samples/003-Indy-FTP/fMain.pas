(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Pr�martin under AGPL 3.0 license.

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
  File last update : 2025-02-09T11:12:21.047+01:00
  Signature : c090f197ed77c2ffa9db57c3d76dd4980914a8f9
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, IdFTPList, FMX.Memo.Types;

type
  TForm1 = class(TForm)
    IdFTP1: TIdFTP;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure IdFTP1BannerWarning(ASender: TObject; const AMsg: string);
    procedure Button1Click(Sender: TObject);
    procedure IdFTP1AfterClientLogin(Sender: TObject);
    procedure IdFTP1AfterGet(ASender: TObject; AStream: TStream);
    procedure IdFTP1AfterPut(Sender: TObject);
    procedure IdFTP1BannerAfterLogin(ASender: TObject; const AMsg: string);
    procedure IdFTP1BannerBeforeLogin(ASender: TObject; const AMsg: string);
    procedure IdFTP1BeforeGet(Sender: TObject);
    procedure IdFTP1BeforePut(ASender: TObject; AStream: TStream);
    procedure IdFTP1Connected(Sender: TObject);
    procedure IdFTP1CreateFTPList(ASender: TObject;
      var VFTPList: TIdFTPListItems);
    procedure IdFTP1CustomFTPProxy(Sender: TObject);
    procedure IdFTP1DataChannelCreate(ASender: TObject;
      ADataChannel: TIdTCPConnection);
    procedure IdFTP1DataChannelDestroy(ASender: TObject;
      ADataChannel: TIdTCPConnection);
    procedure IdFTP1DirParseEnd(Sender: TObject);
    procedure IdFTP1DirParseStart(Sender: TObject);
    procedure IdFTP1Disconnected(Sender: TObject);
    procedure IdFTP1NeedAccount(ASender: TObject; var VAcct: string);
    procedure IdFTP1RetrievedDir(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure IdFTP1TLSNotAvailable(ASender: TObject; var VContinue: Boolean);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure Button2Click(Sender: TObject);
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  IdFTP1.Connect;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  IdFTP1.ChangeDir('/');
  IdFTP1.List;
end;

procedure TForm1.IdFTP1AfterClientLogin(Sender: TObject);
begin
  Memo1.Lines.Add('OnAfterClientLogin');
end;

procedure TForm1.IdFTP1AfterGet(ASender: TObject; AStream: TStream);
begin
  Memo1.Lines.Add('OnAfterGet');
end;

procedure TForm1.IdFTP1AfterPut(Sender: TObject);
begin
  Memo1.Lines.Add('OnAfterPut');
end;

procedure TForm1.IdFTP1BannerAfterLogin(ASender: TObject; const AMsg: string);
begin
  Memo1.Lines.Add('OnBannerAfterLogin');
  Memo1.Lines.Add(AMsg);
end;

procedure TForm1.IdFTP1BannerBeforeLogin(ASender: TObject; const AMsg: string);
begin
  Memo1.Lines.Add('OnBannerBeforeLogin');
  Memo1.Lines.Add(AMsg);
end;

procedure TForm1.IdFTP1BannerWarning(ASender: TObject; const AMsg: string);
begin
  Memo1.Lines.Add('OnBannerWarning');
  showmessage(AMsg);
end;

procedure TForm1.IdFTP1BeforeGet(Sender: TObject);
begin
  Memo1.Lines.Add('OnBeforeGet');
end;

procedure TForm1.IdFTP1BeforePut(ASender: TObject; AStream: TStream);
begin
  Memo1.Lines.Add('OnBeforePut');
end;

procedure TForm1.IdFTP1Connected(Sender: TObject);
begin
  Memo1.Lines.Add('OnConnected');
end;

procedure TForm1.IdFTP1CreateFTPList(ASender: TObject;
  var VFTPList: TIdFTPListItems);
begin
  Memo1.Lines.Add('OnCreateFTPList');
end;

procedure TForm1.IdFTP1CustomFTPProxy(Sender: TObject);
begin
  Memo1.Lines.Add('OnCustomFTPProxy');
end;

procedure TForm1.IdFTP1DataChannelCreate(ASender: TObject;
  ADataChannel: TIdTCPConnection);
begin
  Memo1.Lines.Add('OnDataChannelCreate');
end;

procedure TForm1.IdFTP1DataChannelDestroy(ASender: TObject;
  ADataChannel: TIdTCPConnection);
begin
  Memo1.Lines.Add('OnDataChannelDestroy');
end;

procedure TForm1.IdFTP1DirParseEnd(Sender: TObject);
begin
  Memo1.Lines.Add('OnDirParseEnd');
end;

procedure TForm1.IdFTP1DirParseStart(Sender: TObject);
begin
  Memo1.Lines.Add('OnDirParseStart');
end;

procedure TForm1.IdFTP1Disconnected(Sender: TObject);
begin
  Memo1.Lines.Add('OnDisconnect');
end;

procedure TForm1.IdFTP1NeedAccount(ASender: TObject; var VAcct: string);
begin
  Memo1.Lines.Add('OnNeedAccount');
end;

procedure TForm1.IdFTP1RetrievedDir(Sender: TObject);
var
  i: integer;
begin
  Memo1.Lines.Add('OnRetrieveDir');
  Memo1.Lines.Add('**********');
  for i := 0 to IdFTP1.DirectoryListing.count - 1 do
    Memo1.Lines.Add(IdFTP1.DirectoryListing[i].FileName);
  Memo1.Lines.Add('**********');
end;

procedure TForm1.IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  Memo1.Lines.Add('OnStatus');
end;

procedure TForm1.IdFTP1TLSNotAvailable(ASender: TObject;
  var VContinue: Boolean);
begin
  Memo1.Lines.Add('OnTLSNoAvailable');
end;

procedure TForm1.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Memo1.Lines.Add('OnWork');
end;

procedure TForm1.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  Memo1.Lines.Add('OnWorksBegin');
end;

procedure TForm1.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Memo1.Lines.Add('OnWorkEnd');
end;

end.

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
  File last update : 2025-02-09T11:12:20.913+01:00
  Signature : a887f1422455b426c734658e907fe61b80461b96
  ***************************************************************************
*)

unit cadFileSelectionFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TSelectFileProc = reference to procedure(SelectedFile: string);
  TSelectFileEvent = procedure(SelectedFile: string) of object;

  TFileSelectionFrame = class(TFrame)
    FolderAndFileList: TListView;
    procedure FolderAndFileListDblClick(Sender: TObject);
  private
    { Déclarations privées }
    FSelectFileProc: TSelectFileProc;
    FFolderRoot: string;
    FSelectedFile: string;
    procedure LoadFolder(FolderPath: string);
    procedure SetSelectedFile(const Value: string);
  public
    { Déclarations publiques }
    property SelectedFile: string read FSelectedFile write SetSelectedFile;
    procedure SelectFile(FolderPath: string; FolderRoot: string = '';
      SelectFileProc: TSelectFileProc = nil); overload;
    procedure SelectFile(FolderPath, FolderRoot: string;
      SelectFileProc: TSelectFileEvent); overload;
  end;

implementation

{$R *.fmx}

uses
  System.IOUtils, udmAdobeStock_13945297;

const
  CListItemIsAFile = 1;
  CListItemIsAFolder = -1;

procedure TFileSelectionFrame.FolderAndFileListDblClick(Sender: TObject);
begin
  if assigned(FolderAndFileList.Selected) then
    if FolderAndFileList.Selected.Tag = CListItemIsAFolder then
      LoadFolder(FolderAndFileList.Selected.tagstring)
    else
      SelectedFile := FolderAndFileList.Selected.tagstring;
end;

procedure TFileSelectionFrame.LoadFolder(FolderPath: string);
var
  item: TListViewItem;
begin
  if (FolderPath.Trim.IsEmpty) then
    raise exception.Create('Give the root folder to display.');
  if (not tdirectory.Exists(FolderPath)) then
    raise exception.Create('Folder "' + FolderPath + '" doesn''t exist !');
  if (not FFolderRoot.IsEmpty) and (not FolderPath.StartsWith(FFolderRoot)) THEN
    FolderPath := FFolderRoot;

  var
  Files := tdirectory.GetFiles(FolderPath);
  var
  Folders := tdirectory.GetDirectories(FolderPath);

  FolderAndFileList.BeginUpdate;
  try
    FolderAndFileList.Items.Clear;
    // Current folder
    item := FolderAndFileList.Items.Add;
    item.Text := FolderPath;
    item.Purpose := TListItemPurpose.Header;
    // Parent folder
    item := FolderAndFileList.Items.Add;
    item.Text := '..';
    item.tagstring := TPath.GetDirectoryName(FolderPath);
    item.Tag := CListItemIsAFolder;
    item.Purpose := TListItemPurpose.None;
    item.Accessory := TAccessoryType.More;
    // folders list
    for var i := 0 to length(Folders) - 1 do
      if (tdirectory.Exists(Folders[i])) then
      begin
        item := FolderAndFileList.Items.Add;
        item.Text := TPath.GetFileName(Folders[i]);
        // extract last part of the path
        item.tagstring := Folders[i];
        item.Tag := CListItemIsAFolder;
        item.Purpose := TListItemPurpose.None;
        item.Accessory := TAccessoryType.More;
        item.ImageIndex := 0; // dossier
      end;
    // files list
    for var i := 0 to length(Files) - 1 do
      if (tfile.Exists(Files[i])) then
      begin
        item := FolderAndFileList.Items.Add;
        item.Text := TPath.GetFileName(Files[i]);
        item.tagstring := Files[i];
        item.Tag := CListItemIsAFile;
        item.Purpose := TListItemPurpose.None;
        item.Accessory := TAccessoryType.Detail;
        if (Files[i].EndsWith('.jpg') or Files[i].EndsWith('.jpeg') or
          Files[i].EndsWith('.png') or Files[i].EndsWith('.gif')) then
          item.ImageIndex := 2 // image
        else
          item.ImageIndex := 1; // fichier
      end;
  finally
    FolderAndFileList.endupdate;
  end;
end;

procedure TFileSelectionFrame.SelectFile(FolderPath, FolderRoot: string;
  SelectFileProc: TSelectFileProc);
begin
  FSelectFileProc := SelectFileProc;
  FFolderRoot := FolderRoot;
  LoadFolder(FolderPath);
end;

procedure TFileSelectionFrame.SelectFile(FolderPath, FolderRoot: string;
  SelectFileProc: TSelectFileEvent);
begin
  SelectFile(FolderPath, FolderRoot,
    procedure(fs: string)
    begin
      if assigned(SelectFileProc) then
        SelectFileProc(fs);
    end);
end;

procedure TFileSelectionFrame.SetSelectedFile(const Value: string);
begin
  FSelectedFile := Value;
  if assigned(FSelectFileProc) then
    FSelectFileProc(FSelectedFile);
end;

end.

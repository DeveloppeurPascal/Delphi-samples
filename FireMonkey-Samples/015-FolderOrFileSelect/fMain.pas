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
  File last update : 2025-10-25T20:59:09.643+02:00
  Signature : 81e37340c9fe7c1e75987636a012706d7fc02d08
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.ImageList, FMX.ImgList, FMX.ListView, FMX.Controls.Presentation,
  FMX.StdCtrls, udmAdobeStock_13945297;

type
  TForm1 = class(TForm)
    FolderAndFileList: TListView;
    btnShowSelected: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnShowSelectedClick(Sender: TObject);
    procedure FolderAndFileListDblClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    procedure LoadFolder(FolderPath: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.IOUtils;

const
  CListItemIsAFile = 1;
  CListItemIsAFolder = -1;

procedure TForm1.btnShowSelectedClick(Sender: TObject);
begin
  if assigned(FolderAndFileList.Selected) and
    (FolderAndFileList.Selected is TListViewItem) then
    showmessage((FolderAndFileList.Selected as TListViewItem).tagstring);
end;

procedure TForm1.FolderAndFileListDblClick(Sender: TObject);
begin
  if assigned(FolderAndFileList.Selected) then
    if FolderAndFileList.Selected.Tag = CListItemIsAFolder then
      LoadFolder(FolderAndFileList.Selected.tagstring)
    else
      btnShowSelectedClick(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadFolder(TPath.GetDocumentsPath);
end;

procedure TForm1.LoadFolder(FolderPath: string);
var
  item: TListViewItem;
begin
  if (FolderPath.Trim.IsEmpty) then
    raise exception.Create('Give the root folder to display.');
  if (not tdirectory.Exists(FolderPath)) then
    raise exception.Create('Folder "' + FolderPath + '" doesn''t exist !');

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

end.

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
  File last update : 2025-02-09T11:12:20.899+01:00
  Signature : 964b1a61b7b5607d6e0fc9dab7656726b02aaf2f
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.TreeView, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Edit, uDBCategories, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
  FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmMain = class(TForm)
    tvArborescence: TTreeView;
    Layout1: TLayout;
    Splitter1: TSplitter;
    BlocAttenteChargement: TRectangle;
    BlocAttenteChargementAnimation: TAniIndicator;
    GridPanelLayout1: TGridPanelLayout;
    btnAjouteFrere: TButton;
    btnAjouteDescendant: TButton;
    btnSupprimeAvecSesDescendants: TButton;
    zoneDeSaisie: TLayout;
    lblLibelle: TLabel;
    lblPrix: TLabel;
    lblNomFichier: TLabel;
    GridPanelLayout2: TGridPanelLayout;
    btnOk: TButton;
    btnCancel: TButton;
    edtLibelle: TEdit;
    edtPrix: TEdit;
    edtNomFichier: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
    procedure btnAjouteFrereClick(Sender: TObject);
    procedure btnAjouteDescendantClick(Sender: TObject);
    procedure btnSupprimeAvecSesDescendantsClick(Sender: TObject);
    procedure tvArborescenceChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure EcranBloque;
    procedure EcranDebloque;
    procedure InitialiseEcran;
    procedure ProblemeDeBaseDeDonnees;
    procedure ChargeArborescence(CategorieMere: TTreeViewItem = nil;
      AvecDescendants: boolean = true);
    procedure DesactiveZoneDeSaisie;
  public
    { Déclarations publiques }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses
  System.Threading;

procedure TfrmMain.btnAjouteDescendantClick(Sender: TObject);
var
  item: TTreeViewItem;
begin
  DesactiveZoneDeSaisie;
  item := TTreeViewItem.create(self);
  item.text := 'n/a';
  if assigned(tvArborescence.Selected) then
  begin
    item.tag := dmDBCategories.ajoutecategorie(tvArborescence.Selected.tag,
      item.text);
    tvArborescence.Selected.AddObject(item);
    if (not tvArborescence.Selected.IsExpanded) then
      tvArborescence.Selected.Expand;
  end
  else
  begin
    item.tag := dmDBCategories.ajoutecategorie(0, item.text);
    tvArborescence.AddObject(item);
  end;
end;

procedure TfrmMain.btnAjouteFrereClick(Sender: TObject);
var
  item: TTreeViewItem;
begin
  DesactiveZoneDeSaisie;
  item := TTreeViewItem.create(self);
  item.text := 'n/a';
  if assigned(tvArborescence.Selected) and
    (nil <> tvArborescence.Selected.ParentItem) then
  begin
    item.tag := dmDBCategories.ajoutecategorie
      (tvArborescence.Selected.ParentItem.tag, item.text);
    tvArborescence.Selected.ParentItem.AddObject(item);
    if (not tvArborescence.Selected.ParentItem.IsExpanded) then
      tvArborescence.Selected.ParentItem.Expand;
  end
  else
  begin
    item.tag := dmDBCategories.ajoutecategorie(0, item.text);
    tvArborescence.AddObject(item);
  end;
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  DesactiveZoneDeSaisie;
end;

procedure TfrmMain.btnOkClick(Sender: TObject);
begin
  if (dmDBCategories.tabCategories.State = dsedit) then
  begin
    dmDBCategories.tabCategories.Post;
    tvArborescence.Selected.text := edtLibelle.text;
  end;
end;

procedure TfrmMain.btnSupprimeAvecSesDescendantsClick(Sender: TObject);
begin
  DesactiveZoneDeSaisie;
  // TODO : supprimer le niveau et ses descendants
end;

procedure TfrmMain.ChargeArborescence(CategorieMere: TTreeViewItem;
  AvecDescendants: boolean);
var
  item: TTreeViewItem;
  code: integer;
  qry: TFDQuery;
begin
  if assigned(CategorieMere) then
    code := CategorieMere.tag
  else
    code := 0;
  qry := TFDQuery.create(self);
  try
    qry.Connection := dmDBCategories.dbCategories;
    qry.Open('select code, libelle from categories where categorie_mere_code=:c order by libelle',
      [code]);
    while not qry.eof do
    begin
      item := TTreeViewItem.create(self);
      item.text := qry.FieldByName('libelle').asstring;
      item.tag := qry.FieldByName('code').asinteger;
      if assigned(CategorieMere) then
        CategorieMere.AddObject(item)
      else
        tvArborescence.AddObject(item);
      if AvecDescendants then
        ChargeArborescence(item, true);
      qry.next;
    end;
  finally
    qry.free;
  end;
  if assigned(CategorieMere) and (not CategorieMere.IsExpanded) then
    CategorieMere.Expand;
end;

procedure TfrmMain.DesactiveZoneDeSaisie;
begin
  zoneDeSaisie.Visible := false;
  if (dmDBCategories.tabCategories.State = dsedit) then
    dmDBCategories.tabCategories.cancel;
end;

procedure TfrmMain.EcranBloque;
begin
  BlocAttenteChargement.Visible := true;
  BlocAttenteChargementAnimation.Enabled := true;
  BlocAttenteChargement.BringToFront;
end;

procedure TfrmMain.EcranDebloque;
begin
  BlocAttenteChargementAnimation.Enabled := false;
  BlocAttenteChargement.Visible := false;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  zoneDeSaisie.Visible := false;
  EcranBloque;
  try
    if not assigned(dmDBCategories) then
      dmDBCategories := tdmDBCategories.create(self);
    ttask.run(
      procedure
      var
        ok: boolean;
      begin
        try
          repeat
            sleep(100);
            tthread.Synchronize(nil,
              procedure
              begin
                ok := dmDBCategories.dbCategories.Connected;
              end);
          until (tthread.CheckTerminated or ok);
        finally
          tthread.Queue(nil,
            procedure
            begin
              EcranDebloque;
              if dmDBCategories.dbCategories.Connected then
                InitialiseEcran
              else
                ProblemeDeBaseDeDonnees;
            end);
        end;
      end);
  except
    EcranDebloque;
  end;
end;

procedure TfrmMain.InitialiseEcran;
begin
  tvArborescence.BeginUpdate;
  try
    tvArborescence.Clear;
    ChargeArborescence;
  finally
    tvArborescence.EndUpdate;
  end;
  // TODO : compléter initialisation écran
end;

procedure TfrmMain.ProblemeDeBaseDeDonnees;
begin
  ShowMessage('Impossible d''ouvrir la base de données.');
end;

procedure TfrmMain.tvArborescenceChange(Sender: TObject);
begin
  DesactiveZoneDeSaisie;
  zoneDeSaisie.Visible := assigned(tvArborescence.Selected) and
    dmDBCategories.tabCategories.FindKey([tvArborescence.Selected.tag]);
  if zoneDeSaisie.Visible then
  begin
    lblNomFichier.Visible := (nil = tvArborescence.Selected.ParentItem);
    lblPrix.Visible := (not lblNomFichier.Visible) and
      (tvArborescence.Selected.Count = 0);
  end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.

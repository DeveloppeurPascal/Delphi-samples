unit fChoisirUnTarif;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Layouts, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Objects;

type
  TCallbackChoisirUnTarifProc = reference to procedure(IDTarifChoisi: integer);
  TCallbackChoisirUnTarifEvent = procedure(IDTarifChoisi: integer) of object;

  TChoisirUnTarif = class(TForm)
    zoneCategoriesListe: TFlowLayout;
    zoneCategories: TVertScrollBox;
    ListeLignes: TListView;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListeLignesItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Déclarations privées }
    FCategorieEnCours: integer;
    FonChoisirUnTarifProc: TCallbackChoisirUnTarifProc;
    procedure ChargeLesCategories;
    procedure ChargeLaListe(MereCode: integer);
    procedure RecalculeHauteurListeCategories;
    procedure ClickSurCategorie(Sender: TObject);
    procedure AfficheLesCategories;
    procedure AfficheLaListe;
    procedure DoChoisirUnTarif(const AItem: TListViewItem);
  public
    { Déclarations publiques }
    class procedure Execute(CallbackProc: TCallbackChoisirUnTarifProc);
      overload;
    class procedure Execute(CallbackEvent
      : TCallbackChoisirUnTarifEvent); overload;
  end;

implementation

{$R *.fmx}

uses
  uDBPourAffichage, uDownloadAndGetFiles, System.Math;
{ TChoisirUnTarif }

procedure TChoisirUnTarif.AfficheLaListe;
begin
  zoneCategories.Visible := false;
  ListeLignes.Visible := true;
end;

procedure TChoisirUnTarif.AfficheLesCategories;
begin
  zoneCategories.Visible := true;
  ListeLignes.Visible := false;
end;

procedure TChoisirUnTarif.ChargeLaListe(MereCode: integer);
var
  qry: tfdquery;
  item: TListViewItem;
begin
  ListeLignes.BeginUpdate;
  try
    ListeLignes.items.Clear;
    FCategorieEnCours := MereCode;
    item := ListeLignes.items.Add;
    item.Purpose := TListItemPurpose.none;
    item.Text := '< Retour';
    item.Tag := -1;
    item.Accessory := TAccessoryType.Detail; // TODO : masquer l'accessoire
    qry := tfdquery.Create(self);
    try
      qry.Connection := dmDBPourAffichage.dbCategories;
      qry.open('select * from categories where categorie_mere_code=:c order by libelle',
        [MereCode]);
      while not qry.eof do
      begin
        item := ListeLignes.items.Add;
        item.Purpose := TListItemPurpose.none;
        item.Text := qry.FieldByName('libelle').asstring;
        item.Tag := qry.FieldByName('code').asinteger;
        if (0 = dmDBPourAffichage.dbCategories.ExecSQLScalar
          ('select code from categories where categorie_mere_code=:c limit 0,1',
          [item.Tag])) then
        begin
          item.TagString := 'ok';
          item.Accessory := TAccessoryType.checkmark;
        end
        else
        begin
          item.TagString := '';
          item.Accessory := TAccessoryType.more;
        end;
        qry.next;
      end;
    finally
      qry.free;
    end;
    item := ListeLignes.items.Add;
    item.Purpose := TListItemPurpose.none;
    item.Text := '<< Quitter';
    item.Tag := -2;
    item.Accessory := TAccessoryType.Detail; // TODO : masquer l'accessoire
  finally
    ListeLignes.EndUpdate;
  end;
end;

procedure TChoisirUnTarif.ChargeLesCategories;
var
  qry: tfdquery;
  img: timage;
begin
  qry := tfdquery.Create(self);
  try
    qry.Connection := dmDBPourAffichage.dbCategories;
    qry.open('select * from categories where categorie_mere_code=0 order by libelle');
    while not qry.eof do
    begin
      if (not qry.FieldByName('nom_fichier_image').asstring.IsEmpty) then
      begin
        img := timage.Create(self);
        img.parent := zoneCategoriesListe;
        img.width := 200;
        img.height := 200;
        img.WrapMode := TImageWrapMode.Fit;
        img.Margins.Top := 5;
        img.Margins.right := 5;
        img.Margins.left := 5;
        img.Margins.bottom := 5;
        img.OnClick := ClickSurCategorie;
        img.Tag := qry.FieldByName('code').asinteger;
        ChargeBitmapDansImage(img, qry.FieldByName('nom_fichier_image')
          .asstring);
      end;
      qry.next;
    end;
  finally
    qry.free;
  end;
  RecalculeHauteurListeCategories;
end;

procedure TChoisirUnTarif.ClickSurCategorie(Sender: TObject);
begin
  ChargeLaListe((Sender as timage).Tag);
  AfficheLaListe;
end;

class procedure TChoisirUnTarif.Execute(CallbackEvent
  : TCallbackChoisirUnTarifEvent);
begin
  Execute(
    procedure(IDTarifChoisi: integer)
    begin
      if assigned(CallbackEvent) then
        CallbackEvent(IDTarifChoisi);
    end);
end;

procedure TChoisirUnTarif.DoChoisirUnTarif(const AItem: TListViewItem);
begin
  close;
  if assigned(AItem) then
    FonChoisirUnTarifProc(AItem.Tag)
  else
    FonChoisirUnTarifProc(-1);
  tthread.ForceQueue(nil,
    procedure
    begin
      self.free;
    end);
end;

class procedure TChoisirUnTarif.Execute(CallbackProc
  : TCallbackChoisirUnTarifProc);
var
  frm: TChoisirUnTarif;
begin
  frm := TChoisirUnTarif.Create(application);
  frm.FonChoisirUnTarifProc := CallbackProc;
{$IF Defined(ANDROID) or Defined(IOS)}
  frm.Show
{$ELSE}
  frm.ShowModal;
{$ENDIF}
end;

procedure TChoisirUnTarif.FormCreate(Sender: TObject);
begin
  ChargeLesCategories;
  AfficheLesCategories;
end;

procedure TChoisirUnTarif.FormResize(Sender: TObject);
begin
  RecalculeHauteurListeCategories;
end;

procedure TChoisirUnTarif.ListeLignesItemClick(const Sender: TObject;
const AItem: TListViewItem);
var
  MereCode: integer;
begin
  if AItem.Tag = -1 then // Retour
  begin
    MereCode := dmDBPourAffichage.dbCategories.ExecSQLScalar
      ('select categorie_mere_code from categories where code=:c',
      [FCategorieEnCours]);
    if (MereCode < 1) then
      AfficheLesCategories
    else
      ChargeLaListe(MereCode);
  end
  else if AItem.Tag = -2 then // Quitter = abandonner la sélection
    DoChoisirUnTarif(nil)
  else if AItem.TagString.IsEmpty then // Niveau suivant
    ChargeLaListe(AItem.Tag)
  else // Element sélectionné
    DoChoisirUnTarif(AItem);
end;

procedure TChoisirUnTarif.RecalculeHauteurListeCategories;
var
  NewHeight: single;
  i: integer;
  c: tcontrol;
begin
  if zoneCategories.Visible and zoneCategoriesListe.Visible then
  begin
    NewHeight := 0;
    for i := 0 to zoneCategoriesListe.ChildrenCount - 1 do
      if (zoneCategoriesListe.Children[i] is tcontrol) then
      begin
        c := (zoneCategoriesListe.Children[i] as tcontrol);
        NewHeight := max(NewHeight, c.position.y + c.Margins.Top +
          c.Margins.bottom + c.height);
      end;
    zoneCategoriesListe.height := NewHeight + zoneCategoriesListe.Padding.Top +
      zoneCategoriesListe.Padding.bottom;
  end;
end;

end.

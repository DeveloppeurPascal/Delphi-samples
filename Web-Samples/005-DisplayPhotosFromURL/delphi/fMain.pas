unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    btnChargeImages: TButton;
    StatusBar1: TStatusBar;
    lblStatus: TLabel;
    VertScrollBox1: TVertScrollBox;
    Switch1: TSwitch;
    procedure btnChargeImagesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Switch1Switch(Sender: TObject);
  private
    { Déclarations privées }
    procedure traiter_liste(url_json: string);
    procedure traiter_image(url_image: string; num: integer);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses u_download, json, System.IOUtils, FMX.Objects, FMX.Effects,
  FMX.Filter.Effects;

procedure TForm1.btnChargeImagesClick(Sender: TObject);
begin
  btnChargeImages.Enabled := false;
  // use the URL for the "php" folder of this project
  traiter_liste('http://localhost/php/');
  // traiter_liste('http://demos.olfsoftware.fr/brive-liste-photos/');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lblStatus.Text := '';
  btnChargeImages.SetFocus;
  Switch1.IsChecked := false;
end;

procedure TForm1.Switch1Switch(Sender: TObject);
var
  composant: tcomponent;
  i: integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    composant := components[i];
    if composant is teffect then
      (composant as teffect).Enabled := Switch1.IsChecked;
  end;
end;

procedure TForm1.traiter_image(url_image: string; num: integer);
var
  img_name: string;
begin
  img_name := tdownload_file.temporaryFileName('test-photo-' + num.ToString);
  lblStatus.Text := 'Chargement de l''image ' + url_image;
  Application.ProcessMessages;
  tdownload_file.download(url_image, img_name,
    procedure
    var
      img: timage;
    begin
      lblStatus.Text := 'Affichage de l''image ' + url_image;
      Application.ProcessMessages;
      img := timage.Create(Self);
      try
        img.Parent := VertScrollBox1;
        img.Align := TAlignLayout.Top;
        img.Height := 200;
        img.Margins.Top := 5;
        img.Margins.Bottom := 5;
        img.Bitmap.LoadFromFile(img_name);
        case random(6) of
          0:
            with TBlurEffect.Create(Self) do
            begin
              Parent := img;
              Enabled := Switch1.IsChecked;
            end;
          1:
            with TBevelEffect.Create(Self) do
            begin
              Parent := img;
              Enabled := Switch1.IsChecked;
            end;
          2:
            with TShadowEffect.Create(Self) do
            begin
              Parent := img;
              Enabled := Switch1.IsChecked;
            end;
          3:
            with TMonochromeEffect.Create(Self) do
            begin
              Parent := img;
              Enabled := Switch1.IsChecked;
            end;
          4:
            with TInvertEffect.Create(Self) do
            begin
              Parent := img;
              Enabled := Switch1.IsChecked;
            end;
        else
          with TSwirlEffect.Create(Self) do
          begin
            Parent := img;
            Enabled := Switch1.IsChecked;
          end;
        end;
        // showmessage(img_name);
        tfile.Delete(img_name);
      except
        if assigned(img) then
          img.Free;
      end;
    end,
    procedure
    begin
      lblStatus.Text := 'Chargement de ' + url_image + ' impossible.';
      Application.ProcessMessages;
      // showmessage(img_name);
      tfile.Delete(img_name);
    end);
end;

procedure TForm1.traiter_liste(url_json: string);
var
  nom_fichier_json: string;
begin
  lblStatus.Text := 'Chargement de la liste des images.';
  Application.ProcessMessages;
  nom_fichier_json := tdownload_file.temporaryFileName('test-json');
  tdownload_file.download(url_json, nom_fichier_json,
    procedure
    var
      jso: TJSONObject;
      liste: TJSONArray;
      i: integer;
    begin
      try
        lblStatus.Text := 'Liste chargée.';
        Application.ProcessMessages;
        try
          jso := TJSONObject.ParseJSONValue(tfile.ReadAllText(nom_fichier_json,
            TEncoding.UTF8)) as TJSONObject;
          if assigned(jso) then
          begin
            liste := jso.GetValue('liste') as TJSONArray;
            for i := 0 to liste.count - 1 do
              traiter_image(liste.Items[i].Value, i);
          end;
        finally
          if assigned(jso) then
            jso.Free;
        end;
      finally
        // showmessage(nom_fichier_json);
        tfile.Delete(nom_fichier_json);
      end;
    end,
    procedure
    begin
      lblStatus.Text := 'Erreur au chargement de la liste des images.';
      Application.ProcessMessages;
      // showmessage(nom_fichier_json);
      tfile.Delete(nom_fichier_json);
      btnChargeImages.Enabled := false;
    end);
end;

end.

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Calendar, FMX.DateTimeCtrls, FMX.StdCtrls,
  FMX.Edit;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Popup1: TPopup;
    Calendar1: TCalendar;
    DropDownEditButton1: TDropDownEditButton;
    Button1: TButton;
    EditButton1: TEditButton;
    procedure Calendar1DateSelected(Sender: TObject);
    procedure DropDownEditButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    OldEdit1Value: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.DateUtils;

procedure TForm1.Button1Click(Sender: TObject);
begin
  showmessage(Edit1.text);
end;

procedure TForm1.Calendar1DateSelected(Sender: TObject);
begin
  Edit1.text := Calendar1.DateTime.ToISO8601.Substring(0, 10);
end;

procedure TForm1.DropDownEditButton1Click(Sender: TObject);
begin
  if not Popup1.IsOpen then
    OldEdit1Value := Edit1.text;
  Popup1.Width := Calendar1.Width;
  Popup1.Height := Calendar1.Height;
  Popup1.IsOpen := not Popup1.IsOpen;
end;

procedure TForm1.EditButton1Click(Sender: TObject);
begin
  if Edit1.text <> OldEdit1Value then
    Edit1.text := OldEdit1Value
  else
    Edit1.text := '';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OldEdit1Value := '';
end;

end.

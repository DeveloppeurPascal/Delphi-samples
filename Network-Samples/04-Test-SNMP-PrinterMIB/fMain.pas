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
  File last update : 2026-02-28T20:41:00.000+01:00
  Signature : 38212927aec7460c2ae42a2b643a3232d3f89852
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.Net.Socket,
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
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,
  System.Generics.Collections,
  System.JSON;

const
  // IPv4 de l'appareil à surveiller sous forme de 4 octets
  CAgentIP_1 = 192;
  CAgentIP_2 = 168;
  CAgentIP_3 = 1;
  CAgentIP_4 = 50;
  // Port de l'agent SNMP sur l'appareil à surveiller
  CAgentPort = 161;

  // Port d'écoute du Manager (ce programme)
  // 162 => non utilisable sur un ordinateur ayant déjà un manager SNMP, à changer si on veut, utilisé pour les notifications provenant des agents
  CManagerPort = 162;

type
  TIntegers = TArray<integer>;
  TOIDs = TDictionary<string, string>;

  TForm1 = class(TForm)
    Memo1: TMemo;
    btnShowPrinterModel: TButton;
    Timer1: TTimer;
    btnShowAllPrinterInfos: TButton;
    cbShowTrame: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure btnShowPrinterModelClick(Sender: TObject);
    procedure btnShowAllPrinterInfosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FSocket: TSocket;
    FCounter: byte;
    FPrinterMIB: TJSONObject;
    FOIDs: TOIDs;
  protected
    procedure AddLog(const Text: string);
    procedure ShowTrame(const Trame: TBytes; const Count: integer = -1; const StartOffset: integer = 0);
    procedure ShowTrameContent(const Trame: TBytes; const Count: integer = -1; const StartOffset: integer = 0);
    procedure SendSNMPMessage(const OID: TIntegers; const CallShowTrame: boolean = true); overload;
    procedure SendSNMPMessage(const OIDString: string; const CallShowTrame: boolean = true); overload;
    function OIDAsText(const OID: string): string;
  public
    procedure AfterConstruction; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.IOUtils;

const
  // A Layman's Guide to a Subset of ASN.1, BER, and DER
  // https://luca.ntop.org/Teaching/Appunti/asn1.html
  //
  // https://en.wikipedia.org/wiki/X.690#Identifier_octets
  // => description du BER Basic Encoding Rules et des valeurs des éléments de la norme venant d'ASN.1
  //
  CPrimitive = $00;
  CConstructed = $20;
  CSequence = $00 + CConstructed + $10; // Tag class Universal + P/C Constructed + SEQUENCE
  CInteger = $00 + CPrimitive + $02; // Tag class Universal + P/C Primitive + INTEGER
  COctetString = $00 + CPrimitive + $04; // Tag class Universal + P/C Primitive + OCTET STRING
  CObjectIdentifier = $00 + CPrimitive + $06; // Tag class Universal + P/C Primitive + OBJECT IDENTIFIER
  CNull = $00 + CPrimitive + $05; // Tag class Universal + P/C Primitive + NULL
  CCdeGetRequest = $80 + CConstructed + $00; // Tag class ContextSpecific + P/C Constructed + GetRequest
  CCdeGetResponse = $80 + CConstructed + $02; // Tag class ContextSpecific + P/C Constructed + GetResponse

procedure TForm1.AddLog(const Text: string);
begin
  TThread.Queue(nil, procedure
    begin
      memo1.lines.Add(Text);
    end);
end;

procedure TForm1.AfterConstruction;
begin
  inherited;
  fsocket := tsocket.Create(tsockettype.UDP);
  fsocket.Bind(CManagerPort);
  if TSocketState.Connected in fsocket.state then
    addlog('Connected');
  if TSocketState.Client in fsocket.state then
    addlog('Client');
  if TSocketState.Listening in fsocket.state then
    addlog('Listening');
end;

procedure TForm1.btnShowAllPrinterInfosClick(Sender: TObject);
var
  i: integer;
  Item: TJSONPair;
  jso: TJSONObject;
  ItemClasse: string;
  ItemName: string;
  ItemStatus: string;
  ItemNodeType: string;
  ItemOID: string;
begin
  //  SendSNMPMessage('1.3.6.1.2.1.43.5'); // prtGeneral
  //  SendSNMPMessage('1.3.6.1.2.1.43.5.1'); // prtGeneralTable
  //  SendSNMPMessage('1.3.6.1.2.1.43.5.1.1'); // prtGeneralEntry
  //    SendSNMPMessage('1.3.6.1.2.1.43.5.1.1.1.1'); // prtGeneralConfigChanges.1

  for i := 0 to FPrinterMIB.Count - 1 do
  begin
    Item := FPrinterMIB.Pairs[i];
    jso := Item.JsonValue as TJSONObject;
    if jso.TryGetValue<string>('name', itemname) and jso.TryGetValue<string>('oid', itemoid) and
    jso.TryGetValue<string>('status', itemstatus) and itemstatus.equals('current') and jso.TryGetValue<string>('class',
      itemclasse) then
      if itemclasse.Equals('objecttype') then
      begin
        if jso.TryGetValue<string>('nodetype', itemnodetype) then
        begin
          if itemnodetype.Equals('column') then
          begin
            SendSNMPMessage(itemoid + '.1', cbShowTrame.IsChecked);
          end;
        end
        else
        begin
        end;
        //        addlog(itemclasse + ' -> ' + Item.JsonString.Value);
      end;
  end;
end;

procedure TForm1.btnShowPrinterModelClick(Sender: TObject);
begin
  // mib-2 : 1,3,6,1,2,1
  // -> https://oidref.com/1.3.6.1.2.1
  // printmib : 1,3,6,1,2,1,43
  // -> https://oidref.com/1.3.6.1.2.1.43

  // Les infos suivantes dont dans la table d'informations sur l'imprimante, le .1 final cible les infos du premier enregistrement de la table

  //  prtGeneralPrinterName : modèle de l'imprimante
  // .1.3.6.1.2.1.43.5.1.1.16
  SendSNMPMessage([1, 3, 6, 1, 2, 1, 43, 5, 1, 1, 16, 1], cbShowTrame.IsChecked);

  // prtGeneralServicePerson : société propriétaire ou personne référencée sur les infos de l'imprimante
// .1.3.6.1.2.1.43.5.1.1.5
  SendSNMPMessage([1, 3, 6, 1, 2, 1, 43, 5, 1, 1, 5, 1], cbShowTrame.IsChecked);

  // prtGeneralCurrentOperator : opérateur de l'imprimante ou infos de contact
  // .1.3.6.1.2.1.43.5.1.1.4
  SendSNMPMessage([1, 3, 6, 1, 2, 1, 43, 5, 1, 1, 4, 1], cbShowTrame.IsChecked);
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;
  FCounter := 0;
  FSocket := nil;
  FPrinterMIB := nil;
  FOIDs := TOIDs.Create;
end;

destructor TForm1.Destroy;
begin
  foids.Free;
  inherited;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
  jso: TJSONObject;
  ItemName, ItemOID: string;
begin
  // TODO : fonctionne pour Windows depuis l'IDE, à adapter pour les autres plateformes
  FPrinterMIB := TJSONObject.ParseJSONValue(TFile.ReadAllText(TPath.Combine('..', '..', 'Printer-MIB.json'), TEncoding.UTF8))
  as
  TJSONObject;

  for i := 0 to FPrinterMIB.Count - 1 do
  begin
    jso := FPrinterMIB.Pairs[i].JsonValue as TJSONObject;
    if jso.TryGetValue<string>('name', itemname) and jso.TryGetValue<string>('oid', itemoid) then
      foids.Add(itemoid, itemname);
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FPrinterMIB.Free;
end;

function TForm1.OIDAsText(const OID: string): string;
var
  LastDotPos: integer;
begin
  if oid.IsEmpty then
    result := ''
  else if not FOIDs.TryGetValue(oid, result) then
  begin
    lastdotpos := oid.LastIndexOf('.');
    result := OIDAsText(oid.Substring(0, LastDotPos)) + oid.Substring(LastDotPos);
  end;
end;

procedure TForm1.SendSNMPMessage(const OID: TIntegers; const CallShowTrame: boolean);
var
  Msg: TBytes;
  MsgSize: integer;
  Position: integer;
  MsgLengthPos, PDULengthPos, VarBindListPos, VarBindPos, OIDLengthPos: cardinal;
  i: integer;
  s: ANSIString;
  NbSent: integer;
begin
  SetLength(msg, 1024);

  // https://www.rfc-editor.org/rfc/rfc1157#section-4
  // => description du protocole SNMP
  //
  // Msg ::=
  //         SEQUENCE {
  //              version        -- version-1 for this RFC
  //                 INTEGER {
  //                     version-1(0)
  //                 },
  //
  //             community      -- community name
  //                 OCTET STRING,
  //
  //             data           -- e.g., PDUs if trivial
  //                 ANY        -- authentication is being used
  //         }
  Position := 0;
  Msg[Position] := CSequence;

  Position := Position + 1;
  MsgLengthPos := Position;

  // version (INTEGER)
  Position := Position + 1;
  Msg[Position] := CInteger; // tag

  Position := Position + 1;
  Msg[Position] := 1; // length

  Position := Position + 1;
  Msg[Position] := 0; // valeur -> SNMPv1

  // community (OCTET STRING)
  s := 'public';
  Position := Position + 1;
  Msg[Position] := COctetString; // tag

  Position := Position + 1;
  Msg[Position] := length(s); // length

  for i := 1 to length(s) do
  begin
    Position := Position + 1;
    Msg[Position] := ord(s[i]); // caractères de la chaine
  end;

  // data => GetRequest-PDU
  // https://www.rfc-editor.org/rfc/rfc1157#section-4.1.2
         //
//  GetRequest-PDU ::=
//    [0]
//        IMPLICIT SEQUENCE {
//            request-id
//                RequestID,
//
//            error-status        -- always 0
//                ErrorStatus,
//
//            error-index         -- always 0
//                ErrorIndex,
//
//            variable-bindings
//                VarBindList
//        }

    // GetRequest
  Position := Position + 1;
  Msg[Position] := CCdeGetRequest;

  Position := Position + 1;
  PDULengthPos := Position;

  // RequestID (INTEGER)
  Position := Position + 1;
  Msg[Position] := CInteger; // tag

  Position := Position + 1;
  Msg[Position] := 1; // length

  if FCounter = 255 then
    fcounter := 0
  else
    fcounter := fcounter + 1;
  Position := Position + 1;
  Msg[Position] := FCounter; // valeur

  // ErrorStatus (INTEGER)
  Position := Position + 1;
  Msg[Position] := CInteger; // tag

  Position := Position + 1;
  Msg[Position] := 1; // length

  Position := Position + 1;
  Msg[Position] := 0; // valeur

  // ErrorIndex (INTEGER)
  Position := Position + 1;
  Msg[Position] := CInteger; // tag

  Position := Position + 1;
  Msg[Position] := 1; // length

  Position := Position + 1;
  Msg[Position] := 0; // valeur

  //  VarBindList ::=
  //          SEQUENCE OF
  //              VarBind
  Position := Position + 1;
  Msg[Position] := CSequence;

  Position := Position + 1;
  VarBindListPos := Position;

  //  VarBind ::=
  //          SEQUENCE {
  //              name
  //                  ObjectName,
  //
  //              value
  //                  ObjectSyntax
  //          }
  Position := Position + 1;
  Msg[Position] := CSequence;

  Position := Position + 1;
  VarBindPos := Position;

  // ObjectName = OID
  Position := Position + 1;
  Msg[Position] := CObjectIdentifier; // tag

  Position := Position + 1;
  OIDLengthPos := Position;

  for i := 0 to length(oid) - 1 do
    case i of
      0:
        begin
          Position := Position + 1;
          Msg[Position] := 40 * oid[i];
        end;
      1:
        Msg[Position] := Msg[Position] + oid[i];
    else
      Position := Position + 1;
      Msg[Position] := oid[i];
      // TODO : traiter les valeurs dépassant 127 sous forme d'entiers en base 128
    end;

  Msg[OIDLengthPos] := position - oidlengthpos; // TODO : traiter les longueurs > 127

  // Value = NULL sur les request
  Position := Position + 1;
  Msg[Position] := CNull; // tag

  Position := Position + 1;
  Msg[Position] := 0; // length

  // VarBind rempli, on indique sa taille au début
  Msg[VarBindPos] := Position - VarBindPos; // Nombre total d'octets dans la séquence VarBind
  // TODO : traiter les longueurs > 127

 // VarBindList rempli, on indique sa taille au début
  Msg[VarBindListPos] := Position - VarBindListPos; // Nombre total d'octets dans la séquence VarBindList
  // TODO : traiter les longueurs > 127

 // PDU rempli, on indique sa taille au début
  Msg[PDULengthPos] := Position - PDULengthPos; // Nombre total d'octets dans la séquence du PDU
  // TODO : traiter les longueurs > 127

 // Message rempli, on indique sa taille au début
  Msg[MsgLengthPos] := Position - MsgLengthPos; // Nombre total d'octets dans la séquence du message
  // TODO : traiter les longueurs > 127

 // Taille de la trame à transmettre
  MsgSize := Position + 1; // Position démarre à 0 et va jusqueà MsgSize-1

  NbSent := fsocket.SendTo(Msg, TNetEndpoint.Create(CAgentIP_1, CAgentIP_2, CAgentIP_3, CAgentIP_4, CAgentPort), 0, MsgSize);
  if CallShowTrame then
  begin
    Addlog('Demande envoyée (' + NbSent.ToString + ' octets) :');
    if (nbsent <> MsgSize) then
      addlog('Nb Sent (' + nbsent.tostring + ') <> MsgSize (' + MsgSize.tostring + ')');
    ShowTrame(Msg, MsgSize);
  end;
end;

procedure TForm1.SendSNMPMessage(const OIDString: string;
  const CallShowTrame: boolean);
var
  OIDTab: TIntegers;
  tab: TStringDynArray;
  i, j: integer;
begin
  tab := OIDString.Split(['.']);
  setlength(OIDTab, length(tab));
  j := 0;
  for i := 0 to length(tab) - 1 do
    if (not tab[i].IsEmpty) then
    begin
      OIDTab[j] := tab[i].ToInteger;
      j := j + 1;
    end;
  setlength(OIDTab, j);
  SendSNMPMessage(oidtab, CallShowTrame);
end;

procedure TForm1.ShowTrame(const Trame: TBytes; const Count: integer; const StartOffset: integer);
var
  i: integer;
  s_dec, s_hex, s_ASCII: string;
  nb: integer;
begin
  if count > 0 then
    nb := count
  else
    nb := length(trame);
  for i := StartOffset to StartOffset + nb - 1 do
  begin
    s_dec := s_dec + trame[i].ToString + ' ';
    s_hex := s_hex + IntToHex(trame[i]) + ' ';
    if (trame[i] >= ord(' ')) then
      s_ASCII := s_ASCII + chr(trame[i])
    else
      s_ASCII := s_ASCII + '.';
  end;
  addlog(s_dec);
  addlog(s_hex);
  addlog(s_ascii);
end;

procedure TForm1.ShowTrameContent(const Trame: TBytes; const Count,
  StartOffset: integer);
var
  i: integer;
  Step: byte; // 0 = Tag, 1 = Length, 2 = Value
  TagClass: byte;
  ValueLength: integer;
  CurOID,
  CurValue: string;
begin
  Step := 0;
  CurOID := '';
  CurValue := '';
  TagClass := 0;
  ValueLength := 0;
  i := startoffset;
  while (i < StartOffset + count) do
  begin
    case step of
      0: // tag byte
        begin
          if (not curoid.IsEmpty) and (not CurValue.IsEmpty) then
          begin
            addlog(OIDAsText(CurOID) + ' -> ' + CurValue);
            CurOID := '';
          end;
          TagClass := trame[i];
          CurValue := '';
          step := 1;
        end;
      1: // length byte
        begin
          ValueLength := trame[i];
          if (TagClass and CConstructed) > 0 then
            step := 0 // on ignore les structures pour s'occuper des parties de leur valeur
          else if ValueLength > 0 then
            step := 2
          else
            step := 0;
        end;
    else // value bytes
      begin
        if tagclass = CObjectIdentifier then
        begin
          if curoid.IsEmpty then
          begin
            curoid := (trame[i] div 40).ToString + '.' + (trame[i] mod 40).ToString;
          end
          else
            CurOID := curoid + '.' + trame[i].ToString;
        end
        else if TagClass = COctetString then
        begin
          if (trame[i] >= ord(' ')) then
            CurValue := CurValue + chr(trame[i])
          else
            CurValue := CurValue + '.';
        end
        else
          CurValue := CurValue + IntToHex(trame[i]) + ' ';
        dec(valuelength);
        if valuelength = 0 then
          step := 0;
      end;
    end;
    inc(i);
  end;
  if (not curoid.IsEmpty) and (not CurValue.IsEmpty) then
  begin
    addlog(OIDAsText(CurOID) + ' -> ' + CurValue);
    CurOID := '';
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  Trame: TBytes;
  TrameLength: Word;
  Endpoint: TNetEndpoint;
  Offset, Count: integer;
begin
  TrameLength := fsocket.ReceiveFrom(Trame, Endpoint);
  if (tramelength > 0) then
  begin
    offset := 0;
    repeat
      count := trame[offset + 1] + 2;
      if cbShowTrame.IsChecked then
      begin
        Addlog('Réponse reçue (' + Count.ToString + ' octets) :');
        ShowTrame(Trame, Count, offset);
      end;
      ShowTrameContent(Trame, Count, offset);
      offset := offset + count; // 2 = Tag + Length bytes
    until offset >= tramelength;
  end;
end;

end.


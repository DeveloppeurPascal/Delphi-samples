unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.net.Socket,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
    procedure AddLog(msg: string);
    procedure ServeurTraiteConnection(ClientSocket: TSocket);
  public
    { Déclarations publiques }
    num: integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.threading;

const
  CPortDEcoute = 8081;
  CTerminateur = string('|'); // string(#10); // Linefeed; // '*****';

procedure TForm1.AddLog(msg: string);
begin
  if self = nil then
    exit;
  if Memo1 = nil then
    exit;
  tmonitor.Enter(Memo1);
  try
    Memo1.lines.insert(0, msg);
    Memo1.GoToTextBegin;
  finally
    tmonitor.exit(Memo1);
  end;
  // tthread.Synchronize(nil, // bloque le thread le temps de l'exécution
  // tthread.queue(nil, // exécute directement si thread principal sinon passe en file d'attente
  // tthread.forcequeue(nil, // passe en file d'attente, application.processmessages suivant le traite
  // procedure
  // begin
  // Memo1.lines.insert(0, msg);
  // end);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Button1.enabled := false;
  try
    inc(num);
    // for var i := 0 to random(10) do
    ttask.run(
      procedure
      var
        SocketClient: TSocket;
        ACK: string;
      begin
        try
          try
            SocketClient := TSocket.Create(tsockettype.tcp, tencoding.UTF8);
            try
              SocketClient.Connect('', '127.0.0.1', '', CPortDEcoute);
              if (tsocketstate.client in SocketClient.State) then
                AddLog('Client : mode client');
              if (tsocketstate.listening in SocketClient.State) then
                AddLog('Client : mode listening');
              if (tsocketstate.connected in SocketClient.State) then
              begin
                AddLog('Client : mode connected');
                // if (-1 <> SocketClient.Sendto('coucou' + num.tostring)) then
                if (-1 <> SocketClient.Send('Hello world ' + num.tostring +
                  CTerminateur)) then
                  AddLog('Client ' + num.tostring + ' send something.')
                else
                  AddLog('Client : sending error ' + num.tostring);
              end;
              // attente de l'accusé de réception provenant du serveur
              ACK := '';
              repeat
                ACK := ACK + SocketClient.ReceiveString;
              until (tthread.CheckTerminated or ACK.EndsWith(CTerminateur));
              if (not ACK.isempty) then
                AddLog('Reçu ' + ACK.Substring(0,
                  ACK.Length - CTerminateur.Length))
              else
                AddLog('Client : Rien reçu dans le délai d''attente.');
              SocketClient.Close;
            finally
              SocketClient.free;
            end;
          finally
            tthread.queue(nil,
              procedure
              begin
                // L'interface peut avoir été supprimée avant le thread, donc violation d'accès possible
                if self = nil then
                  exit;
                if Button1 = nil then
                  exit;
                Button1.enabled := true;
              end);
          end;
        except // pas bien, mais pratique
          // raise;
        end;
      end);
  except
    Button1.enabled := true;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // tthread.CreateAnonymousThread(
  // procedure
  // begin
  // end).start;
  ttask.run(
    procedure
    var
      ServeurSocket: TSocket;
    begin
      ServeurSocket := TSocket.Create(tsockettype.tcp, tencoding.UTF8);
      try
        // Serveur.bind(CPortDEcoute);
        ServeurSocket.Listen('127.0.0.1', '', CPortDEcoute);
        if (tsocketstate.client in ServeurSocket.State) then
          AddLog('Serveur Client');
        if (tsocketstate.listening in ServeurSocket.State) then
          AddLog('Serveur Listening');
        if (tsocketstate.connected in ServeurSocket.State) then
          AddLog('Serveur Connected');
        while not tthread.CheckTerminated do
          try
            ServeurTraiteConnection(ServeurSocket.accept(100));
          except
            on e: exception do
              AddLog('Serveur except: ' + e.Message);
          end;
        ServeurSocket.Close;
      finally
        ServeurSocket.free;
      end;
    end);
end;

procedure TForm1.ServeurTraiteConnection(ClientSocket: TSocket);
begin
  // Pas de client si timeout dépassé lors de l'appel
  if not assigned(ClientSocket) then
    exit;
  // Traitement en cas de client connecté
  try
    ttask.run(
      procedure
      var
        msg: string;
      begin
        try
          msg := '';
          repeat
            msg := msg + ClientSocket.ReceiveString;
          until (tthread.CheckTerminated or msg.EndsWith(CTerminateur));
          if (not msg.isempty) then
            AddLog('Reçu ' + msg.Substring(0, msg.Length - CTerminateur.Length))
          else
            AddLog('Serveur : Rien reçu dans le délai d''attente.');
          ClientSocket.Send('ACK' + CTerminateur);
          ClientSocket.Close;
        finally
          ClientSocket.free;
        end;
      end);
  except
    ClientSocket.free;
  end;
end;

initialization

{$IFDEF DEBUG }
  reportmemoryleaksonshutdown := true;

{$ENDIF }

end.

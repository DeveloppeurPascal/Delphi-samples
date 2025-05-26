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
  File last update : 2025-02-09T11:12:22.000+01:00
  Signature : d65c1f0f7f15d2d9b16b6b5f7a5902c02b14dd0a
  ***************************************************************************
*)

program PictureSender_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {fmrMain},
  SendPicturesOnANetworkWithSockets in '..\SendPicturesOnANetworkWithSockets.pas',
  Olf.Net.Socket.Messaging in '..\..\..\Libraries\Socket-Messaging-Library\src\Olf.Net.Socket.Messaging.pas',
  Olf.FMX.Streams in '..\..\..\Libraries\librairies\src\Olf.FMX.Streams.pas',
  Olf.RTL.FileBuffer in '..\..\..\Libraries\librairies\src\Olf.RTL.FileBuffer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmrMain, fmrMain);
  Application.Run;
end.

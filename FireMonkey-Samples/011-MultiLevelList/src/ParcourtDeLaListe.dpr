/// <summary>
/// ***************************************************************************
///
/// Delphi sample projects
///
/// Copyright 2023-2024 Patrick Prémartin under AGPL 3.0 license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Set of projects demonstrating the features of the Delphi development
/// environment, its libraries and its programming language.
///
/// Some of the projects have been presented at conferences, on training
/// courses or online coding sessions.
///
/// The programs are up to date with the Community Edition and the commercial
/// version of Delphi or RAD Studio.
///
/// ***************************************************************************
///
/// Author(s) :
///      Patrick PREMARTIN
///
/// Site :
///      https://samples.developpeur-pascal.fr
///
/// Project site :
///      https://github.com/DeveloppeurPascal/Delphi-samples
///
/// ***************************************************************************
/// File last update : 04/08/2024 09:03:36
/// Signature : 11b63258dbff989951649bdd587fbe5825a501a7
/// ***************************************************************************
/// </summary>

program ParcourtDeLaListe;

uses
  System.StartUpCopy,
  FMX.Forms,
  fChoisirUnTarif in 'fChoisirUnTarif.pas' {ChoisirUnTarif},
  uDBPourAffichage in 'uDBPourAffichage.pas' {dmDBPourAffichage: TDataModule},
  uConst in 'uConst.pas',
  uDownloadAndGetFiles in 'uDownloadAndGetFiles.pas',
  uFichiersEtDossiers in 'uFichiersEtDossiers.pas',
  uMainPourAffichage in 'uMainPourAffichage.pas' {frmMain},
  u_download in '..\..\..\Libraries\librairies\u_download.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

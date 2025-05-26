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
  File last update : 2025-02-09T11:12:20.785+01:00
  Signature : b43ab8ff36736a8f7e0c793d329c235c59701eb8
  ***************************************************************************
*)

unit uAppTetheringSettings;

interface

const
  /// <summary>
  /// used by a TTetheringManager to find other apps with the same group name
  /// </summary>
  CAppTetheringManagerGroupName = '{54BB2136-CF26-4F3C-889A-03FFD2B606DC}';

  /// <summary>
  /// used by a TTetheringManager during appearing to an other TTetheringManager
  /// </summary>
  CAppTetheringManagerPassword = '{87E95BDE-7DF8-4009-93EA-9160CAF3C324}';

  /// <summary>
  /// used by TTetheringAppProfiles to communicate between paires TTetheringManager
  /// </summary>
  CAppTetheringProfileName = '{B4C4A2D0-2077-436B-A0D9-C83A1483490D}';

  /// <summary>
  /// Texte fourni par le profil d'envoi à ses pairs
  /// </summary>
  CAppTetheringSenderProfileText = 'Bitmap sender';

  /// <summary>
  /// Texte fourni par le profil de réception à ses pairs
  /// </summary>
  CAppTetheringReceiverProfileText = 'Bitmap receiver';

implementation

end.

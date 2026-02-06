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
  File last update : 2025-10-25T20:59:09.385+02:00
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

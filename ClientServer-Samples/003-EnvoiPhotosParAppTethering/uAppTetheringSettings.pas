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

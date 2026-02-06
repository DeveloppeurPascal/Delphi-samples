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
  File last update : 2026-02-06T17:38:57.868+01:00
  Signature : 2a4aa5a6b4804ac2dbbc903eab2669811b24d9ba
  ***************************************************************************
*)

program QRCodeReader_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uConsts in '..\uConsts.pas',
  ZXing.ScanManager in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\ZXing.ScanManager.pas',
  ZXing.Datamatrix.DataMatrixReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\ZXing.Datamatrix.DataMatrixReader.pas',
  ZXing.QrCode.QRCodeReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\ZXing.QrCode.QRCodeReader.pas',
  ZXing.Datamatrix.Internal.Detector in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.Datamatrix.Internal.Detector.pas',
  ZXing.QrCode.Internal.AlignmentPattern in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPattern.pas',
  ZXing.QrCode.Internal.AlignmentPatternFinder in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternFinder.pas',
  ZXing.QrCode.Internal.AlignmentPatternImplementation in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternImplementation.pas',
  ZXing.QrCode.Internal.Detector in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.Detector.pas',
  ZXing.QrCode.Internal.FinderPattern in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPattern.pas',
  ZXing.QrCode.Internal.FinderPatternFinder in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternFinder.pas',
  ZXing.QrCode.Internal.FinderPatternImplementation in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternImplementation.pas',
  ZXing.QrCode.Internal.FinderPatternInfo in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternInfo.pas',
  ZXing.Datamatrix.Internal.BitMatrixParser in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.BitMatrixParser.pas',
  ZXing.Datamatrix.Internal.DataBlock in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DataBlock.pas',
  ZXing.Datamatrix.Internal.DecodedBitStreamParser in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DecodedBitStreamParser.pas',
  ZXing.Datamatrix.Internal.Decoder in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Decoder.pas',
  ZXing.Datamatrix.Internal.Version in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Version.pas',
  ZXing.QrCode.Internal.BitMatrixParser in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.BitMatrixParser.pas',
  ZXing.QrCode.Internal.DataBlock in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataBlock.pas',
  ZXing.QrCode.Internal.DataMask in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataMask.pas',
  ZXing.QrCode.Internal.DecodedBitStreamParser in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DecodedBitStreamParser.pas',
  ZXing.QrCode.Internal.Decoder in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Decoder.pas',
  ZXing.QrCode.Internal.ErrorCorrectionLevel in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.ErrorCorrectionLevel.pas',
  ZXing.QrCode.Internal.FormatInformation in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.FormatInformation.pas',
  ZXing.QrCode.Internal.Mode in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Mode.pas',
  ZXing.QrCode.Internal.QRCodeDecoderMetaData in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.QRCodeDecoderMetaData.pas',
  ZXing.QrCode.Internal.Version in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Version.pas',
  ZXing.BaseLuminanceSource in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.BaseLuminanceSource.pas',
  ZXing.Binarizer in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.Binarizer.pas',
  ZXing.BinaryBitmap in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.BinaryBitmap.pas',
  ZXing.GlobalHistogramBinarizer in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.GlobalHistogramBinarizer.pas',
  ZXing.HybridBinarizer in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.HybridBinarizer.pas',
  ZXing.InvertedLuminanceSource in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.InvertedLuminanceSource.pas',
  ZXing.LuminanceSource in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.LuminanceSource.pas',
  ZXing.PlanarYUVLuminanceSource in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.PlanarYUVLuminanceSource.pas',
  ZXing.RGBLuminanceSource in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Filtering\ZXing.RGBLuminanceSource.pas',
  ZXing.BarcodeFormat in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.BarcodeFormat.pas',
  ZXing.BitSource in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.BitSource.pas',
  ZXIng.ByteSegments in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXIng.ByteSegments.pas',
  ZXing.CharacterSetECI in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.CharacterSetECI.pas',
  ZXing.Common.BitArray in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.BitArray.pas',
  ZXing.Common.BitArrayImplementation in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.BitArrayImplementation.pas',
  ZXing.Common.BitMatrix in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.BitMatrix.pas',
  ZXing.Common.DetectorResult in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.DetectorResult.pas',
  ZXing.Common.GridSampler in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.GridSampler.pas',
  ZXing.Common.PerspectiveTransform in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.PerspectiveTransform.pas',
  ZXing.DecodeHintType in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.DecodeHintType.pas',
  ZXing.DecoderResult in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.DecoderResult.pas',
  ZXing.DefaultGridSampler in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.DefaultGridSampler.pas',
  ZXing.EncodeHintType in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.EncodeHintType.pas',
  ZXing.Helpers in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Helpers.pas',
  ZXing.MultiFormatReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.MultiFormatReader.pas',
  ZXing.Reader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.Reader.pas',
  ZXing.ReadResult in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.ReadResult.pas',
  ZXing.ResultMetadataType in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.ResultMetadataType.pas',
  ZXing.ResultPoint in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.ResultPoint.pas',
  ZXing.ResultPointImplementation in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.ResultPointImplementation.pas',
  ZXing.StringUtils in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ZXing.StringUtils.pas',
  ZXing.Common.Detector.MathUtils in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\Detector\ZXing.Common.Detector.MathUtils.pas',
  ZXing.Common.Detector.WhiteRectangleDetector in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\Detector\ZXing.Common.Detector.WhiteRectangleDetector.pas',
  ZXing.Common.ReedSolomon.GenericGF in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ReedSolomon\ZXing.Common.ReedSolomon.GenericGF.pas',
  ZXing.Common.ReedSolomon.ReedSolomonDecoder in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\Common\ReedSolomon\ZXing.Common.ReedSolomon.ReedSolomonDecoder.pas',
  ZXing.OneD.Code39Reader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.Code39Reader.pas',
  ZXing.OneD.Code93Reader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.Code93Reader.pas',
  ZXing.OneD.Code128Reader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.Code128Reader.pas',
  ZXing.OneD.EAN8Reader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.EAN8Reader.pas',
  ZXing.OneD.EAN13Reader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.EAN13Reader.pas',
  ZXing.OneD.EANManufacturerOrgSupport in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.EANManufacturerOrgSupport.pas',
  ZXing.OneD.ITFReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.ITFReader.pas',
  ZXing.OneD.OneDReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.OneDReader.pas',
  ZXing.OneD.UPCAReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCAReader.pas',
  ZXing.OneD.UPCEANExtension2Support in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtension2Support.pas',
  ZXing.OneD.UPCEANExtension5Support in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtension5Support.pas',
  ZXing.OneD.UPCEANExtensionSupport in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtensionSupport.pas',
  ZXing.OneD.UPCEANReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANReader.pas',
  ZXing.OneD.UPCEReader in '..\..\..\lib-externes\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEReader.pas',
  Olf.RTL.Checksum in '..\..\..\lib-externes\librairies\src\Olf.RTL.Checksum.pas',
  u_md5 in '..\..\..\lib-externes\librairies\src\u_md5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

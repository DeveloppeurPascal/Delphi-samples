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
  Signature : 23c62a7fe8703f1351d5cbfc0f328ab2bc980b58
  ***************************************************************************
*)

program QRCodeReader_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  uConsts in '..\uConsts.pas',
  ZXing.ScanManager in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\ZXing.ScanManager.pas',
  ZXing.Datamatrix.DataMatrixReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\ZXing.Datamatrix.DataMatrixReader.pas',
  ZXing.QrCode.QRCodeReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\ZXing.QrCode.QRCodeReader.pas',
  ZXing.Datamatrix.Internal.Detector in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.Datamatrix.Internal.Detector.pas',
  ZXing.QrCode.Internal.AlignmentPattern in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPattern.pas',
  ZXing.QrCode.Internal.AlignmentPatternFinder in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternFinder.pas',
  ZXing.QrCode.Internal.AlignmentPatternImplementation in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.AlignmentPatternImplementation.pas',
  ZXing.QrCode.Internal.Detector in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.Detector.pas',
  ZXing.QrCode.Internal.FinderPattern in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPattern.pas',
  ZXing.QrCode.Internal.FinderPatternFinder in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternFinder.pas',
  ZXing.QrCode.Internal.FinderPatternImplementation in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternImplementation.pas',
  ZXing.QrCode.Internal.FinderPatternInfo in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Detector\ZXing.QrCode.Internal.FinderPatternInfo.pas',
  ZXing.Datamatrix.Internal.BitMatrixParser in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.BitMatrixParser.pas',
  ZXing.Datamatrix.Internal.DataBlock in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DataBlock.pas',
  ZXing.Datamatrix.Internal.DecodedBitStreamParser in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.DecodedBitStreamParser.pas',
  ZXing.Datamatrix.Internal.Decoder in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Decoder.pas',
  ZXing.Datamatrix.Internal.Version in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.Datamatrix.Internal.Version.pas',
  ZXing.QrCode.Internal.BitMatrixParser in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.BitMatrixParser.pas',
  ZXing.QrCode.Internal.DataBlock in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataBlock.pas',
  ZXing.QrCode.Internal.DataMask in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DataMask.pas',
  ZXing.QrCode.Internal.DecodedBitStreamParser in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.DecodedBitStreamParser.pas',
  ZXing.QrCode.Internal.Decoder in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Decoder.pas',
  ZXing.QrCode.Internal.ErrorCorrectionLevel in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.ErrorCorrectionLevel.pas',
  ZXing.QrCode.Internal.FormatInformation in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.FormatInformation.pas',
  ZXing.QrCode.Internal.Mode in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Mode.pas',
  ZXing.QrCode.Internal.QRCodeDecoderMetaData in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.QRCodeDecoderMetaData.pas',
  ZXing.QrCode.Internal.Version in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\2D Barcodes\Decoder\ZXing.QrCode.Internal.Version.pas',
  ZXing.BaseLuminanceSource in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.BaseLuminanceSource.pas',
  ZXing.Binarizer in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.Binarizer.pas',
  ZXing.BinaryBitmap in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.BinaryBitmap.pas',
  ZXing.GlobalHistogramBinarizer in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.GlobalHistogramBinarizer.pas',
  ZXing.HybridBinarizer in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.HybridBinarizer.pas',
  ZXing.InvertedLuminanceSource in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.InvertedLuminanceSource.pas',
  ZXing.LuminanceSource in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.LuminanceSource.pas',
  ZXing.PlanarYUVLuminanceSource in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.PlanarYUVLuminanceSource.pas',
  ZXing.RGBLuminanceSource in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Filtering\ZXing.RGBLuminanceSource.pas',
  ZXing.BarcodeFormat in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.BarcodeFormat.pas',
  ZXing.BitSource in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.BitSource.pas',
  ZXIng.ByteSegments in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXIng.ByteSegments.pas',
  ZXing.CharacterSetECI in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.CharacterSetECI.pas',
  ZXing.Common.BitArray in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.BitArray.pas',
  ZXing.Common.BitArrayImplementation in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.BitArrayImplementation.pas',
  ZXing.Common.BitMatrix in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.BitMatrix.pas',
  ZXing.Common.DetectorResult in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.DetectorResult.pas',
  ZXing.Common.GridSampler in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.GridSampler.pas',
  ZXing.Common.PerspectiveTransform in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Common.PerspectiveTransform.pas',
  ZXing.DecodeHintType in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.DecodeHintType.pas',
  ZXing.DecoderResult in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.DecoderResult.pas',
  ZXing.DefaultGridSampler in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.DefaultGridSampler.pas',
  ZXing.EncodeHintType in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.EncodeHintType.pas',
  ZXing.Helpers in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Helpers.pas',
  ZXing.MultiFormatReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.MultiFormatReader.pas',
  ZXing.Reader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.Reader.pas',
  ZXing.ReadResult in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.ReadResult.pas',
  ZXing.ResultMetadataType in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.ResultMetadataType.pas',
  ZXing.ResultPoint in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.ResultPoint.pas',
  ZXing.ResultPointImplementation in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.ResultPointImplementation.pas',
  ZXing.StringUtils in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ZXing.StringUtils.pas',
  ZXing.Common.Detector.MathUtils in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\Detector\ZXing.Common.Detector.MathUtils.pas',
  ZXing.Common.Detector.WhiteRectangleDetector in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\Detector\ZXing.Common.Detector.WhiteRectangleDetector.pas',
  ZXing.Common.ReedSolomon.GenericGF in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ReedSolomon\ZXing.Common.ReedSolomon.GenericGF.pas',
  ZXing.Common.ReedSolomon.ReedSolomonDecoder in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\Common\ReedSolomon\ZXing.Common.ReedSolomon.ReedSolomonDecoder.pas',
  ZXing.OneD.Code39Reader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.Code39Reader.pas',
  ZXing.OneD.Code93Reader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.Code93Reader.pas',
  ZXing.OneD.Code128Reader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.Code128Reader.pas',
  ZXing.OneD.EAN8Reader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.EAN8Reader.pas',
  ZXing.OneD.EAN13Reader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.EAN13Reader.pas',
  ZXing.OneD.EANManufacturerOrgSupport in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.EANManufacturerOrgSupport.pas',
  ZXing.OneD.ITFReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.ITFReader.pas',
  ZXing.OneD.OneDReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.OneDReader.pas',
  ZXing.OneD.UPCAReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCAReader.pas',
  ZXing.OneD.UPCEANExtension2Support in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtension2Support.pas',
  ZXing.OneD.UPCEANExtension5Support in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtension5Support.pas',
  ZXing.OneD.UPCEANExtensionSupport in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANExtensionSupport.pas',
  ZXing.OneD.UPCEANReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEANReader.pas',
  ZXing.OneD.UPCEReader in '..\..\..\Libraries\ZXing.Delphi\Lib\Classes\1D Barcodes\ZXing.OneD.UPCEReader.pas',
  Olf.RTL.Checksum in '..\..\..\Libraries\librairies\src\Olf.RTL.Checksum.pas',
  u_md5 in '..\..\..\Libraries\librairies\src\u_md5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

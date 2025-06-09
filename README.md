# Delphi sample projects

[Cette page en français.](LISEZMOI.md)

Set of projects demonstrating the features of the Delphi development environment, its libraries and its programming language.

Some of the projects have been presented at conferences, on training courses or online coding sessions.

The programs are up to date with the [Community Edition](https://www.embarcadero.com/products/delphi/starter) and the commercial version of [Delphi](https://www.embarcadero.com/products/delphi) or [RAD Studio](https://www.embarcadero.com/products/rad-studio).

You don't know what Delphi is and where to download it ? You'll learn more [on this web site](https://delphi-resources.developpeur-pascal.fr/).

A lot of code repositories show other Delphi project samples. Some of them are listed on [this page](OtherDelphiSampleRepositories.md). Be free to update it [with a PULL REQUEST](CONTRIBUTING.md) or by [filling an issue](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

## Talks and conferences

### Twitch

Follow my development streams of software, video games, mobile applications and websites on [my Twitch channel](https://www.twitch.tv/patrickpremartin) or as replays on [Serial Streameur](https://serialstreameur.fr) mostly in French.

## Source code installation

To download this code repository, we recommend using "git", but you can also download a ZIP file directly from [its GitHub repository](https://github.com/DeveloppeurPascal/Delphi-samples).

This project uses dependencies in the form of sub-modules. They will be absent from the ZIP file. You'll have to download them by hand.

* [DeveloppeurPascal/librairies](https://github.com/DeveloppeurPascal/librairies) must be installed in the ./Libraries/librairies subfolder.
* [DeveloppeurPascal/Socket-Messaging-Library](https://github.com/DeveloppeurPascal/Socket-Messaging-Library) must be installed in the ./Libraries/Socket-Messaging-Library subfolder.
* [Spelt/ZXing.Delphi](https://github.com/Spelt/ZXing.Delphi) must be installed in the ./Libraries/ZXing.Delphi subfolder.
* [foxitsoftware/DelphiZXingQRCode](https://github.com/foxitsoftware/DelphiZXingQRCode) must be installed in the ./Libraries/DelphiZXingQRCode subfolder.

Some projects needs sample databases installed as option with Delphi samples. If you don't have them, you'll find them in menu "Tools / Manage plateforms" then tab item "other options" and "samples" to install.

The sample ClientServer-Samples\004-EnvoiPhotosParSocket uses the [Socket Messaging Library](https://github.com/DeveloppeurPascal/Socket-Messaging-Library) for the socket communication over an TCP/IP network.

The ClientServer-Samples\005-SetupAMobileAppWithQRCode example uses the [ZXing.Delphi library](https://github.com/Spelt/ZXing.Delphi) to decode a QR code and the [DelphiZXingQRCode library](https://github.com/foxitsoftware/DelphiZXingQRCode) to create a QR code.

The sample FireDAC-Samples\003-CDataRSS uses the [FireDAC RSS driver](https://cdata.com/drivers/rss/firedac/) from [CData](https://cdata.com/).
(if you use the evaluation release, compile in 64 bits, the 32 bits DLL is not available)

The sample FireDAC-Samples\004-MultiDBSample uses the [FireDAC RSS driver](https://cdata.com/drivers/rss/firedac/) from [CData](https://cdata.com/).
(if you use the evaluation release, compile in 64 bits, the 32 bits DLL is not available)

The sample IoT-Samples\002-BeaconFence uses "[Beacon Fence](https://getitnow.embarcadero.com/beaconfence/)" components from GetIt.

The sample IoT-Samples\004-Arduino-Mastermind uses "[AsyncPro for VCL](https://getitnow.embarcadero.com/AsyncPro-Sydney/)" components from GetIt and [Visuino IDE](https://www.visuino.com/) for the Arduino program.

The sample IoT-Samples\005-Joystick uses "[Radiant Shape](https://getitnow.embarcadero.com/bonus-radiant-shapes/)" components from GetIt, "[CommunicationLab](https://mitov.com/products/communicationlab)" library from [Boian Mitov](https://mitov.com/) and [Visuino IDE](https://www.visuino.com/) for the Arduino program.

The sample Web-Samples\011-UniGUI uses [UniGUI](http://www.unigui.com/).

The sample Web-Samples\012-UniGUI-Database uses [UniGUI](http://www.unigui.com/).

The sample Web-Samples\013-TMSWebCore-HelloWorld uses [TMS Web Core](https://www.tmssoftware.com/site/tmswebcoreintro.asp).

The sample Web-Samples\014-TMSWebCore-DisplayJSON uses [TMS Web Core](https://www.tmssoftware.com/site/tmswebcoreintro.asp).

## Documentation and support

I use comments in [XMLDOC](https://docwiki.embarcadero.com/RADStudio/en/XML_Documentation_Comments) format in Delphi to document my projects. They are recognized by Help Insight, which offers real-time input help in the code editor.

I regularly use the [DocInsight](https://devjetsoftware.com/products/documentation-insight/) tool to enter them and check their formatting.

Documentation is exported in HTML by [DocInsight](https://devjetsoftware.com/products/documentation-insight/) or [PasDoc](https://pasdoc.github.io) to the /docs folder of the repository. You can also [access it online](https://developpeurpascal.github.io/Delphi-samples) through the hosting offered by GitHub Pages.

Further information (tutorials, articles, videos, FAQ, talks and links) can be found on [the project website](https://samples.developpeur-pascal.fr) or [the project devlog](https://developpeur-pascal.fr/exemples-et-demos.html).

If you need explanations or help in understanding or using parts of this project in yours, please [contact me](https://developpeur-pascal.fr/nous-contacter.php). I can either direct you to an online resource, or offer you assistance in the form of a paid or free service, depending on the case. You can also contact me at a conference or during an online presentation.

## Compatibility

As an [Embarcadero MVP](https://www.embarcadero.com/resources/partners/mvp-directory), I benefit from the latest versions of [Delphi](https://www.embarcadero.com/products/delphi) and [C++ Builder](https://www.embarcadero.com/products/cbuilder) in [RAD Studio](https://www.embarcadero.com/products/rad-studio) as soon as they are released. I therefore work with these versions.

Normally, my libraries and components should also run on at least the current version of [Delphi Community Edition](https://www.embarcadero.com/products/delphi/starter).

There's no guarantee of compatibility with earlier versions, even though I try to keep my code clean and avoid using too many of the new ways of writing in it (type inference, inline var and multiline strings).

If you detect any anomalies on earlier versions, please don't hesitate to [report them](https://github.com/DeveloppeurPascal/Delphi-samples/issues) so that I can test and try to correct or provide a workaround.

## License to use this code repository and its contents

This source code is distributed under the [AGPL 3.0 or later](https://choosealicense.com/licenses/agpl-3.0/) license.

You are free to use the contents of this code repository anywhere provided :
* you mention it in your projects
* distribute the modifications made to the files provided in this AGPL-licensed project (leaving the original copyright notices (author, link to this repository, license) must be supplemented by your own)
* to distribute the source code of your creations under the AGPL license.

If this license doesn't suit your needs (especially for a commercial project) I also offer [classic licenses for developers and companies](https://samples.developpeur-pascal.fr).

Some elements included in this repository may depend on third-party usage rights (images, sounds, etc.). They are not reusable in your projects unless otherwise stated.

The source codes of this code repository as well as any compiled version are provided “as is” without warranty of any kind.

## How to ask a new feature, report a bug or a security issue ?

If you want an answer from the project owner the best way to ask for a new feature or report a bug is to go to [the GitHub repository](https://github.com/DeveloppeurPascal/Delphi-samples) and [open a new issue](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

If you found a security issue please don't report it publicly before a patch is available. Explain the case by [sending a private message to the author](https://developpeur-pascal.fr/nous-contacter.php).

You also can fork the repository and contribute by submitting pull requests if you want to help. Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Support the project and its author

If you think this project is useful and want to support it, please make a donation to [its author](https://github.com/DeveloppeurPascal). It will help to maintain this project and all others.

You can use one of those services :

* [GitHub Sponsors](https://github.com/sponsors/DeveloppeurPascal)
* Ko-fi [in French](https://ko-fi.com/patrick_premartin_fr) or [in English](https://ko-fi.com/patrick_premartin_en)
* [Patreon](https://www.patreon.com/patrickpremartin)
* [Liberapay](https://liberapay.com/PatrickPremartin)

You can buy an end user license for [my softwares](https://lic.olfsoftware.fr/products.php?lng=en) and [my video games](https://lic.gamolf.fr/products.php?lng=en) or [a developer license for my libraries](https://lic.developpeur-pascal.fr/products.php?lng=en) if you use them in your projects.

I'm also available as a service provider to help you use this or other projects, such as software development, mobile applications and websites. [Contact me](https://vasur.fr/about) to discuss.

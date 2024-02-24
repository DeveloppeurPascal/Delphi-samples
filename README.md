# Delphi sample projects

[Cette page en français.](LISEZMOI.md)

Set of projects demonstrating the features of the Delphi development environment, its libraries and its programming language.

Some of the projects have been presented at conferences, on training courses or online coding sessions.

The programs are up to date with the [Community Edition](https://www.embarcadero.com/products/delphi/starter) and the commercial version of [Delphi](https://www.embarcadero.com/products/delphi) or [RAD Studio](https://www.embarcadero.com/products/rad-studio).

You don't know what Delphi is and where to download it ? You'll learn more [on this web site](https://delphi-resources.developpeur-pascal.fr/).

A lot of code repositories show other Delphi project samples. Some of them are listed on [this page](OtherDelphiSampleRepositories.md). Be free to update it [with a PULL REQUEST](CONTRIBUTING.md) or by [filling an issue](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

## Source code installation

To download this code repository, we recommend using "git", but you can also download a ZIP file directly from [its GitHub repository](https://github.com/DeveloppeurPascal/Delphi-samples).

This project uses dependencies in the form of sub-modules. They will be absent from the ZIP file. You'll have to download them by hand.

* [DeveloppeurPascal/librairies](https://github.com/DeveloppeurPascal/librairies) must be installed in the ./Libraries/librairies subfolder.
* [DeveloppeurPascal/Socket-Messaging-Library](https://github.com/DeveloppeurPascal/Socket-Messaging-Library) must be installed in the ./Libraries/Socket-Messaging-Library subfolder.

Some projects needs sample databases installed as option with Delphi samples. If you don't have them, you'll find them in menu "Tools / Manage plateforms" then tab item "other options" and "samples" to install.

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

## License to use this code repository and its contents

This source code is distributed under the [AGPL 3.0 or later license](https://choosealicense.com/licenses/agpl-3.0/).

You are generally free to use the contents of this code repository anywhere, provided that:
* you mention it in your projects
* distribute the modifications made to the files supplied in this project under the AGPL license (leaving the original copyright notices (author, link to this repository, license) which must be supplemented by your own)
* to distribute the source code of your creations under the AGPL license.

If this license doesn't suit your needs, you can purchase the right to use this project under the [Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/) or a dedicated commercial license ([contact the author](https://developpeur-pascal.fr/nous-contacter.php) to explain your needs).

These source codes are provided as is, without warranty of any kind.

Certain elements included in this repository may be subject to third-party usage rights (images, sounds, etc.). They are not reusable in your projects unless otherwise stated.

## How to ask a new feature, report a bug or a security issue ?

If you want an answer from the project owner the best way to ask for a new feature or report a bug is to go to [the GitHub repository](https://github.com/DeveloppeurPascal/Delphi-samples) and [open a new issue](https://github.com/DeveloppeurPascal/Delphi-samples/issues).

If you found a security issue please don't report it publicly before a patch is available. Explain the case by [sending a private message to the author](https://developpeur-pascal.fr/nous-contacter.php).

You also can fork the repository and contribute by submitting pull requests if you want to help. Please read the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Support the project and its author

If you think this project is useful and want to support it, please make a donation to [its author](https://github.com/DeveloppeurPascal). It will help to maintain the code and binaries.

You can use one of those services :

* [GitHub Sponsors](https://github.com/sponsors/DeveloppeurPascal)
* [Liberapay](https://liberapay.com/PatrickPremartin)
* [Patreon](https://www.patreon.com/patrickpremartin)
* [Paypal](https://www.paypal.com/paypalme/patrickpremartin)

or if you speack french you can [subscribe to Zone Abo](https://zone-abo.fr/nos-abonnements.php) on a monthly or yearly basis and get a lot of resources as videos and articles.

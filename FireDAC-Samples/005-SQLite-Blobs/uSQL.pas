﻿(* C2PP
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
  File last update : 2025-04-04T13:16:55.984+02:00
  Signature : a09d12deada55d3df0bcaa11e6776bbe5443f527
  ***************************************************************************
*)

unit uSQL;

interface

const
  CTableCreateSQL ='''
CREATE TABLE "IMyFiles" (
	"Id"	INTEGER,
	"FileName"	TEXT,
	"FileContent"	BLOB,
	PRIMARY KEY("Id")
);
''';
  CIndexCreateSQL = '''
CREATE UNIQUE INDEX "FilesByFileName" ON "IMyFiles" (
	"FileName",
	"Id"
);
''';

implementation

end.

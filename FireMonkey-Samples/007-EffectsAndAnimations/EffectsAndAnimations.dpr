﻿/// <summary>
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
/// Signature : 30198fdbf79ce553b1d9be4fcae4e27a628d9700
/// ***************************************************************************
/// </summary>

program EffectsAndAnimations;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

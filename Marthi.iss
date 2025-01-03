; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{7736F4D4-2FA2-45FA-9344-4469D3FA23A3}
AppName=Marthi - Totem
AppVerName=Marthi - Executáveis
AppPublisher=Marthi System
AppPublisherURL=
AppSupportURL=
AppUpdatesURL=
DefaultDirName=C:\Marthi
DefaultGroupName=Marthi
AllowNoIcons=true
OutputDir=..\..\Marthi\Instalador
OutputBaseFilename=Marthi
SetupIconFile=Logo\LogoReduzidaIcone.ico
Password=
Compression=lzma
SolidCompression=true
UninstallDisplayIcon=Logo\LogoReduzida.png
AppCopyright=Marthi System
EnableDirDoesntExistWarning=true
AlwaysUsePersonalGroup=true
;WizardImageFile=C:\Program Files (x86)\Inno Setup 5\WizModernImage-IS.bmp
;WizardSmallImageFile=C:\Program Files (x86)\Inno Setup 5\WizModernSmallImage-IS.bmp
;WizardImageFile=
;WizardSmallImageFile=

DisableDirPage=true
DisableFinishedPage=true
AlwaysShowComponentsList=false
DisableReadyPage=true
UsePreviousSetupType=false
UsePreviousTasks=false

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked; Languages: 
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: MarthiTotem.exe; DestDir: \Marthi\; Flags: ignoreversion overwritereadonly replacesameversion; Tasks: ; Languages: 
Source: MarthiCadastros.exe; DestDir: \Marthi\; Flags: ignoreversion overwritereadonly replacesameversion; Tasks: ; Languages: 
Source: caminhos.ini; DestDir: \Marthi\; Flags: ignoreversion overwritereadonly replacesameversion
Source: Marthi DataBase\DataBase\MARTHIDB.FDB; DestDir: \Marthi\Marthi DataBase\DataBase\; Flags: ignoreversion overwritereadonly replacesameversion
Source: Dependencias\*; DestDir: \Marthi\Dependencias\; Flags: ignoreversion overwritereadonly replacesameversion




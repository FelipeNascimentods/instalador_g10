unit funcoes;

interface

uses ShellAPI, Winapi.Windows, Vcl.Controls, Vcl.Forms, Vcl.Samples.Gauges,
  ShlObj, ComObj, Registry, ActiveX,SysUtils, IOUtils;

type
  TFuncoes = class

  private
    procedure criarBat;

    function ExecutarEEsperar(NomeArquivo : String) : Boolean;

    procedure CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
  public
    procedure configurarHD;
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas(gauge: TGauge);
    procedure criarAtalhos;


  end;

implementation

{ TInstalador }

procedure TFuncoes.configurarDB;
var
  a: string;
begin
  a := 'teste';
end;

procedure TFuncoes.configurarHD;
begin

end;

procedure TFuncoes.criarAtalhos;
var
  path : string;
begin
  for Path in TDirectory.GetFiles('C:\Users\THANDERA\Desktop\Projetos\SGC-PDV') do
  begin
    CreateShortcut(path,'','C:\Users\THANDERA\Desktop\Projetos\SGC-PDV',Copy(Path, 43, path.Length-46),'');
  end;

end;

procedure TFuncoes.CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  Directory: String;
  WFileName: WideString;
  MyReg: TRegIniFile;
begin
  MyObject  := CreateComObject(CLSID_ShellLink);
  MySLink   := MyObject as IShellLink;
  MyPFile   := MyObject as IPersistFile;

  with MySLink do
  begin
    SetArguments(Pchar(Parameters));
    SetPath(PChar(FileName));
    SetWorkingDirectory(PChar(InitialDir));
  end;

  MyReg:=TRegIniFile.Create('Software\MicroSoft\Windows\CurrentVersion\Explorer');

  Directory := MyReg.ReadString ('Shell Folders','Desktop','');
  WFileName := Directory + '\app\' + ShortcutName + '.lnk';

  MyPFile.Save(PWChar (WFileName), False);
  MyReg.Free;
end;

procedure TFuncoes.criarBat;
var
  F : TextFile;
begin
  AssignFile(F, 'C:\script.bat' );
  Rewrite(F);
  Write(F, 'REM V0.2'+ #13+
           '@echo off'+ #13+
           'cls'+ #13+
           'SET disco=0'+ #13+
           'SET particao=1'+ #13+
           'echo Testando Disco: %disco% .Partição: %particao%'+ #13+
           ':construction'+ #13+
           'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt'+ #13+
           'echo select disk %disco% > C:\scriptdisk.txt'+ #13+
           'echo select partition %particao% >> C:\scriptdisk.txt'+ #13+
           'echo shrink desired=300 minimum=300 >> C:\scriptdisk.txt'+ #13+
           'echo create partition primary size=300 >> C:\scriptdisk.txt'+ #13+
           'echo assign letter=X >> C:\scriptdisk.txt'+ #13+
           'echo format fs=ntfs label="G10DB" quick >> C:\scriptdisk.txt'+ #13+
           'echo exit >> C:\scriptdisk.txt'+ #13+
           'if not exist X:\ ('+ #13+
           ':particao'+ #13+
           'pushd C:\'+ #13+
           'diskpart /s C:\scriptdisk.txt'+ #13+
           'echo ESSE AQUI! %errorlevel%'+ #13+
           'if errorlevel == 0 ('+ #13+
           'goto okz'+ #13+
           ') else ('+ #13+
           'SET /a particao += 1'+ #13+
           'if %particao% GTR 5 goto particaoERROR'+ #13+
           'echo TESTANTO PARTICAO %particao%'+ #13+
           'goto construction'+ #13+
           ')'+ #13+
           ':particaoERROR'+ #13+
           'echo NAO FOI POSSIVEL ENCONTRAR UMA PARTICAO UTILIZAVEL NO DISCO %disco%'+ #13+
           'SET /a disco += 1'+ #13+
           'SET /a particao = 1'+ #13+
           'REM ## VERIFICA SE O DISCO JA É MAIOR QUE 3, SE FOR, NAO ENVIA PARA contruction e'+ #13+
           'REM SEGUE COM O SCRIPT. GERANDO O ARQUIVO particaoERRO E SAINDO DO PROGRAMA ##'+ #13+
           'if %disco% LEQ 3 goto construction'+ #13+
           'echo ERRO > C:\particaoERRO.txt'+ #13+
           'goto fim'+ #13+
           ':okz'+ #13+
           'echo PARTICAO CRIADA COM SUCESSO.'+ #13+
           'echo OK > C:\particaoOK.txt'+ #13+
           'goto fim'+ #13+
           ') else ('+ #13+
           'echo JA EXISTE A PARTICAO G:'+ #13+
           'echo.'+ #13+
           'echo EXISTEG > C:\particaoERROG.txt'+ #13+
           ')'+ #13+
           ':fim'+ #13+
           'echo CONCLUIDO!'+ #13+
           'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt');

  CloseFile(F);
  //if FileExists('C:\script.bat') then
    //execBat;
end;

procedure TFuncoes.instalarProgramas(gauge: TGauge);
var
  path, programa: string;
begin
  gauge.Progress := 0;
  gauge.MaxValue := 3;

  path := 'D:\INSTALADOR\G10 Sistemas [Versão 06 - 2019] - Postgres 11\setup\';

  programa := 'PgManagerFullSetup.exe';
  ExecutarEEsperar(path+programa);
  gauge.AddProgress(1);

  programa := 'AnyDesk.exe';
  ExecutarEEsperar(path+programa);
  gauge.AddProgress(1);

  programa := 'FileZilla_3.16.1_win64-setup.exe';
  ExecutarEEsperar(path+programa);
  gauge.AddProgress(1);
end;

procedure TFuncoes.moverArquivos;
var
  path : string;
  var SH:SHFILEOPSTRUCT;
begin
  for Path in TDirectory.GetFiles('C:\Users\THANDERA\Desktop\Projetos') do
    CopyFile(Pchar(path), Pchar('C:\Users\THANDERA\Desktop\Projetos\Adrian\' + Copy(Path, 36, path.Length-35)), false);

  FillChar(SH, SizeOf(SH), 0);
  SH.Wnd        := Application.Handle;
  SH.wFunc      := FO_Copy;
  SH.pFrom      := 'C:\Users\THANDERA\Desktop\Projetos\Nascimento' + #0;
  SH.pTo        := 'C:\Users\THANDERA\Desktop\Projetos\Adrian' + #0;
  SHFileOperation(SH);
end;

function TFuncoes.ExecutarEEsperar(NomeArquivo : String) : Boolean;
var
  shell: TShellExecuteInfo;
  codigoSaida: DWORD;
begin
  FillChar(shell, SizeOf(shell), 0) ;
  shell.cbSize := SizeOf(TShellExecuteInfo) ;

  with shell do
  begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpVerb := nil;
    lpFile := PChar(NomeArquivo);
    nShow := SW_SHOWNORMAL;
  end;

  if ShellExecuteEx(@shell) then
  begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(shell.hProcess, codigoSaida) ;
    until not(codigoSaida = STILL_ACTIVE);

    Result := True;
  end else
    Result := False;
end;

end.

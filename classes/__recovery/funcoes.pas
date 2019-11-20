unit funcoes;

interface

uses ShellAPI, Winapi.Windows, Vcl.Controls, Vcl.Forms, Vcl.Samples.Gauges,
  ShlObj, ComObj, Registry, ActiveX,SysUtils, IOUtils, DateUtils, daoInstalador;

type
  TFuncoes = class

  private
    daoInstalador: TDaoInstalador;
    procedure configurarPostgresql;
    procedure execConfigPostgresql;
    procedure instalarPostegresql;
    procedure criarBat;
    function ExecutarEEsperar(NomeArquivo : String) : Boolean;
    procedure CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
  public
    procedure configurarHD;
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas(gauge: TGauge);
    procedure criarAtalhos;

    function validarInstalacao(identificador, tecnico, cod: string): integer;
  end;

implementation

{ TInstalador }

uses uFrmInstalador;

procedure TFuncoes.instalarPostegresql;
var
  sCaminho, sExe: string;
begin
  try
  sCaminho := 'E:\Desenvolvimento\Componentes\INSTALADOR\G10 '+
              'Sistemas [Versão 06 - 2019] - Postgres 11\setup\SGC\Utilitarios\';

  sExe := 'postgresql-11.3-1-windows-x64.exe';

  frmInstalador.Visible := false;

  ExecutarEEsperar(sCaminho+sExe);
  except
    frmInstalador.Visible := true;
    Application.MessageBox('Não foi possível instalar o ''postgresql-11.3-1-windows-x64'' ', 'ERRO!', MB_ICONERROR + MB_OK);
  end;
  frmInstalador.Visible := true;
end;

procedure TFuncoes.configurarDB;
begin
  instalarPostegresql;
  execConfigPostgresql;
end;

procedure TFuncoes.configurarHD;
begin
  criarBat;

  if FileExists('C:\script.bat') then
  begin
    if ExecutarEEsperar('C:\script.bat') then
    begin
      DeleteFile('C:\script.bat');

      if FileExists('C:\particaoOK.txt') then
      begin
        Application.MessageBox('Partição - OK','SUCESSO!',mb_Ok+mb_IconExclamation);
        DeleteFile('C:\particaoOK.txt');
      end;

      if FileExists('C:\particaoERROG.txt') then
      begin
        Application.MessageBox('Partição - FALHA','FALHA!',mb_Ok+mb_IconExclamation);
        DeleteFile('C:\particaoERROG.txt');
      end;
    end;
  end else
    raise Exception.Create('Script não criado!');
end;

procedure TFuncoes.configurarPostgresql;
var
  bat : TextFile;
begin
  AssignFile(bat, 'E:\configPostgresql.bat');
  Rewrite(bat);
  Writeln(bat, 'set PGUSER=postgres                                          ');
  Writeln(bat, 'set PGPASSWORD=info$g10112                                   ');
  Writeln(bat, 'C:\Program Files\PostgreSQL\11\bin\pg_restore.exe --host localhost   '+
  '--port 5432 --username postgres --dbname db_sgc --verbose "E:\Desenvolvimento\Componentes\INSTALADOR\G10 Sistemas [Versão 06 - 2019] - Postgres 11\setup\db_sgc.backup"');

  CloseFile(bat);
end;

procedure TFuncoes.criarAtalhos;
var
  path : string;
begin
    CreateShortcut('C:\Users\01\Desktop\Arquivos\INSTALADOR\G10 Sistemas [Versão 06 - 2019] - Postgres 11\setup\SGC\SGC-PDV\OS.exe','','C:\Users\01\Desktop\Arquivos\INSTALADOR\G10 Sistemas [Versão 06 - 2019] - Postgres 11\setup\SGC\SGC-PDV', 'OS','');
end;

procedure TFuncoes.criarBat;
var
  F : TextFile;
begin
  AssignFile(F, 'C:\script.bat');
  Rewrite(F);
  Writeln(F, 'REM V0.2                                                                            ');
  Writeln(F, '@echo off                                                                           ');
  Writeln(F, 'cls                                                                                 ');
  Writeln(F, 'SET disco=0                                                                         ');
  Writeln(F, 'SET particao=1                                                                      ');
  Writeln(F, 'echo Testando Disco: %disco% .Partição: %particao%                                  ');
  Writeln(F, ':construction                                                                       ');
  Writeln(F, 'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt                                  ');
  Writeln(F, 'echo select disk %disco% > C:\scriptdisk.txt                                        ');
  Writeln(F, 'echo select partition %particao% >> C:\scriptdisk.txt                               ');
  Writeln(F, 'echo shrink desired=300 minimum=300 >> C:\scriptdisk.txt                            ');
  Writeln(F, 'echo create partition primary size=300 >> C:\scriptdisk.txt                         ');
  Writeln(F, 'echo assign letter=X >> C:\scriptdisk.txt                                           ');
  Writeln(F, 'echo format fs=ntfs label="G10DB" quick >> C:\scriptdisk.txt                        ');
  Writeln(F, 'echo exit >> C:\scriptdisk.txt                                                      ');
  Writeln(F, 'if not exist X:\ (                                                                  ');
  Writeln(F, ':particao                                                                           ');
  Writeln(F, 'pushd C:\                                                                           ');
  Writeln(F, 'diskpart /s C:\scriptdisk.txt > logfile.txt                                         ');
  Writeln(F, 'echo ESSE AQUI! %errorlevel%                                                        ');
  Writeln(F, 'if errorlevel == 0 (                                                                ');
  Writeln(F, 'goto okz                                                                            ');
  Writeln(F, ') else (                                                                            ');
  Writeln(F, 'SET /a particao += 1                                                                ');
  Writeln(F, 'if %particao% GTR 5 goto particaoERROR                                              ');
  Writeln(F, 'echo TESTANTO PARTICAO %particao%                                                   ');
  Writeln(F, 'goto construction                                                                   ');
  Writeln(F, ')                                                                                   ');
  Writeln(F, ':particaoERROR                                                                      ');
  Writeln(F, 'echo NAO FOI POSSIVEL ENCONTRAR UMA PARTICAO UTILIZAVEL NO DISCO %disco%            ');
  Writeln(F, 'SET /a disco += 1                                                                   ');
  Writeln(F, 'SET /a particao = 1                                                                 ');
  Writeln(F, 'REM ## VERIFICA SE O DISCO JA É MAIOR QUE 3, SE FOR, NAO ENVIA PARA contruction e   ');
  Writeln(F, 'REM SEGUE COM O SCRIPT. GERANDO O ARQUIVO particaoERRO E SAINDO DO PROGRAMA ##      ');
  Writeln(F, 'if %disco% LEQ 3 goto construction                                                  ');
  Writeln(F, 'echo ERRO > C:\particaoERRO.txt                                                     ');
  Writeln(F, 'goto fim                                                                            ');
  Writeln(F, ':okz                                                                                ');
  Writeln(F, 'echo PARTICAO CRIADA COM SUCESSO.                                                   ');
  Writeln(F, 'echo OK > C:\particaoOK.txt                                                         ');
  Writeln(F, 'goto fim                                                                            ');
  Writeln(F, ') else (                                                                            ');
  Writeln(F, 'echo JA EXISTE A PARTICAO G:                                                        ');
  Writeln(F, 'echo.                                                                               ');
  Writeln(F, 'echo EXISTEG > C:\particaoERROG.txt                                                 ');
  Writeln(F, ')                                                                                   ');
  Writeln(F, ':fim                                                                                ');
  Writeln(F, 'echo CONCLUIDO!                                                                     ');
  Write(F,   'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt                                  ');

  CloseFile(F);
end;

procedure TFuncoes.execConfigPostgresql;
begin
  try
    configurarPostgresql;

    if FileExists('E:\configPostgresql.bat') then
      ExecutarEEsperar('E:\configPostgresql.bat');
  finally
    DeleteFile('E:\configPostgresql.bat');
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
  WFileName := Directory + '\' + ShortcutName + '.lnk';

  MyPFile.Save(PWChar (WFileName), False);
  MyReg.Free;
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

function TFuncoes.validarInstalacao(identificador, tecnico, cod: string): integer;
var
  codigo: integer;
begin
  codigo := (DayOf(now)*MonthOf(now)+YearOf(now)) * StrToInt(identificador);

  try
    if not daoInstalador.getIdentificador(StrToInt(identificador)) then
      Result := 2;

    if not daoInstalador.getIdentificador(StrToInt(tecnico)) then
      Result := 3;

    if not codigo = StrToInt(cod) then
      Result := 4;

    Result := 1;
  except
    Result := 0;
  end;
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

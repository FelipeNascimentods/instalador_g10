<<<<<<< Updated upstream
ï»¿unit funcoes;

interface

uses ShellAPI, Winapi.Windows, Vcl.Controls, Vcl.Forms, Vcl.Samples.Gauges,
  ActiveX,SysUtils, IOUtils, Vcl.StdCtrls, ShlObj, ComObj, Registry, DateUtils, daoInstalador;

type
  TFuncoes = class

  private
    daoInstalador: TDaoInstalador;
    procedure configurarPostgresql;
    procedure execConfigPostgresql;
    procedure instalarPostegresql;
    procedure criarBat;
    function ExecutarEEsperar(NomeArquivo : String) : Boolean;
    function ExecutarEsperarEnviar(NomeArquivo : String; mLog: TMemo) : Boolean;
    procedure CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
  public
    procedure configurarHD(mLog:TMemo);
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas(gauge: TGauge);
    procedure criarAtalhos;

    function validarInstalacao(identificador, tecnico, cod: string):boolean;
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

  frmInstalador.Visible := False;

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

procedure TFuncoes.configurarHD(mLog:TMemo);
begin
  try
    criarBat;

    if FileExists('C:\particionaHD.bat') then
      ExecutarEsperarEnviar('C:\particionaHD.bat',mLog)

  finally
    if FileExists('C:\output.txt') then
      mLog.Lines.LoadFromFile('C:\output.txt');

    if FileExists('C:\particaoERROG.txt') then
      mLog.Lines.LoadFromFile('C:\particaoERROG.txt');

    DeleteFile('C:\particionaHD.bat');
    DeleteFile('C:\particaoOK.txt');
    DeleteFile('C:\particaoERROG.txt');
    DeleteFile('C:\output.txt');
  end
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
  bat : TextFile;
begin
  try
    AssignFile(bat, 'C:\particionaHD.bat');
    Rewrite(bat);
    Writeln(bat, '@echo off');
    Writeln(bat, 'cls');
    Writeln(bat, 'SET disco=0');
    Writeln(bat, 'SET particao=1');
    Writeln(bat, '>output.txt (');
    Writeln(bat, 'echo PARTICIONAR HD');
    Writeln(bat, ')');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo criando SCRIPT');
    Writeln(bat, ')');
    Writeln(bat, ':construction');
    Writeln(bat, 'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt');
    Writeln(bat, 'echo select disk %disco% > C:\scriptdisk.txt');
    Writeln(bat, 'echo select partition %particao% >> C:\scriptdisk.txt');
    Writeln(bat, 'echo shrink desired=300 minimum=300 >> C:\scriptdisk.txt');
    Writeln(bat, 'echo create partition primary size=300 >> C:\scriptdisk.txt');
    Writeln(bat, 'echo assign letter=X >> C:\scriptdisk.txt');
    Writeln(bat, 'echo format fs=ntfs label="G10DB" quick >> C:\scriptdisk.txt');
    Writeln(bat, 'echo exit >> C:\scriptdisk.txt');
    Writeln(bat, 'if not exist X:\ (');
    Writeln(bat, ':particao');
    Writeln(bat, 'pushd C:\');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo testando SCRIPT na particao: %particao%');
    Writeln(bat, ')');
    Writeln(bat, 'diskpart /s C:\scriptdisk.txt');
    Writeln(bat, 'echo resultado: %errorlevel%');
    Writeln(bat, 'if errorlevel == 0 (');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo SCRIPT criado');
    Writeln(bat, 'echo SCRIPT executado!');
    Writeln(bat, ')');
    Writeln(bat, 'goto okz');
    Writeln(bat, ') else (');
    Writeln(bat, 'SET /a particao += 1');
    Writeln(bat, 'if %particao% GTR 5 goto particaoERROR');
    Writeln(bat, 'goto construction');
    Writeln(bat, ')');
    Writeln(bat, ':particaoERROR');
    Writeln(bat, 'echo NAO FOI POSSIVEL ENCONTRAR UMA PARTICAO UTILIZAVEL NO DISCO %disco%');
    Writeln(bat, 'SET /a disco += 1');
    Writeln(bat, 'SET /a particao = 1');
    Writeln(bat, 'REM ## VERIFICA SE O DISCO JA É MAIOR QUE 3, SE FOR, NAO ENVIA PARA contruction e');
    Writeln(bat, 'REM SEGUE COM O SCRIPT. GERANDO O ARQUIVO particaoERRO E SAINDO DO PROGRAMA ##');
    Writeln(bat, 'if %disco% LEQ 3 goto construction');
    Writeln(bat, 'echo ERRO > C:\particaoERRO.txt');
    Writeln(bat, 'goto fim');
    Writeln(bat, ':okz');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo SUCESSO: Partição criada!');
    Writeln(bat, ')');
    Writeln(bat, 'echo OK > C:\particaoOK.txt');
    Writeln(bat, 'goto fim');
    Writeln(bat, ') else (');
    Writeln(bat, 'echo FALHA: Há partição com a letra G > C:\particaoERROG.txt');
    Writeln(bat, ')');
    Writeln(bat, ':fim');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo CONCLUIDO!');
    Writeln(bat, ')');
    Write(bat,   'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt');

    CloseFile(bat);
  except
    raise Exception.Create('Script não criado!');
  end;

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

function TFuncoes.validarInstalacao(identificador, tecnico, cod: string):boolean;
var
  codigo: integer;
  ano: string;
  retorno: integer;
begin
  ano    := copy(IntToStr(YearOf(now)), 3, 2);
  codigo := ( DayOf(now)*MonthOf(now)+ StrToInt(ano) ) * StrToInt(copy(identificador, 0, 4));

  try
    //if not daoInstalador.getIdentificador(StrToInt(identificador)) then
      //raise Exception.Create('Cliente não validado');

   // if not daoInstalador.getTecnico(StrToInt(tecnico)) then
     // raise Exception.Create('Técnico não validado');}

    if not (codigo = StrToInt(cod)) then
      raise Exception.Create('Código de verificação incorreto!');

    Result := true;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := false;
    end;
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

function TFuncoes.ExecutarEsperarEnviar(NomeArquivo : String; mLog : TMemo) : Boolean;
var
  shell: TShellExecuteInfo;
  codigoSaida: DWORD;
begin
  FillChar(shell, SizeOf(shell), 0) ;
  shell.cbSize := SizeOf(TShellExecuteInfo) ;

  with shell do
  begin
    fMask  := SEE_MASK_NOCLOSEPROCESS;
    Wnd    := Application.Handle;
    lpVerb := nil;
    lpFile := PChar(NomeArquivo);
    nShow  := SW_SHOWNORMAL;
  end;

  if ShellExecuteEx(@shell) then
  begin
    repeat
      if FileExists('C:\output.txt') then
      begin
        Sleep(500);
        mLog.Lines.LoadFromFile('C:\output.txt');
      end;

      Application.ProcessMessages;
      GetExitCodeProcess(shell.hProcess, codigoSaida);
    until not(codigoSaida = STILL_ACTIVE);

    Result := True;
  end
  else
    Result := False;
end;

end.
=======
ï»¿unit funcoes;

interface

uses ShellAPI, Winapi.Windows, Vcl.Controls, Vcl.Forms, Vcl.Samples.Gauges,
  ActiveX,SysUtils, IOUtils, Vcl.StdCtrls, ShlObj, ComObj, Registry, DateUtils, daoInstalador, extctrls;

type
  TFuncoes = class

  private
    dao: TDaoInstalador;

    procedure configurarPostgresql;
    procedure execConfigPostgresql;
    procedure instalarPostegresql;
    procedure criarBat;
    function ExecutarEEsperar(NomeArquivo : String) : Boolean;
    function ExecutarEsperarEnviar(NomeArquivo : String; mLog: TMemo) : Boolean;
    procedure CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
  public
    constructor Create;
    destructor Destroy; Override;

    function configurarHD(memo:TMemo) : boolean;
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas(gauge: TGauge);
    procedure criarAtalhos;

    function validarInstalacao(identificador, tecnico, cod: string): Integer;
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
                'Sistemas [VersÃ£o 06 - 2019] - Postgres 11\setup\SGC\Utilitarios\';

    sExe := 'postgresql-11.3-1-windows-x64.exe';

    frmInstalador.Visible := False;

    ExecutarEEsperar(sCaminho+sExe);
  except
    frmInstalador.Visible := true;
    Application.MessageBox('NÃ£o foi possÃ­vel instalar o ''postgresql-11.3-1-windows-x64'' ', 'ERRO!', MB_ICONERROR + MB_OK);
  end;
  frmInstalador.Visible := true;
end;

procedure TFuncoes.configurarDB;
begin
  instalarPostegresql;
  execConfigPostgresql;
end;

function TFuncoes.configurarHD(memo:TMemo) : boolean;
begin
  try
    criarBat;

    if FileExists('C:\particionaHD.bat') then
      if not ExecutarEsperarEnviar('C:\particionaHD.bat',memo) then
        raise Exception.Create('Script nÃ£o executado!')

  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'AtenÃ§Ã£o', MB_ICONINFORMATION + MB_OK);
      Result := false;
    end;

  end;

  if FileExists('C:\particaoERROG.txt') then
    memo.Lines.LoadFromFile('C:\particaoERROG.txt');

  if FileExists('C:\output.txt') then
    memo.Lines.LoadFromFile('C:\output.txt');

  DeleteFile('C:\particionaHD.bat');
  DeleteFile('C:\particaoOK.txt');
  DeleteFile('C:\particaoERROG.txt');
  DeleteFile('C:\output.txt');

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
  '--port 5432 --username postgres --dbname db_sgc --verbose "E:\Desenvolvimento\Componentes\INSTALADOR\G10 Sistemas [VersÃ£o 06 - 2019] - Postgres 11\setup\db_sgc.backup"');

  CloseFile(bat);
end;

procedure TFuncoes.criarAtalhos;
var
  path : string;
begin
    CreateShortcut('C:\Users\01\Desktop\Arquivos\INSTALADOR\G10 Sistemas [VersÃ£o 06 - 2019] - Postgres 11\setup\SGC\SGC-PDV\OS.exe','','C:\Users\01\Desktop\Arquivos\INSTALADOR\G10 Sistemas [VersÃ£o 06 - 2019] - Postgres 11\setup\SGC\SGC-PDV', 'OS','');
end;

procedure TFuncoes.criarBat;
var
  bat : TextFile;
begin
  try
    AssignFile(bat, 'C:\particionaHD.bat');
    Rewrite(bat);
    Writeln(bat, '@echo off');
    Writeln(bat, 'cls');
    Writeln(bat, 'SET disco=0');
    Writeln(bat, 'SET particao=1');
    Writeln(bat, '>output.txt (');
    Writeln(bat, 'echo PARTICIONAR HD');
    Writeln(bat, ')');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo criando SCRIPT');
    Writeln(bat, ')');
    Writeln(bat, ':construction');
    Writeln(bat, 'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt');
    Writeln(bat, 'echo select disk %disco% > C:\scriptdisk.txt');
    Writeln(bat, 'echo select partition %particao% >> C:\scriptdisk.txt');
    Writeln(bat, 'echo shrink desired=300 minimum=300 >> C:\scriptdisk.txt');
    Writeln(bat, 'echo create partition primary size=300 >> C:\scriptdisk.txt');
    Writeln(bat, 'echo assign letter=X >> C:\scriptdisk.txt');
    Writeln(bat, 'echo format fs=ntfs label="G10DB" quick >> C:\scriptdisk.txt');
    Writeln(bat, 'echo exit >> C:\scriptdisk.txt');
    Writeln(bat, 'if not exist X:\ (');
    Writeln(bat, ':particao');
    Writeln(bat, 'pushd C:\');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo testando SCRIPT na particao: %particao%');
    Writeln(bat, ')');
    Writeln(bat, 'diskpart /s C:\scriptdisk.txt');
    Writeln(bat, 'echo resultado: %errorlevel%');
    Writeln(bat, 'if errorlevel == 0 (');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo SCRIPT criado');
    Writeln(bat, 'echo SCRIPT executado!');
    Writeln(bat, ')');
    Writeln(bat, 'goto okz');
    Writeln(bat, ') else (');
    Writeln(bat, 'SET /a particao += 1');
    Writeln(bat, 'if %particao% GTR 5 goto particaoERROR');
    Writeln(bat, 'goto construction');
    Writeln(bat, ')');
    Writeln(bat, ':particaoERROR');
    Writeln(bat, 'echo NAO FOI POSSIVEL ENCONTRAR UMA PARTICAO UTILIZAVEL NO DISCO %disco%');
    Writeln(bat, 'SET /a disco += 1');
    Writeln(bat, 'SET /a particao = 1');
    Writeln(bat, 'REM ## VERIFICA SE O DISCO JA Ã‰ MAIOR QUE 3, SE FOR, NAO ENVIA PARA contruction e');
    Writeln(bat, 'REM SEGUE COM O SCRIPT. GERANDO O ARQUIVO particaoERRO E SAINDO DO PROGRAMA ##');
    Writeln(bat, 'if %disco% LEQ 3 goto construction');
    Writeln(bat, 'echo ERRO > C:\particaoERRO.txt');
    Writeln(bat, 'goto fim');
    Writeln(bat, ':okz');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo SUCESSO: PartiÃ§Ã£o criada!');
    Writeln(bat, ')');
    Writeln(bat, 'echo OK > C:\particaoOK.txt');
    Writeln(bat, 'goto fim');
    Writeln(bat, ') else (');
    Writeln(bat, 'echo FALHA: HÃ¡ partiÃ§Ã£o com a letra G > C:\particaoERROG.txt');
    Writeln(bat, ')');
    Writeln(bat, ':fim');
    Writeln(bat, '>>output.txt (');
    Writeln(bat, 'echo CONCLUIDO!');
    Writeln(bat, ')');
    Write(bat,   'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt');

    CloseFile(bat);
  except
    raise Exception.Create('Script nÃ£o criado!');
  end;
end;

destructor TFuncoes.Destroy;
begin
  dao.Free;
  inherited;
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

constructor TFuncoes.Create;
begin
  dao := TDaoInstalador.Create;
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

  path := 'D:\INSTALADOR\G10 Sistemas [VersÃ£o 06 - 2019] - Postgres 11\setup\';

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

function TFuncoes.validarInstalacao(identificador, tecnico, cod: string):Integer;
var
  codigo: integer;
  ano: string;
  retorno: integer;
begin
  retorno := -1;

  ano    := copy(IntToStr(YearOf(now)), 3, 2);
  codigo := (DayOf(now)*MonthOf(now)+ StrToInt(ano)) * StrToInt(copy(identificador, 0, 4));

  try
    if not dao.getIdentificador(identificador) then
    begin
      retorno := 1;
      raise Exception.Create('Cliente nÃ£o validado');
    end;

    if not dao.getIdentificador(tecnico) then
    begin
      retorno:= 2;
      raise Exception.Create('TÃ©cnico nÃ£o validado');
    end;

    if not (codigo = StrToInt(cod)) then
    begin
      retorno := 3;
      raise Exception.Create('CÃ³digo de verificaÃ§Ã£o incorreto!');
    end;
    Result := 0;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'AtenÃ§Ã£o', MB_ICONINFORMATION + MB_OK);
      Result := retorno;
    end;
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

function TFuncoes.ExecutarEsperarEnviar(NomeArquivo : String; mLog : TMemo) : Boolean;
var
  shell: TShellExecuteInfo;
  codigoSaida: DWORD;
begin
  FillChar(shell, SizeOf(shell), 0) ;
  shell.cbSize := SizeOf(TShellExecuteInfo) ;

  with shell do
  begin
    fMask  := SEE_MASK_NOCLOSEPROCESS;
    Wnd    := Application.Handle;
    lpVerb := nil;
    lpFile := PChar(NomeArquivo);
    nShow  := SW_HIDE;
  end;

  if ShellExecuteEx(@shell) then
  begin
    repeat
      if FileExists('C:\output.txt') then
      begin
        mLog.Lines.LoadFromFile('C:\output.txt');
      end;
      Application.ProcessMessages;
      GetExitCodeProcess(shell.hProcess, codigoSaida);
    until not(codigoSaida = STILL_ACTIVE);

    Result := True;
  end
  else
    Result := False;
end;

end.
>>>>>>> Stashed changes

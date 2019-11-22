unit funcoes;

interface

uses ShellAPI, Winapi.Windows, Vcl.Controls, Vcl.Forms, Vcl.Samples.Gauges,
  ActiveX,SysUtils, IOUtils, Vcl.StdCtrls, ShlObj, ComObj, Registry, DateUtils, daoInstalador,
  Vcl.Grids;

type
  TFuncoes = class

  private
    dao: TDaoInstalador;
    diretorio: string;

    procedure configurarPostgresql;
    procedure execConfigPostgresql;
    procedure instalarPostegresql;
    function criarBat : Boolean;
    function ExecutarEEsperar(NomeArquivo : String) : Boolean;
    procedure CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
  public
    constructor Create;
    destructor Destroy; Override;

    function configurarHD(memo:TMemo ; gauge:TGauge) : boolean;
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas(gauge: TGauge; memo: TMemo);
    procedure criarAtalhos;

    function validarInstalacao(identificador, tecnico, cod: string): Integer;
  end;

implementation

{ TInstalador }

uses uFrmInstalador;

procedure TFuncoes.instalarPostegresql;
begin
  try
    frmInstalador.Visible := False;

    ExecutarEEsperar(diretorio + 'programas\postgres.exe');
  except
    frmInstalador.Visible := true;
    Application.MessageBox('Não foi possível instalar o ''postgres'' ', 'ERRO!', MB_ICONERROR + MB_OK);
  end;
  frmInstalador.Visible := true;
end;

procedure TFuncoes.configurarDB;
begin
  instalarPostegresql;
  execConfigPostgresql;
end;

function TFuncoes.configurarHD(memo:TMemo ; gauge:TGauge) : boolean;
begin
  try
    gauge.Progress := 0;
    gauge.MaxValue := 3;

    memo.Lines.Add('-- Criando Partição G:\ --');

    if criarBat then
      gauge.AddProgress(1);

    if FileExists('C:\particionaHD.bat') then
    begin
      if ExecutarEEsperar('C:\particionaHD.bat') then
        gauge.AddProgress(1)
      else
        raise Exception.Create('Script não executado!')
    end;

    Result := True;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
    end;
  end;

  if FileExists('C:\particaoOK.txt') then
    memo.Lines.Add('Partição criada!');

  if FileExists('C:\particaoERRO.txt') then
    memo.Lines.Add('Já existe partição G:\ ou o disco é maior que 3!');

  memo.Lines.Add('Deletando arquivos');
  DeleteFile('C:\particionaHD.bat');
  DeleteFile('C:\particaoOK.txt');
  DeleteFile('C:\particaoERRO.txt');
  DeleteFile('C:\output.txt');
  memo.Lines.Add('Arquivos deletados com sucesso!');
  memo.Lines.Add('');

  gauge.AddProgress(1);
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
begin
    CreateShortcut('C:\Users\01\Desktop\Arquivos\INSTALADOR\G10 Sistemas [Versão 06 - 2019] - Postgres 11\setup\SGC\SGC-PDV\OS.exe','','C:\Users\01\Desktop\Arquivos\INSTALADOR\G10 Sistemas [Versão 06 - 2019] - Postgres 11\setup\SGC\SGC-PDV', 'OS','');
end;

function TFuncoes.criarBat : Boolean;
var
  bat : TextFile;
begin
  try
    AssignFile(bat, 'C:\particionaHD.bat');
    Rewrite(bat);
    Writeln(bat, '@echo off                                                                         ');
    Writeln(bat, 'cls                                                                               ');
    Writeln(bat, 'SET disco=0                                                                       ');
    Writeln(bat, 'SET particao=1                                                                    ');
    Writeln(bat, ':construction                                                                     ');
    Writeln(bat, 'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt                                ');
    Writeln(bat, 'echo select disk %disco% > C:\scriptdisk.txt                                      ');
    Writeln(bat, 'echo select partition %particao% >> C:\scriptdisk.txt                             ');
    Writeln(bat, 'echo shrink desired=300 minimum=300 >> C:\scriptdisk.txt                          ');
    Writeln(bat, 'echo create partition primary size=300 >> C:\scriptdisk.txt                       ');
    Writeln(bat, 'echo assign letter=X >> C:\scriptdisk.txt                                         ');
    Writeln(bat, 'echo format fs=ntfs label="G10DB" quick >> C:\scriptdisk.txt                      ');
    Writeln(bat, 'echo exit >> C:\scriptdisk.txt                                                    ');
    Writeln(bat, 'if not exist X:\ (                                                                ');
    Writeln(bat, ':particao                                                                         ');
    Writeln(bat, 'pushd C:\                                                                         ');
    Writeln(bat, '>>output.txt (                                                                    ');
    Writeln(bat, 'echo testando SCRIPT na particao: %particao%                                      ');
    Writeln(bat, ')                                                                                 ');
    Writeln(bat, 'diskpart /s C:\scriptdisk.txt                                                     ');
    Writeln(bat, 'echo resultado: %errorlevel%                                                      ');
    Writeln(bat, 'if errorlevel == 0 (                                                              ');
    Writeln(bat, '>>output.txt (                                                                    ');
    Writeln(bat, 'echo SCRIPT criado                                                                ');
    Writeln(bat, 'echo SCRIPT executado!                                                            ');
    Writeln(bat, ')                                                                                 ');
    Writeln(bat, 'goto okz                                                                          ');
    Writeln(bat, ') else (                                                                          ');
    Writeln(bat, 'SET /a particao += 1                                                              ');
    Writeln(bat, 'if %particao% GTR 5 goto particaoERROR                                            ');
    Writeln(bat, 'goto construction                                                                 ');
    Writeln(bat, ')                                                                                 ');
    Writeln(bat, ':particaoERROR                                                                    ');
    Writeln(bat, 'echo NAO FOI POSSIVEL ENCONTRAR UMA PARTICAO UTILIZAVEL NO DISCO %disco%          ');
    Writeln(bat, 'SET /a disco += 1                                                                 ');
    Writeln(bat, 'SET /a particao = 1                                                               ');
    Writeln(bat, 'REM ## VERIFICA SE O DISCO JA É MAIOR QUE 3, SE FOR, NAO ENVIA PARA contruction e ');
    Writeln(bat, 'REM SEGUE COM O SCRIPT. GERANDO O ARQUIVO particaoERRO E SAINDO DO PROGRAMA ##    ');
    Writeln(bat, 'if %disco% LEQ 3 goto construction                                                ');
    Writeln(bat, 'echo Disco maior do que 3! > C:\particaoERRO.txt                                  ');
    Writeln(bat, 'goto fim                                                                          ');
    Writeln(bat, ':okz                                                                              ');
    Writeln(bat, '>>output.txt (                                                                    ');
    Writeln(bat, 'echo SUCESSO: Partição criada!                                                    ');
    Writeln(bat, ')                                                                                 ');
    Writeln(bat, 'echo OK > C:\particaoOK.txt                                                       ');
    Writeln(bat, 'goto fim                                                                          ');
    Writeln(bat, ') else (                                                                          ');
    Writeln(bat, 'echo FALHA: Existe particao G:\ > C:\particaoERRO.txt                             ');
    Writeln(bat, ')                                                                                 ');
    Writeln(bat, ':fim                                                                              ');
    Writeln(bat, '>>output.txt (                                                                    ');
    Writeln(bat, 'echo CONCLUIDO!                                                                   ');
    Writeln(bat, ')                                                                                 ');
    Write(bat,   'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt                                ');

    CloseFile(bat);
    Result := True;
  except
    Result := False;
    raise Exception.Create('Script não criado!');
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
  diretorio := Copy(ExtractFileDir(Application.ExeName), 1, Pos('\Win32', ExtractFileDir(Application.ExeName)));
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

procedure TFuncoes.instalarProgramas(gauge: TGauge; memo: TMemo);
begin
  gauge.Progress := 0;
  gauge.MaxValue := 5;

  memo.Lines.Add('-- Instalando Programas de Terceiros --');

  memo.Lines.Add('Instalando pgManager');
  ExecutarEEsperar(diretorio + 'programas\pgManager.msi');
  gauge.AddProgress(1);

  memo.Lines.Add('Instalando AnyDesk');
  ExecutarEEsperar(diretorio + 'programas\anyDesk.exe');
  gauge.AddProgress(1);

  memo.Lines.Add('Instalando FileZilla');
  ExecutarEEsperar(diretorio + 'programas\fileZilla.exe');
  gauge.AddProgress(1);

  memo.Lines.Add('Instalando TeamView');
  ExecutarEEsperar(diretorio + 'programas\teamView.exe');
  gauge.AddProgress(1);

  memo.Lines.Add('Instalando WinRar');
  ExecutarEEsperar(diretorio + 'programas\winRar.exe');
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
      raise Exception.Create('Cliente não validado');
    end;

    if not dao.getIdentificador(tecnico) then
    begin
      retorno:= 2;
      raise Exception.Create('Técnico não validado');
    end;

    if not (codigo = StrToInt(cod)) then
    begin
      retorno := 3;
      raise Exception.Create('Código de verificação incorreto!');
    end;
    Result := 0;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONINFORMATION + MB_OK);
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

end.

unit funcoes;

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
    function ExecutarEsperarEnviar(NomeArquivo : String; memo: TMemo) : Boolean;
    procedure CreateShortcut(FileName, Parameters, InitialDir, ShortcutName, ShortcutFolder : String);
  public
    procedure configurarHD(memo:TMemo);
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

procedure TFuncoes.configurarHD(memo:TMemo);
begin
  criarBat;

  if FileExists('C:\script.bat') then
  begin
    if ExecutarEsperarEnviar('C:\script.bat',memo) then
    begin
      DeleteFile('C:\script.bat');

      if FileExists('C:\particaoOK.txt') then
      begin
        DeleteFile('C:\particaoOK.txt');
        DeleteFile('C:\output.txt');
      end;

      if FileExists('C:\particaoERROG.txt') then
      begin
        Application.MessageBox('Partição - FALHA','FALHA!',mb_Ok+mb_IconExclamation);
        DeleteFile('C:\particaoERROG.txt');
        DeleteFile('C:\output.txt');
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

  Writeln(F, '@echo off                                                                             ');
  Writeln(F, 'echo PARTICIONAR HD > output.txt                                                     ');
  Writeln(F, 'cls                                                                                   ');
  Writeln(F, 'SET disco=0                                                                           ');
  Writeln(F, 'SET particao=1                                                                        ');
  Writeln(F, '                                                                                      ');
  Writeln(F, 'echo criando SCRIPT >> output.txt                                                     ');
  Writeln(F, '                                                                                      ');
  Writeln(F, ':construction                                                                         ');
  Writeln(F, 'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt                                    ');
  Writeln(F, 'echo select disk %disco% > C:\scriptdisk.txt                                          ');
  Writeln(F, 'echo select partition %particao% >> C:\scriptdisk.txt                                 ');
  Writeln(F, 'echo shrink desired=300 minimum=300 >> C:\scriptdisk.txt                              ');
  Writeln(F, 'echo create partition primary size=300 >> C:\scriptdisk.txt                           ');
  Writeln(F, 'echo assign letter=X >> C:\scriptdisk.txt                                             ');
  Writeln(F, 'echo format fs=ntfs label="G10DB" quick >> C:\scriptdisk.txt                          ');
  Writeln(F, 'echo exit >> C:\scriptdisk.txt                                                        ');
  Writeln(F, '                                                                                      ');
  Writeln(F, 'if not exist X:\ (                                                                    ');
  Writeln(F, ':particao                                                                             ');
  Writeln(F, 'pushd C:\                                                                             ');
  Writeln(F, '                                                                                      ');
  Writeln(F, 'echo testando SCRIPT na particao: %particao% >> output.txt                            ');
  Writeln(F, '                                                                                      ');
  Writeln(F, 'diskpart /s C:\scriptdisk.txt                                                         ');
  Writeln(F, 'echo resultado: %errorlevel%                                                          ');
  Writeln(F, 'if errorlevel == 0 (                                                                  ');
  Writeln(F, 'echo SCRIPT criado >> output.txt                                                      ');
  Writeln(F, 'echo SCRIPT executado! >> output.txt                                                  ');
  Writeln(F, 'goto okz                                                                              ');
  Writeln(F, '                                                                                      ');
  Writeln(F, ') else (                                                                              ');
  Writeln(F, 'SET /a particao += 1                                                                  ');
  Writeln(F, 'if %particao% GTR 5 goto particaoERROR                                                ');
  Writeln(F, 'goto construction                                                                     ');
  Writeln(F, ')                                                                                     ');
  Writeln(F, '                                                                                      ');
  Writeln(F, 'echo SCRIPT criado >> output.txt                                                      ');
  Writeln(F, '                                                                                      ');
  Writeln(F, ':particaoERROR                                                                        ');
  Writeln(F, 'echo NAO FOI POSSIVEL ENCONTRAR UMA PARTICAO UTILIZAVEL NO DISCO %disco%              ');
  Writeln(F, 'SET /a disco += 1                                                                     ');
  Writeln(F, 'SET /a particao = 1                                                                   ');
  Writeln(F, 'REM ## VERIFICA SE O DISCO JA É MAIOR QUE 3, SE FOR, NAO ENVIA PARA contruction e     ');
  Writeln(F, 'REM SEGUE COM O SCRIPT. GERANDO O ARQUIVO particaoERRO E SAINDO DO PROGRAMA ##        ');
  Writeln(F, 'if %disco% LEQ 3 goto construction                                                    ');
  Writeln(F, 'echo ERRO > C:\particaoERRO.txt                                                       ');
  Writeln(F, 'goto fim                                                                              ');
  Writeln(F, ':okz                                                                                  ');
  Writeln(F, 'echo Particao criada com SUCESSO! >> output.txt                                       ');
  Writeln(F, 'echo OK > C:\particaoOK.txt                                                           ');
  Writeln(F, 'goto fim                                                                              ');
  Writeln(F, ') else (                                                                              ');
  Writeln(F, 'echo Ja existe a particao G: >> output.txt                                            ');
  Writeln(F, 'echo.                                                                                 ');
  Writeln(F, 'echo EXISTEG > C:\particaoERROG.txt                                                   ');
  Writeln(F, ')                                                                                     ');
  Writeln(F, ':fim                                                                                  ');
  Writeln(F, 'echo CONCLUIDO!                                                                       ');
  Write(F,   'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt                                    ');

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

function TFuncoes.ExecutarEsperarEnviar(NomeArquivo : String; memo : TMemo) : Boolean;
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
      {if FileExists('C:\output.txt') then
      begin
        Sleep(1000);
        memo.Lines.LoadFromFile('C:\output.txt');
      end;  }
      Application.ProcessMessages;
      GetExitCodeProcess(shell.hProcess, codigoSaida);
    until not(codigoSaida = STILL_ACTIVE);

    Result := True;
  end
  else
    Result := False;
end;

end.

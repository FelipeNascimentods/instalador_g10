unit funcoes;

interface

uses ShellAPI, Winapi.Windows, Vcl.Controls, Vcl.Forms, Vcl.Samples.Gauges;

type
  TFuncoes = class

  private
    function ExecutarEEsperar(NomeArquivo : String) : Boolean;
  public
    procedure configurarHD;
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas(gauge: TGauge);
    procedure criarAtalhos;
    procedure criarBat;
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
begin
  //ok
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
  Writeln(F, 'diskpart /s C:\scriptdisk.txt                                                       ');
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
  Write(F,   'if exist C:\scriptdisk.txt erase C:\scriptdisk.txt                                    ');

  CloseFile(F);
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
begin

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

unit funcoes;

interface

uses ShellAPI, Winapi.Windows, Vcl.Controls, Vcl.Forms, Vcl.Samples.Gauges;

type
  TFuncoes = class

  private
    procedure criarBat;
    function ExecutarEEsperar(NomeArquivo : String) : Boolean;
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
begin
  //ok
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
           'echo Testando Disco: %disco% .Parti��o: %particao%'+ #13+
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
           'REM ## VERIFICA SE O DISCO JA � MAIOR QUE 3, SE FOR, NAO ENVIA PARA contruction e'+ #13+
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

  path := 'D:\INSTALADOR\G10 Sistemas [Vers�o 06 - 2019] - Postgres 11\setup\';

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
var Sh: TShellExecuteInfo;
  CodigoSaida: DWORD;
begin
  FillChar(Sh, SizeOf(Sh), 0) ;
  Sh.cbSize := SizeOf(TShellExecuteInfo) ;
  with Sh do
    begin
      fMask := SEE_MASK_NOCLOSEPROCESS;
      Wnd := Application.Handle;
      lpVerb := nil;
      lpFile := PChar(NomeArquivo);
      nShow := SW_SHOWNORMAL;
    end;
    if ShellExecuteEx(@Sh) then
    begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(Sh.hProcess, CodigoSaida) ;
    until not(CodigoSaida = STILL_ACTIVE);
    Result := True;
  end
  else
  Result := False;
end;

end.

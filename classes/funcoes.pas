unit funcoes;

interface

uses ShellAPI;

type
  TFuncoes = class

  private
    procedure criarBat;
  public
    procedure configurarHD;
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas;
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

procedure TFuncoes.instalarProgramas;
begin

end;

procedure TFuncoes.moverArquivos;
begin

end;
end.

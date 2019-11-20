unit daoInstalador;

interface

uses ZAbstractRODataset, ZAbstractDataset, ZDataset, SysUtils, ZConnection, uDm;

type
  TDaoInstalador = class
  private
    ZQuery: TZQuery;
  public
    function getIdentificador(identificador: integer): boolean;
  end;

implementation

{ TDaoInstalador }

function TDaoInstalador.getIdentificador(identificador: integer): boolean;
var
  zSet: TZQuery;
  sSQL: string;
begin
  zSet := dm.zq;
  zSet.Connection := dm.zConn;

  try
    sSQL := 'select * from vw_pessoas where identificador = '''+IntToStr(identificador)+''' limit 1';

    zSet.Close;
    zSet.SQL.Clear;
    zSet.SQL.Text := sSQL;
    zSet.ExecSQL;

    if zSet.IsEmpty then
      Result := false
    else
      Result := true;
  finally
    zSet.Free;
  end;
end;

end.

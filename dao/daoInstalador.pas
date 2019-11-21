unit daoInstalador;

interface

uses DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, SysUtils,
     ZConnection, uDmPrincipal;

type
  TDaoInstalador = class
  private
    ZQuery: TZQuery;
  public
    function getIdentificador(identificador: string): boolean;
  end;

implementation

{ TDaoInstalador }

function TDaoInstalador.getIdentificador(identificador: string): boolean;
var
  zSet: TZQuery;
  sSQL: string;
begin
  zSet := TZQuery.Create(ZQuery);
  try
    zSet.Connection := dmPrincipal.ZConnection;

    sSQL := 'select * from vw_pessoas where identificador = '''+identificador+''' limit 1';

    zSet.Close;
    zSet.SQL.Clear;
    zSet.SQL.Text := sSQL;
    zSet.Open;

    if zSet.IsEmpty then
      Result := false
    else
      Result := true;
  finally
    zSet.Free;
  end;
end;

end.

unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection;

type
  TdmPrincipal = class(TDataModule)
    ZConnection: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

program instalador;

uses
  Vcl.Forms,
  uFrmInstalador in 'forms\uFrmInstalador.pas' {frmInstalador},
  funcoes in 'classes\funcoes.pas',
  uFrmValidarCliente in 'forms\uFrmValidarCliente.pas' {ValidarCliente},
  daoInstalador in 'dao\daoInstalador.pas',
  uDmPrincipal in 'forms\uDmPrincipal.pas' {dmPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmInstalador, frmInstalador);
  Application.Run;
end.

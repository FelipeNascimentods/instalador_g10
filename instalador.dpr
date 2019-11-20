program instalador;

uses
  Vcl.Forms,
  uFrmInstalador in 'forms\uFrmInstalador.pas' {frmInstalador},
  funcoes in 'classes\funcoes.pas',
  uFrmValidarCliente in 'forms\uFrmValidarCliente.pas' {ValidarCliente},
  uDm in 'forms\uDm.pas' {dm: TDataModule},
  daoInstalador in 'dao\daoInstalador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInstalador, frmInstalador);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.

program instalador;

uses
  Vcl.Forms,
  uFrmInstalador in 'forms\uFrmInstalador.pas' {frmInstalador},
  instalador in 'classes\instalador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmInstalador, frmInstalador);
  Application.Run;
end.

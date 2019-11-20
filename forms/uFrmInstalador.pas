unit uFrmInstalador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage, funcoes, shellapi,
  uFrmValidarCliente;

type
  TfrmInstalador = class(TForm)
    pnBot: TPanel;
    pnLeft: TPanel;
    pnClient: TPanel;
    imgLogo: TImage;
    lblTitulo: TLabel;
    lblTexto: TLabel;
    btnInstalar: TSpeedButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    barraDeProgresso: TGauge;
    mLog: TMemo;
    procedure btnInstalarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    funcoes: TFuncoes;
    validarCliente: TValidarCliente;
  public
    procedure instalar;
  end;

var
  frmInstalador: TfrmInstalador;

implementation

{$R *.dfm}

procedure TfrmInstalador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    funcoes.Free;
    validarCliente.Free;
  finally
    Action := caFree;
    frmInstalador := nil;
  end;
end;

procedure TfrmInstalador.FormCreate(Sender: TObject);
begin
  funcoes := TFuncoes.Create;
  validarCliente := TValidarCliente.Create(self);

  frmInstalador.Visible := false;
<<<<<<< HEAD

  validarCliente.ShowModal;
  if validarCliente.getVerificacao then
    frmInstalador.Visible := true
  else
    close;

=======
  mLog.Clear;
  validarCliente.ShowModal;

  frmInstalador.Visible := true;
>>>>>>> ef08eb211df3e5aca777b76d7a38ae9b9d5ab726
end;

procedure TfrmInstalador.instalar;
begin
<<<<<<< HEAD
  funcoes.configurarHD;
=======
  funcoes := TFuncoes.Create;
  funcoes.configurarHD(mLog);
>>>>>>> ef08eb211df3e5aca777b76d7a38ae9b9d5ab726
  //funcoes.moverArquivos;
  funcoes.configurarDB;
  funcoes.criarAtalhos;
end;

procedure TfrmInstalador.btnInstalarClick(Sender: TObject);
begin
  instalar;
end;
end.

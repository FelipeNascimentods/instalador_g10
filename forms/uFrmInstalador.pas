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
  private
    funcoes: TFuncoes;
  public
    procedure instalar;
  end;

var
  frmInstalador: TfrmInstalador;

implementation

{$R *.dfm}

procedure TfrmInstalador.FormCreate(Sender: TObject);
<<<<<<< HEAD
begin
  mLog.Clear;
=======
var
  validarCliente : TValidarCliente;
begin
  validarCliente := TValidarCliente.Create(self);
  frmInstalador.Visible := false;
  validarCliente.ShowModal;

  frmInstalador.Visible := true;

>>>>>>> 0330119e2d62ce62508887b242d6992e6e44b7cd
end;

procedure TfrmInstalador.instalar;
begin
  funcoes := TFuncoes.Create;
  funcoes.configurarHD(mLog);
  //funcoes.moverArquivos;
  funcoes.configurarDB;
  funcoes.criarAtalhos;
end;

procedure TfrmInstalador.btnInstalarClick(Sender: TObject);
begin
  instalar;
end;
end.

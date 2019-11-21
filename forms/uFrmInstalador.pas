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
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    barraDeProgresso: TGauge;
    btnInstalar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lblProgressBar: TLabel;
    Memo: TMemo;
    Image1: TImage;
    Bevel: TBevel;
    lblTitulo: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInstalarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    funcoes: TFuncoes;
    validarCliente: TfrmValidarCliente;
  public
    procedure instalar;
    procedure controleShow;
    procedure controleInstalar;
    procedure controleFinalizado;
  end;

var
  frmInstalador: TfrmInstalador;

implementation

{$R *.dfm}

procedure TfrmInstalador.controleFinalizado;
begin
  lblTitulo.Caption      := 'Instala��o Finalizada';
  lblProgressBar.Caption := 'Conclu�do';
end;

procedure TfrmInstalador.controleInstalar;
begin
  barraDeProgresso.Visible := true;
  lblProgressBar.Visible   := true;
  btnInstalar.Enabled      := false;
end;

procedure TfrmInstalador.controleShow;
begin
  barraDeProgresso.Visible := false;
  lblProgressBar.Visible   := false;
  pnClient.Enabled         := false;
end;

procedure TfrmInstalador.FormCreate(Sender: TObject);
var
  validarCliente : TfrmValidarCliente;
begin
  try
    funcoes.Free;
    validarCliente.Free;
  finally
    Action := caFree;
    frmInstalador := nil;
  end;
end;

procedure TfrmInstalador.FormShow(Sender: TObject);
begin
  funcoes := TFuncoes.Create;
  validarCliente := TfrmValidarCliente.Create(self);
  validarCliente.ShowModal;

  if validarCliente.getVerificacao then
  begin
    mLog.Clear;
  end
  else
    Application.Terminate;
end;

procedure TfrmInstalador.FormShow(Sender: TObject);
begin
  controleShow;
end;

procedure TfrmInstalador.instalar;
begin
  funcoes := TFuncoes.Create;
  //funcoes.configurarHD;
  //funcoes.moverArquivos;
  //funcoes.configurarDB;
  //funcoes.criarAtalhos;
end;

procedure TfrmInstalador.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmInstalador.btnInstalarClick(Sender: TObject);
begin
  controleInstalar;
  instalar;
end;
end.

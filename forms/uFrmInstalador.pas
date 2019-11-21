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
    procedure btnInstalarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    funcoes: TFuncoes;
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
  lblTitulo.Caption      := 'Instalação Finalizada';
  lblProgressBar.Caption := 'Concluído';
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
  validarCliente : TValidarCliente;
begin
  validarCliente := TValidarCliente.Create(self);
  frmInstalador.Visible := false;
  validarCliente.ShowModal;

  frmInstalador.Visible := true;

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

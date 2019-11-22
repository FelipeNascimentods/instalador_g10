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
    barraDeProgresso: TGauge;
    btnInstalar: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblProgressBar: TLabel;
    pnClient: TPanel;
    Bevel: TBevel;
    lblTitulo: TLabel;
    Memo: TMemo;
    pnLeft: TPanel;
    Image1: TImage;
    cbxHD: TCheckBox;
    cbxBanco: TCheckBox;
    cbxArquivo: TCheckBox;
    cbxProgramas: TCheckBox;
    cbxAtalho: TCheckBox;
    procedure btnInstalarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    funcoes: TFuncoes;
    validarCliente: TfrmValidarCliente;
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
end;

procedure TfrmInstalador.FormShow(Sender: TObject);
begin
  validarCliente := TfrmValidarCliente.Create(self);
  validarCliente.ShowModal;

  if validarCliente.getVerificacao then
  begin
    Memo.Clear;
  end
  else
    Application.Terminate;
end;

procedure TfrmInstalador.instalar;
begin
  {if funcoes.configurarHD(Memo) then
    cbxHD.Checked := True;}

  funcoes.instalarProgramas(barraDeProgresso, Memo);
end;

procedure TfrmInstalador.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInstalador.btnInstalarClick(Sender: TObject);
begin
  instalar;
end;
end.

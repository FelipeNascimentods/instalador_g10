<<<<<<< Updated upstream
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
    mScript: TMemo;
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

  validarCliente.ShowModal;
  if validarCliente.getVerificacao then
  begin
    frmInstalador.Visible := true;
    mLog.Clear;
  end
  else
  Application.Terminate;
end;

procedure TfrmInstalador.instalar;
begin
  funcoes := TFuncoes.Create;
  funcoes.configurarHD(mLog);
end;

procedure TfrmInstalador.btnInstalarClick(Sender: TObject);
begin
  instalar;
end;
end.
=======
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
    Timer1: TTimer;
    procedure btnInstalarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
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

procedure TfrmInstalador.FormShow(Sender: TObject);
begin
  funcoes := TFuncoes.Create;
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
  funcoes := TFuncoes.Create;
  if funcoes.configurarHD(Memo) then
    cbxHD.Checked := True;
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
>>>>>>> Stashed changes

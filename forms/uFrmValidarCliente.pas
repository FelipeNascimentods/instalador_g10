unit uFrmValidarCliente;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  funcoes;

type
  TValidarCliente = class(TForm)
    lblCPF: TLabel;
    lblCNPJ: TLabel;
    lblCodigo: TLabel;
    gbxValidar: TGroupBox;
    pnValidarCliente: TPanel;
    imgVerificacao: TImage;
    btnValidar: TButton;
    edtCNPJ: TEdit;
    edtCodigo: TEdit;
    edtCPF: TEdit;
    procedure btnValidarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    funcoes :Tfuncoes;
    verificacao: boolean;
    { Private declarations }
  public
    { Public declarations }
    function getVerificacao: boolean;
  end;

var
  ValidarCliente: TValidarCliente;

implementation

{$R *.dfm}

procedure TValidarCliente.btnValidarClick(Sender: TObject);
begin
  try
    if edtCPF.Text = '' then
      raise Exception.Create('Informe um CPF.');

    if edtCNPJ.Text = '' then
      raise Exception.Create('Informe um CNPJ.');

    if edtCodigo.Text = '' then
      raise Exception.Create('Informe um Codigo de verifica��o.');

    if funcoes.validarInstalacao(edtCNPJ.Text, edtCPF.Text, edtCodigo.Text) then
    begin
      verificacao := true;
      close;
    end;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Aten��o', MB_ICONINFORMATION + MB_OK);
    end;
  end;

end;

procedure TValidarCliente.FormCreate(Sender: TObject);
begin
  funcoes := TFuncoes.Create;
  verificacao := false;
end;

function TValidarCliente.getVerificacao: boolean;
begin
  result := verificacao;
end;

end.
 

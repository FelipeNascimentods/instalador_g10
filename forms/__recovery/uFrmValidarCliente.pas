unit uFrmValidarCliente;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  funcoes;

type
  TValidarCliente = class(TForm)
    lblCPF: TLabel;
    edtCPF: TEdit;
    edtCNPJ: TEdit;
    lblCNPJ: TLabel;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    gbxValidar: TGroupBox;
    pnValidarCliente: TPanel;
    imgVerificacao: TImage;
    btnValidar: TButton;
    procedure btnValidarClick(Sender: TObject);
  private
    { Private declarations }
    funcoes: TFuncoes;
  public
    { Public declarations }
  end;

var
  ValidarCliente: TValidarCliente;

implementation

{$R *.dfm}

procedure TValidarCliente.btnValidarClick(Sender: TObject);
begin
  //imgVerificacao.Picture.LoadFromFile('D:\Unidade G10\img\7835_64x64.png');


  case funcoes.validarInstalacao(edtCNPJ.Text, edtCPF.Text, edtCodigo.Text) of
    0: ;
    1: ;
    2: ;
    3: ;
  end;
end;

end.
 

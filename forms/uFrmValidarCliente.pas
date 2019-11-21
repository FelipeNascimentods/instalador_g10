unit uFrmValidarCliente;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TValidarCliente = class(TForm)
    lblCPF: TLabel;
    Password: TEdit;
    edtCNPJ: TEdit;
    lblCNPJ: TLabel;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    gbxValidar: TGroupBox;
    pnValidarCliente: TPanel;
    imgVerificacao: TImage;
    btnValidar: TButton;
    btnCancelar: TButton;
    procedure btnValidarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValidarCliente: TValidarCliente;

implementation

{$R *.dfm}

procedure TValidarCliente.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TValidarCliente.btnValidarClick(Sender: TObject);
begin
    imgVerificacao.Picture.LoadFromFile('D:\Unidade G10\img\7835_64x64.png');
end;

end.
 

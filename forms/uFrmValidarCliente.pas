unit uFrmValidarCliente;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  funcoes, MaskUtils;

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
    procedure edtCPFExit(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edtCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    funcoes :Tfuncoes;
    verificacao: boolean;

    function deleteCaracter(texto : string): string;
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
    begin
      edtCPF.SetFocus;
      raise Exception.Create('Informe um CPF.');
    end;

    if edtCNPJ.Text = '' then
    begin
      edtCNPJ.SetFocus;
      raise Exception.Create('Informe um CNPJ.');
    end;

    if edtCodigo.Text = '' then
    begin
      edtCodigo.SetFocus;
      raise Exception.Create('Informe um Codigo de verificação.');
    end;

    case funcoes.validarInstalacao(deleteCaracter(edtCNPJ.Text), deleteCaracter(edtCPF.Text), edtCodigo.Text) of
    0 :
      begin
        verificacao := true;
        close;
      end;
    1 : edtCNPJ.SetFocus;
    2 : edtCPF.SetFocus;
    3 : edtCodigo.SetFocus;
    end;

  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONINFORMATION + MB_OK);
    end;
  end;

end;

function TValidarCliente.deleteCaracter(texto: string): string;
begin
  Delete(texto, ansipos('.',texto),1);
  Delete(texto, ansipos('.',texto),1);
  Delete(texto, ansipos('-',texto),1);
  Delete(texto, ansipos('/',texto),1);
  result := texto;
end;

procedure TValidarCliente.edtCNPJExit(Sender: TObject);
begin
  if (edtCNPJ.Text <> '') and (length(edtCNPJ.Text) >= 14) then
  begin
    edtCNPJ.Text := deleteCaracter(edtCNPJ.Text);
    edtCNPJ.Text := FormatMaskText('00\.000\.000\/0000\-00;0;', edtCNPJ.Text);
  end;
end;

procedure TValidarCliente.edtCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Abort;

  if key <> #8 then
  begin
    if Length(edtCNPJ.Text) = 2 then
    begin
      edtCNPJ.Text := edtCNPJ.Text + '.';
      edtCNPJ.Selstart := Length(edtCNPJ.Text);
    end;

    if Length(edtCNPJ.Text) = 6 then
    begin
      edtCNPJ.Text := edtCNPJ.Text + '.';
      edtCNPJ.Selstart := Length(edtCNPJ.Text);
    end;

    if Length(edtCNPJ.Text) = 10 then
    begin
      edtCNPJ.Text := edtCNPJ.Text + '/';
      edtCNPJ.Selstart := Length(edtCNPJ.text);
    end;

    if Length(edtCNPJ.Text) = 15 then
    begin
      edtCNPJ.Text := edtCNPJ.Text + '-';
      edtCNPJ.Selstart := Length(edtCNPJ.text);
    end;
  end;
end;

procedure TValidarCliente.edtCPFExit(Sender: TObject);
begin
  if (edtCPF.Text <> '') and (length(edtCPF.Text) >= 11) then
  begin
    edtCPF.Text := deleteCaracter(edtCPF.Text);
    edtCPF.Text := FormatmaskText('000\.000\.000\-00;0;',edtCPF.Text);
  end;
end;

procedure TValidarCliente.edtCPFKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in ['0'..'9',#8]) then Abort;

   if key <> #8 then
   begin
     if Length(edtCPF.Text) = 3 then
        begin
           edtCPF.Text := edtCPF.Text + '.';
           edtCPF.Selstart := Length(edtCPF.Text);
        end;

     if Length(edtCPF.Text) = 7 then
        begin
           edtCPF.Text := edtCPF.Text + '.';
           edtCPF.Selstart := Length(edtCPF.Text);
        end;

     if Length(edtCPF.Text) = 11 then
        begin
           edtCPF.Text := edtCPF.Text + '-';
           edtCPF.Selstart := Length(edtCPF.text);
        end;
   end;
end;

procedure TValidarCliente.FormCreate(Sender: TObject);
begin
  funcoes := TFuncoes.Create;
  verificacao := false;

end;

procedure TValidarCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnValidarClick(self);
end;

function TValidarCliente.getVerificacao: boolean;
begin
  result := verificacao;
end;

end.
 

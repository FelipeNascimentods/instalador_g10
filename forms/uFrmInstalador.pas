unit uFrmInstalador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

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
    procedure btnInstalarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure instalar;

    procedure configurarHD;
    procedure configurarDB;
    procedure moverArquivos;
    procedure instalarProgramas;
    procedure criarAtalhos;
  end;

var
  frmInstalador: TfrmInstalador;

implementation

{$R *.dfm}

procedure TfrmInstalador.configurarDB;
begin

end;

procedure TfrmInstalador.configurarHD;
begin

end;

procedure TfrmInstalador.criarAtalhos;
begin

end;

procedure TfrmInstalador.instalar;
begin
  {Main}

end;

procedure TfrmInstalador.instalarProgramas;
begin

end;

procedure TfrmInstalador.moverArquivos;
begin

end;

procedure TfrmInstalador.btnInstalarClick(Sender: TObject);
begin
  instalar;
end;

end.

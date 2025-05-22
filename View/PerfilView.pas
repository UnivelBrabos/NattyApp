unit PerfilView;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Ani, UsuarioModel,
  PerfilController;

type
  TForm4 = class(TForm)
    RecMenu: TRectangle;
    lblNome: TLabel;
    txtNome: TEdit;
    lblEmail: TLabel;
    txtPeso: TEdit;
    lblQuilo: TLabel;
    lblAltura: TLabel;
    txtAltura: TEdit;
    lblMetros: TLabel;
    lblIMC: TLabel;
    lblValorIMC: TLabel;
    lblDescIMC: TLabel;
    btnSalvar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FUsuario: TUsuario;
    FPerfilControlador: TFrame4;
    procedure CalculaIMC;
  public
    constructor Create(AOwner: TComponent; const AUsuario: TUsuario); reintroduce;
  end;

implementation

{$R *.fmx}

constructor TForm4.Create(AOwner: TComponent; const AUsuario: TUsuario);
begin
  inherited Create(AOwner);
  FUsuario := AUsuario;
  FPerfilControlador := TFrame4.Create(Self);
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  txtNome.Text := FUsuario.FNome;
  txtPeso.Text := FUsuario.FPeso.ToString;
  txtAltura.Text := FUsuario.FAltura.ToString;
  CalculaIMC;
end;

procedure TForm4.btnSalvarClick(Sender: TObject);
var
  fs: TFormatSettings;
begin
  fs := TFormatSettings.Create;
  fs.DecimalSeparator := '.';

  FUsuario.FNome := txtNome.Text;
  FUsuario.FPeso := StrToFloat(txtPeso.Text, fs);
  FUsuario.FAltura := StrToFloat(txtAltura.Text, fs);

  FPerfilControlador.AtualizaUsuario(FUsuario);
  CalculaIMC;
end;

procedure TForm4.CalculaIMC;
var
  IMC: Double;
begin
  IMC := FUsuario.FPeso / Sqr(FUsuario.FAltura);
  lblValorIMC.Text := FormatFloat('0.0', IMC);

  if IMC < 18.5 then
  begin
    lblDescIMC.Text := 'Baixo peso';
    lblDescIMC.TextSettings.FontColor := TColors.Blue;
  end
  else if IMC < 25 then
  begin
    lblDescIMC.Text := 'Peso normal';
    lblDescIMC.TextSettings.FontColor := TColors.Green;
  end
  else if IMC < 30 then
  begin
    lblDescIMC.Text := 'Sobrepeso';
    lblDescIMC.TextSettings.FontColor := TColors.Yellow;
  end
  else
  begin
    lblDescIMC.Text := 'Obesidade';
    lblDescIMC.TextSettings.FontColor := TColors.Red;
  end;
end;

end.


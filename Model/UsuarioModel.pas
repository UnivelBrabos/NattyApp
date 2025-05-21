unit UsuarioModel;

interface

uses
  SysUtils;

type
  TUsuario = class
  public
    FId: Integer;
    FNome: string;
    FEmail: string;
    FSenha: string;
    FPeso: Double;
    FAltura: Double;

    constructor Create(AId: Integer; const ANome, AEmail, ASenha: string; APeso, AAltura: Double);
    function SqlTodosUsuarios(): string;
    function UpdateUser(): string;
  end;

implementation

constructor TUsuario.Create(AId: Integer; const ANome, AEmail, ASenha: string; APeso, AAltura: Double);
begin
  FId := AId;
  FNome := ANome;
  FEmail := AEmail;
  FSenha := ASenha;
  FPeso := APeso;
  FAltura := AAltura;
end;

function TUsuario.SqlTodosUsuarios(): string;
begin
  Result := 'SELECT * FROM usuario';
end;

function TUsuario.UpdateUser(): string;
begin
  Result := 'UPDATE USUARIO SET ' +
            'NOME = ''' + Self.FNome + ''', ' +
            'PESO = ''' + FloatToStr(Self.FPeso) + ''', ' +
            'ALTURA = ''' + FloatToStr(Self.FAltura) + '''' +
            ' WHERE ID = ' + IntToStr(Self.FId);
end;

end.


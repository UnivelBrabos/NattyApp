unit UsuarioModel;

interface

uses
  System.SysUtils,
  System.Variants,
  System.DateUtils;

type
  /// Entidade e queries de negócio para Usuário
  TUsuario = class
  public
    FId: Integer;
    FNome: string;
    FEmail: string;
    FSenha: string;
    FPeso: Double;

    constructor Create(AId: Integer; const ANome, AEmail, ASenha: string; APeso: Double);

    /// Retorna todos os usuários
    function SqlTodosUsuarios(): string;

    /// ==== QUERIES ESTÁTICAS ====

    /// 1) SELECT todos
    class function SqlSelectAll(): string; static;
    class function Params_SelectAll(): TArray<Variant>; static;

    /// 2) SELECT por ID
    class function SqlSelectById(): string; static;
    class function Params_SelectById(AId: Integer): TArray<Variant>; static;

    /// 3) INSERT novo usuário
    class function SqlInsert(): string; static;
    class function Params_Insert(AUsuario: TUsuario): TArray<Variant>; static;

    /// 4) UPDATE de usuário existente
    class function SqlUpdate(): string; static;
    class function Params_Update(AUsuario: TUsuario): TArray<Variant>; static;

    /// 5) DELETE de usuário
    class function SqlDelete(): string; static;
    class function Params_Delete(AId: Integer): TArray<Variant>; static;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create(AId: Integer; const ANome, AEmail, ASenha: string; APeso: Double);
begin
  FId := AId;
  FNome := ANome;
  FEmail := AEmail;
  FSenha := ASenha;
  FPeso := APeso;
end;

function TUsuario.SqlTodosUsuarios(): string;
begin
  Result := 'SELECT * FROM Usuario';
end;

// ─── IMPLEMENTAÇÕES DAS QUERIES ESTÁTICAS ───

class function TUsuario.SqlSelectAll: string;
begin
  Result :=
    'SELECT ID, Nome, Email, Senha, Peso ' +
    'FROM Usuario ' +
    'ORDER BY Nome';
end;

class function TUsuario.Params_SelectAll: TArray<Variant>;
begin
  SetLength(Result, 0);
end;

class function TUsuario.SqlSelectById: string;
begin
  Result :=
    'SELECT ID, Nome, Email, Senha, Peso ' +
    'FROM Usuario ' +
    'WHERE ID = :ID';
end;

class function TUsuario.Params_SelectById(AId: Integer): TArray<Variant>;
begin
  SetLength(Result, 1);
  Result[0] := AId;
end;

class function TUsuario.SqlInsert: string;
begin
  Result :=
    'INSERT INTO Usuario (Nome, Email, Senha, Peso) ' +
    'VALUES (:Nome, :Email, :Senha, :Peso)';
end;

class function TUsuario.Params_Insert(AUsuario: TUsuario): TArray<Variant>;
begin
  SetLength(Result, 4);
  Result[0] := AUsuario.FNome;
  Result[1] := AUsuario.FEmail;
  Result[2] := AUsuario.FSenha;
  Result[3] := AUsuario.FPeso;
end;

class function TUsuario.SqlUpdate: string;
begin
  Result :=
    'UPDATE Usuario SET ' +
    'Nome = :Nome, ' +
    'Email = :Email, ' +
    'Senha = :Senha, ' +
    'Peso = :Peso ' +
    'WHERE ID = :ID';
end;

class function TUsuario.Params_Update(AUsuario: TUsuario): TArray<Variant>;
begin
  SetLength(Result, 5);
  Result[0] := AUsuario.FNome;
  Result[1] := AUsuario.FEmail;
  Result[2] := AUsuario.FSenha;
  Result[3] := AUsuario.FPeso;
  Result[4] := AUsuario.FId;
end;

class function TUsuario.SqlDelete: string;
begin
  Result := 'DELETE FROM Usuario WHERE ID = :ID';
end;

class function TUsuario.Params_Delete(AId: Integer): TArray<Variant>;
begin
  SetLength(Result, 1);
  Result[0] := AId;
end;

// ────────────────────────────────────────────────

end.


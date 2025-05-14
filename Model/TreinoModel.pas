unit TreinoModel;

interface

uses
  System.SysUtils,
  System.Variants,
  System.DateUtils;

type
  TTreino = class
  public
    FId: Integer;
    FNome: string;
    FData: TDate;
    FUsuarioId: Integer;

    constructor Create(AId: Integer; const ANome: string; AData: TDate; AUsuarioId: Integer);
    constructor PCreate();  // construtor padrão

    /// Retorna todos os treinos
    function SqlTodosTreinos(): string;

    /// ==== NOVAS QUERIES ESTÁTICAS ====

    /// 1) Lista todos os treinos
    class function SqlSelectAll(): string; static;
    class function Params_SelectAll(): TArray<Variant>; static;

    /// 2) Busca treino por ID
    class function SqlSelectById(): string; static;
    class function Params_SelectById(AId: Integer): TArray<Variant>; static;

    /// 3) Insere novo treino
    class function SqlInsert(): string; static;
    class function Params_Insert(const ANome: string; AData: TDate; AUsuarioId: Integer): TArray<Variant>; static;

    /// 4) Atualiza treino existente
    class function SqlUpdate(): string; static;
    class function Params_Update(AId: Integer; const ANome: string; AData: TDate): TArray<Variant>; static;
  end;

implementation

{ TTreino }

// construtor padrão
constructor TTreino.PCreate();
begin
  // sem lógica
end;

// construtor completo
constructor TTreino.Create(AId: Integer; const ANome: string; AData: TDate; AUsuarioId: Integer);
begin
  FId := AId;
  FNome := ANome;
  FData := AData;
  FUsuarioId := AUsuarioId;
end;

// método de instância existente
function TTreino.SqlTodosTreinos(): string;
begin
  Result := 'SELECT * FROM Treino';
end;

// ─── IMPLEMENTAÇÕES DAS NOVAS CLASS METHODS ───

class function TTreino.SqlSelectAll: string;
begin
  Result :=
    'SELECT ID, Nome, Data, UsuarioId ' +
    'FROM Treino ' +
    'ORDER BY Data DESC';
end;

class function TTreino.Params_SelectAll: TArray<Variant>;
begin
  SetLength(Result, 0);
end;

class function TTreino.SqlSelectById: string;
begin
  Result :=
    'SELECT ID, Nome, Data, UsuarioId ' +
    'FROM Treino ' +
    'WHERE ID = :ID';
end;

class function TTreino.Params_SelectById(AId: Integer): TArray<Variant>;
begin
  SetLength(Result, 1);
  Result[0] := AId;
end;

class function TTreino.SqlInsert: string;
begin
  Result :=
    'INSERT INTO Treino (Nome, Data, UsuarioId) ' +
    'VALUES (:Nome, :Data, :UsuarioId)';
end;

class function TTreino.Params_Insert(const ANome: string; AData: TDate; AUsuarioId: Integer): TArray<Variant>;
begin
  SetLength(Result, 3);
  Result[0] := ANome;
  Result[1] := AData;
  Result[2] := AUsuarioId;
end;

class function TTreino.SqlUpdate: string;
begin
  Result :=
    'UPDATE Treino SET ' +
    'Nome = :Nome, ' +
    'Data = :Data ' +
    'WHERE ID = :ID';
end;

class function TTreino.Params_Update(AId: Integer; const ANome: string; AData: TDate): TArray<Variant>;
begin
  SetLength(Result, 3);
  Result[0] := ANome;
  Result[1] := AData;
  Result[2] := AId;
end;

// ─────────────────────────────────────────────────

end.
.

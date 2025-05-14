unit RegistroExercicioModel;

interface

uses
  System.SysUtils,
  System.Variants;

type
  /// Classe que representa e fornece as queries de negócio para RegistroExercicio
  TRegistroExercicio = class
  public
    FId: Integer;
    FTreinoExercicioId: Integer;
    FSerie: Integer;
    FRepeticoes: Integer;
    FPesoUtilizado: Double;
    FHora: TDateTime;

    constructor Create(AId, ATreinoExercicioId, ASerie, ARepeticoes: Integer;
      APesoUtilizado: Double; AHora: TDateTime);

    /// Retorna todos os registros
    function SqlTodosRegistroExercicio(): string;

    /// ==== NOVAS QUERIES ESTÁTICAS ====

    /// 1) SELECT * FROM RegistroExercicio
    class function SqlSelectAll(): string; static;
    class function Params_SelectAll(): TArray<Variant>; static;

    /// 2) INSERT INTO RegistroExercicio …
    class function SqlInsert(): string; static;
    class function Params_Insert(ARegistro: TRegistroExercicio): TArray<Variant>; static;

    /// 3) UPDATE RegistroExercicio SET … WHERE ID = :ID
    class function SqlUpdate(): string; static;
    class function Params_Update(ARegistro: TRegistroExercicio): TArray<Variant>; static;
  end;

implementation

{ TRegistroExercicio }

constructor TRegistroExercicio.Create(AId, ATreinoExercicioId, ASerie,
  ARepeticoes: Integer; APesoUtilizado: Double; AHora: TDateTime);
begin
  FId := AId;
  FTreinoExercicioId := ATreinoExercicioId;
  FSerie := ASerie;
  FRepeticoes := ARepeticoes;
  FPesoUtilizado := APesoUtilizado;
  FHora := AHora;
end;

function TRegistroExercicio.SqlTodosRegistroExercicio(): string;
begin
  Result := 'SELECT * FROM RegistroExercicio';
end;

// ─── IMPLEMENTAÇÕES DAS NOVAS CLASS METHODS ───

class function TRegistroExercicio.SqlSelectAll: string;
begin
  Result :=
    'SELECT ID, TreinoExercicioId, Serie, Repeticoes, PesoUtilizado, Hora ' +
    'FROM RegistroExercicio';
end;

class function TRegistroExercicio.Params_SelectAll: TArray<Variant>;
begin
  SetLength(Result, 0);
end;

class function TRegistroExercicio.SqlInsert: string;
begin
  Result :=
    'INSERT INTO RegistroExercicio ' +
    '(TreinoExercicioId, Serie, Repeticoes, PesoUtilizado, Hora) ' +
    'VALUES ' +
    '(:TreinoExercicioId, :Serie, :Repeticoes, :PesoUtilizado, :Hora)';
end;

class function TRegistroExercicio.Params_Insert(ARegistro: TRegistroExercicio): TArray<Variant>;
begin
  SetLength(Result, 5);
  Result[0] := ARegistro.FTreinoExercicioId;
  Result[1] := ARegistro.FSerie;
  Result[2] := ARegistro.FRepeticoes;
  Result[3] := ARegistro.FPesoUtilizado;
  Result[4] := ARegistro.FHora;
end;

class function TRegistroExercicio.SqlUpdate: string;
begin
  Result :=
    'UPDATE RegistroExercicio SET ' +
    'TreinoExercicioId = :TreinoExercicioId, ' +
    'Serie = :Serie, ' +
    'Repeticoes = :Repeticoes, ' +
    'PesoUtilizado = :PesoUtilizado, ' +
    'Hora = :Hora ' +
    'WHERE ID = :ID';
end;

class function TRegistroExercicio.Params_Update(ARegistro: TRegistroExercicio): TArray<Variant>;
begin
  SetLength(Result, 6);
  Result[0] := ARegistro.FTreinoExercicioId;
  Result[1] := ARegistro.FSerie;
  Result[2] := ARegistro.FRepeticoes;
  Result[3] := ARegistro.FPesoUtilizado;
  Result[4] := ARegistro.FHora;
  Result[5] := ARegistro.FId;
end;

// ───────────────────────────────────────────────────

end.


unit TreinoExercicioModel;

interface

uses
  System.Variants;

type
  /// Camada de negócio: queries para vincular Treinos e Exercícios
  TTreinoExercicioModel = class
  public
    /// Busca os exercícios associados a um treino específico
    class function SqlSelectByTreino(): string; static;
    class function Params_SelectByTreino(ATreinoID: Integer): TArray<Variant>; static;

    /// (Opcional) Inserir associação treino-exercício
    class function SqlInsert(): string; static;
    class function Params_Insert(ATreinoID, AExercicioID: Integer; ADayOfWeek: Integer): TArray<Variant>; static;
  end;

implementation

{ TTreinoExercicioModel }

class function TTreinoExercicioModel.SqlSelectByTreino: string;
begin
  Result :=
    'SELECT E.ID, E.Nome, TE.DayOfWeek, E.DefaultTime ' +
    'FROM TreinoExercicio TE ' +
    'JOIN Exercicio E ON E.ID = TE.ExercicioID ' +
    'WHERE TE.TreinoID = :TreinoID ' +
    'ORDER BY E.Nome';
end;

class function TTreinoExercicioModel.Params_SelectByTreino(ATreinoID: Integer): TArray<Variant>;
begin
  SetLength(Result, 1);
  Result[0] := ATreinoID;
end;

class function TTreinoExercicioModel.SqlInsert: string;
begin
  Result :=
    'INSERT INTO TreinoExercicio (TreinoID, ExercicioID, DayOfWeek) ' +
    'VALUES (:TreinoID, :ExercicioID, :DayOfWeek)';
end;

class function TTreinoExercicioModel.Params_Insert(ATreinoID, AExercicioID, ADayOfWeek: Integer): TArray<Variant>;
begin
  SetLength(Result, 3);
  Result[0] := ATreinoID;
  Result[1] := AExercicioID;
  Result[2] := ADayOfWeek;
end;

end.


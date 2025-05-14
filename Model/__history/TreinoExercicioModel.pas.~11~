unit TreinoExercicioModel;

interface

type
  TTreinoExercicio = class
  public
    FId: Integer;
    FTreinoId: Integer;
    FExercicioId: Integer;

    // Coloque todos os Métodos daqui para baixo (Sem passar do end;)
    // Aqui fica a declaração. Após implementation coloque TTreinoExercicio. antes do nome do método

    constructor Create(AId, ATreinoId, AExercicioId: Integer);
    function SqlTodosTreinoExercicio(): string;

end;

implementation

constructor TTreinoExercicio.Create(AId, ATreinoId, AExercicioId: Integer);
begin
  FId := AId;
  FTreinoId := ATreinoId;
  FExercicioId := AExercicioId;
end;

function TTreinoExercicio.SqlTodosTreinoExercicio(): string;
begin
  Result := 'SELECT * FROM TreinoExercicio';
end;

end.

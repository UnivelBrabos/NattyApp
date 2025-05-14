unit ExercicioModel;

interface

type
  TExercicio = class
  public
    FId: Integer;
    FNome: string;
    FIdRegiao: integer;

    // Coloque todos os Métodos daqui para baixo (Sem passar do end;)
    // Aqui fica a declaração. Após implementation coloque TExercicio. antes do nome do método

    constructor Create(AId: Integer; const ANome: string; ARegiao: integer);
    function SqlTodosExercicios(): string;

     class function SqlSelectAll(): string; static;

     class function SqlSelectByWeekday(): string; static;
     class function Params_SelectByWeekday(AWeekday: Integer): TArray<Variant>; static;


     class function SqlSelectByRegiao(): string; static;
     class function Params_SelectByRegiao(ARegiaoID: Integer): TArray<Variant>; static;


end;


implementation

 {TExercicio}

constructor TExercicio.Create(AId: Integer; const ANome: string; ARegiao: integer);
begin
  FId := AId;
  FNome := ANome;
  FIdRegiao := ARegiao;
end;

function TExercicio.SqlTodosExercicios(): string;
begin
  Result := 'SELECT * FROM Exercicio';
end;

class function TExercicio.SqlSelectAll: string;
begin
  Result := 'SELECT ID, Nome, IdRegiao FROM Exercicio ORDER BY Nome';
end;

class function TExercicio.SqlSelectByWeekday: string;
begin
  Result :=
    'SELECT ID, Nome, IdRegiao ' +
    'FROM Exercicio ' +
    'WHERE Weekday = :Weekday ' +
    'ORDER BY Nome';
end;

class function TExercicio.Params_SelectByWeekday(AWeekday: Integer): TArray<Variant>;
begin
  SetLength(Result, 1);
  Result[0] := AWeekday;
end;

class function TExercicio.SqlSelectByRegiao: string;
begin
  Result :=
    'SELECT ID, Nome, IdRegiao ' +
    'FROM Exercicio ' +
    'WHERE IdRegiao = :RegiaoID ' +
    'ORDER BY Nome';
end;

class function TExercicio.Params_SelectByRegiao(ARegiaoID: Integer): TArray<Variant>;
begin
  SetLength(Result, 1);
  Result[0] := ARegiaoID;
end;


end.

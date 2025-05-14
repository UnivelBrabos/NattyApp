unit RegistroExercicioModel;

interface

type
  TRegistroExercicio = class
  public
    FId: Integer;
    FTreinoExercicioId: Integer;
    FSerie: Integer;
    FRepeticoes: Integer;
    FPesoUtilizado: Double;
    FHora: TDateTime;

    // Coloque todos os Métodos daqui para baixo (Sem passar do end;)
    // Aqui fica a declaração. Após implementation coloque TRegistroExercicio. antes do nome do método

    constructor Create(AId, ATreinoExercicioId, ASerie, ARepeticoes: Integer; APesoUtilizado: Double; AHora: TDateTime);
    function SqlTodosRegistroExercicio(): string;

end;


implementation

constructor TRegistroExercicio.Create(AId, ATreinoExercicioId, ASerie, ARepeticoes: Integer; APesoUtilizado: Double; AHora: TDateTime);
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

end.

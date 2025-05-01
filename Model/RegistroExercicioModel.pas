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

    constructor Create(AId, ATreinoExercicioId, ASerie, ARepeticoes: Integer; APesoUtilizado: Double; AHora: TDateTime);
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

end.

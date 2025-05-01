unit TreinoModel;

interface

type
  TTreino = class
  public
    FId: Integer;
    FNome: string;
    FData: TDate;
    FUsuarioId: Integer;

    constructor Create(AId: Integer; const ANome: string; AData: TDate; AUsuarioId: Integer);
  end;

implementation

end.

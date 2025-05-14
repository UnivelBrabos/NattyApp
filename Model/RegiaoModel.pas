unit RegiaoModel;

interface

uses
  System.Variants;

type
  TRegiao = class
  public
    FId: Integer;
    FRegiao: string;

    constructor Create(AId: Integer; const ARegiao: string);
    function SqlTodasRegioes(): string;



    /// 1) Mesma coisa que SqlTodasRegioes, mas em padrão estático
    class function SqlSelectAll(): string; static;
    class function Params_SelectAll(): TArray<Variant>; static;

    /// 2) Buscar região por ID
    class function SqlSelectById(): string; static;
    class function Params_SelectById(AId: Integer): TArray<Variant>; static;
  end;

implementation

{ TRegiao }

constructor TRegiao.Create(AId: Integer; const ARegiao: string);
begin
  FId := AId;
  FRegiao := ARegiao;
end;

function TRegiao.SqlTodasRegioes(): string;
begin
  Result := 'SELECT * FROM Regiao';
end;

class function TRegiao.SqlSelectAll: string;
begin
  Result := 'SELECT ID, Regiao FROM Regiao ORDER BY Regiao';
end;

class function TRegiao.Params_SelectAll: TArray<Variant>;
begin
  SetLength(Result, 0);
end;

class function TRegiao.SqlSelectById: string;
begin
  Result := 'SELECT ID, Regiao FROM Regiao WHERE ID = :ID';
end;

class function TRegiao.Params_SelectById(AId: Integer): TArray<Variant>;
begin
  SetLength(Result, 1);
  Result[0] := AId;
end;

end.


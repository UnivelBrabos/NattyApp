unit AcompanharController;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  TreinoModel, DataController;

type
  TFrame2 = class(TFrame)
  private
    TSQLManipulador: TFrame1; // A conexão ao banco tá em um form, por que é mais fácil de manipular.
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ExemploSql;
end;


implementation

{$R *.fmx}


constructor TFrame2.Create(AOwner: TComponent);
begin
  inherited;
  TSQLManipulador := TFrame1.Create(Self);
  TSQLManipulador.Visible := False; // Não mostra o form do Sql
end;

destructor TFrame2.Destroy;
begin
  inherited;
end;

procedure TFrame2.ExemploSql;
var
  Treino: TTreino;
begin
  Treino := TTreino.PCreate;

  try
    TSQLManipulador.TQuerys.SQL.Text := Treino.SqlTodosTreinos;
    TSQLManipulador.TQuerys.Open;

    TSQLManipulador.TQuerys.First;
    while not TSQLManipulador.TQuerys.Eof do
    begin
      Treino.FNome := TSQLManipulador.TQuerys.FieldByName('nome').AsString;
      ShowMessage(Treino.FNome);

      TSQLManipulador.TQuerys.Next;
    end;

  finally
    Treino.Free;
  end;
end;


end.

program Project1;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  UsuarioModel in 'Model\UsuarioModel.pas',
  ExercicioModel in 'Model\ExercicioModel.pas',
  TreinoModel in 'Model\TreinoModel.pas',
  TreinoExercicioModel in 'Model\TreinoExercicioModel.pas',
  RegistroExercicioModel in 'Model\RegistroExercicioModel.pas',
  RegiaoModel in 'Model\RegiaoModel.pas',
  DataController in 'Data\DataController.pas' {Frame1: TFrame},
  AcompanharView in 'View\AcompanharView.pas' {Form2},
  MontarTreinoView in 'View\MontarTreinoView.pas' {Form3},
  PerfilView in 'View\PerfilView.pas' {Form4},
  AcompanharController in 'Controller\AcompanharController.pas' {Frame2: TFrame},
  MontarTreinoController in 'Controller\MontarTreinoController.pas' {Frame3: TFrame},
  PerfilController in 'Controller\PerfilController.pas' {Frame4: TFrame},
  HistoricoModel in 'Model\HistoricoModel.pas' {DataModule1: TDataModule},
  Main in 'Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


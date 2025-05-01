object DataModule1: TDataModule1
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object objEstabecedorConexao: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    Left = 104
    Top = 80
  end
  object objRealizaSQL: TFDQuery
    Connection = objEstabecedorConexao
    SQL.Strings = (
      'SELECT * FROM USUARIO')
    Left = 304
    Top = 80
  end
end

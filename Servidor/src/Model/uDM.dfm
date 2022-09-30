object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 256
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=WK'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost'
      'DriverID=PG')
    TxOptions.Isolation = xiDirtyRead
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object Driver: TFDPhysPgDriverLink
    VendorHome = 'C:\Rest\Servidor'
    Left = 104
    Top = 16
  end
  object Cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 32
    Top = 80
  end
  object Storage: TFDStanStorageBinLink
    Left = 104
    Top = 80
  end
  object Qry: TFDQuery
    Connection = Conexao
    Left = 176
    Top = 56
  end
end

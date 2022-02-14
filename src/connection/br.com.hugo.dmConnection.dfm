object dmConnection: TdmConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 478
  Width = 464
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Delphi\FormacaoDelphi\src\database\data.db')
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 48
    Top = 112
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 192
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 48
    Top = 272
  end
end

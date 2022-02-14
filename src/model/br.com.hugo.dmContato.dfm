object dmContato: TdmContato
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 374
  Width = 429
  object fdqryPessoa: TFDQuery
    Active = True
    Connection = dmConnection.FDConnection
    SQL.Strings = (
      'select * from Pessoa')
    Left = 32
    Top = 24
    object fdqryPessoaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object fdqryPessoaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 150
    end
    object fdqryPessoaSOBRENOME: TStringField
      FieldName = 'SOBRENOME'
      Origin = 'SOBRENOME'
      Required = True
      Size = 100
    end
  end
  object fdqryContato: TFDQuery
    MasterSource = dsPessoa
    MasterFields = 'ID'
    DetailFields = 'ID_PESSOA'
    Connection = dmConnection.FDConnection
    SQL.Strings = (
      'select * from Contato'
      'where id_pessoa = :ID')
    Left = 32
    Top = 104
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqryContatoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object fdqryContatoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object fdqryContatoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      EditMask = '!\(99\)00000-0000;0;_'
    end
    object fdqryContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object fdqryContatoID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
    end
  end
  object dsPessoa: TDataSource
    DataSet = fdqryPessoa
    Left = 104
    Top = 24
  end
  object dsContato: TDataSource
    DataSet = fdqryContato
    Left = 104
    Top = 104
  end
end

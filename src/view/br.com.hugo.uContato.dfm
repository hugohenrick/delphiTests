inherited FrmContato: TFrmContato
  Caption = 'Contatos'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnMaster: TPanel
    Height = 185
    ExplicitHeight = 185
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 29
      Height = 13
      Caption = 'NOME'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 62
      Height = 13
      Caption = 'SOBRENOME'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 32
      Width = 55
      Height = 21
      DataField = 'ID'
      DataSource = dmContato.dsPessoa
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 72
      Width = 250
      Height = 21
      DataField = 'NOME'
      DataSource = dmContato.dsPessoa
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 112
      Width = 250
      Height = 21
      DataField = 'SOBRENOME'
      DataSource = dmContato.dsPessoa
      TabOrder = 2
    end
    object Button1: TButton
      Left = 1
      Top = 149
      Width = 62
      Height = 35
      Action = actAbrir
      TabOrder = 3
    end
    object Button2: TButton
      Left = 65
      Top = 149
      Width = 62
      Height = 35
      Action = actNovo
      TabOrder = 4
    end
    object Button3: TButton
      Left = 130
      Top = 149
      Width = 62
      Height = 35
      Action = actSalvar
      TabOrder = 5
    end
    object Button4: TButton
      Left = 194
      Top = 149
      Width = 62
      Height = 35
      Action = actAtualizar
      TabOrder = 6
    end
    object Button5: TButton
      Left = 258
      Top = 149
      Width = 62
      Height = 35
      Action = actDeletar
      TabOrder = 7
    end
  end
  inherited pnDetail: TPanel
    Top = 185
    Height = 615
    ExplicitTop = 185
    ExplicitHeight = 615
    inherited pnButtons: TPanel
      Top = 552
      ExplicitTop = 552
      inherited dbNavigator: TDBNavigator
        DataSource = dmContato.dsPessoa
        Hints.Strings = ()
      end
    end
    inherited DBGrid1: TDBGrid
      Height = 552
      DataSource = dmContato.dsContato
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PESSOA'
          Visible = True
        end>
    end
  end
  object ActionList: TActionList
    Left = 912
    Top = 16
    object actAbrir: TAction
      Caption = 'Abrir'
      OnExecute = actAbrirExecute
    end
    object actNovo: TAction
      Caption = 'Novo'
      OnExecute = actNovoExecute
      OnUpdate = actNovoUpdate
    end
    object actSalvar: TAction
      Caption = 'Salvar'
      OnExecute = actSalvarExecute
      OnUpdate = actSalvarUpdate
    end
    object actDeletar: TAction
      Caption = 'Deletar'
      OnExecute = actDeletarExecute
      OnUpdate = actDeletarUpdate
    end
    object actAtualizar: TAction
      Caption = 'Atualizar'
      OnExecute = actAtualizarExecute
      OnUpdate = actAtualizarUpdate
    end
  end
end

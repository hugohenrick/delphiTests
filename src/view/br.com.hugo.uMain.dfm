object FrmDashboard: TFrmDashboard
  Left = 0
  Top = 0
  Caption = 'Dashboard'
  ClientHeight = 800
  ClientWidth = 1008
  Color = clBtnFace
  Constraints.MinHeight = 800
  Constraints.MinWidth = 1024
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 504
    Top = 320
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Contato1: TMenuItem
        Action = actFrmContatos
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Cidade1: TMenuItem
        Caption = 'Cidade'
      end
    end
    object Vendas1: TMenuItem
      Caption = 'Vendas'
    end
    object Faturamento1: TMenuItem
      Caption = 'Faturamento'
    end
  end
  object ActionListMainMenu: TActionList
    Left = 672
    Top = 288
    object actFrmContatos: TAction
      Caption = 'Contatos'
      ShortCut = 16449
      OnExecute = actFrmContatosExecute
    end
  end
end

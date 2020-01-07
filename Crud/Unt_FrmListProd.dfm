object FrmListProd: TFrmListProd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Listagem de Produtos'
  ClientHeight = 375
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 19
      Width = 40
      Height = 13
      Caption = 'C'#243'digo: '
    end
    object Label2: TLabel
      Left = 256
      Top = 19
      Width = 34
      Height = 13
      Caption = 'Nome: '
    end
    object EdtCod: TEdit
      Left = 64
      Top = 16
      Width = 81
      Height = 21
      TabOrder = 0
    end
    object EdtNome: TEdit
      Left = 296
      Top = 16
      Width = 217
      Height = 21
      TabOrder = 1
    end
    object BtnAtualizar: TButton
      Left = 144
      Top = 50
      Width = 121
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 2
      OnClick = BtnAtualizarClick
    end
    object BtnLimpar: TButton
      Left = 336
      Top = 50
      Width = 121
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = BtnLimparClick
    end
  end
  object GridProd: TDBGrid
    Left = 0
    Top = 81
    Width = 615
    Height = 224
    Align = alTop
    DataSource = DsProd
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object QryProd: TpFIBDataSet
    Transaction = DM.TransRead
    Database = DM.DB
    Left = 120
    Top = 120
    object QryProdCOD_PRODUTO: TFIBIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object QryProdNOME_PRODUTO: TFIBStringField
      FieldName = 'NOME_PRODUTO'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object DsProd: TDataSource
    DataSet = QryProd
    Left = 192
    Top = 120
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 144
    object AlterarProduto1: TMenuItem
      Caption = 'Alterar Produto'
      OnClick = AlterarProduto1Click
    end
  end
end

﻿object FrmVendas: TFrmVendas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Vendas'
  ClientHeight = 432
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlDados: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 105
    Align = alTop
    TabOrder = 0
    object LblCliente: TLabel
      Left = 16
      Top = 16
      Width = 53
      Height = 16
      Caption = 'Cliente: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblProduto: TLabel
      Left = 16
      Top = 47
      Width = 61
      Height = 16
      Caption = 'Produto: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtCodCliente: TEdit
      Left = 66
      Top = 13
      Width = 57
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = EdtCodClienteExit
      OnKeyPress = EdtCodClienteKeyPress
    end
    object EdtNomeCliente: TEdit
      Left = 125
      Top = 13
      Width = 460
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object PnlProduto: TPanel
      Left = 1
      Top = 71
      Width = 762
      Height = 33
      Align = alBottom
      TabOrder = 2
      Visible = False
      object LblQuant: TLabel
        Left = 40
        Top = 8
        Width = 43
        Height = 16
        Caption = 'Quant: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblPreco: TLabel
        Left = 210
        Top = 8
        Width = 41
        Height = 16
        Caption = 'Pre'#231'o: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblSubtotal: TLabel
        Left = 418
        Top = 8
        Width = 56
        Height = 16
        Caption = 'Subtotal: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EdtQuant: TEdit
        Left = 81
        Top = 4
        Width = 64
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '1,00'
        OnChange = EdtQuantChange
        OnKeyPress = EdtQuantKeyPress
      end
      object EdtPreco: TEdit
        Left = 249
        Top = 5
        Width = 80
        Height = 24
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        OnChange = EdtPrecoChange
        OnKeyPress = EdtPrecoKeyPress
      end
      object EdtSubtotal: TEdit
        Left = 472
        Top = 4
        Width = 97
        Height = 24
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '0,00'
      end
    end
    object EdtCodProduto: TEdit
      Left = 74
      Top = 44
      Width = 57
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = EdtCodProdutoKeyPress
      OnKeyUp = EdtCodProdutoKeyUp
    end
    object EdtNomeProduto: TEdit
      Left = 134
      Top = 44
      Width = 460
      Height = 24
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object PnlTotais: TPanel
    Left = 0
    Top = 346
    Width = 764
    Height = 86
    Align = alBottom
    TabOrder = 1
    object LblTotalVenda: TLabel
      Left = 507
      Top = 24
      Width = 137
      Height = 19
      Caption = 'Subtotal: R$0,00'
      Color = clDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object BtnFinalizar: TBitBtn
      Left = 41
      Top = 24
      Width = 119
      Height = 33
      Caption = 'Finalizar Venda'
      TabOrder = 0
      OnClick = BtnFinalizarClick
    end
    object BtnCancelar: TBitBtn
      Left = 211
      Top = 24
      Width = 119
      Height = 33
      Caption = 'Cancelar Venda'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
  end
  object GridVendas: TDBGrid
    Left = 0
    Top = 105
    Width = 764
    Height = 241
    Align = alClient
    DataSource = DsVendas
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = MenuGrid
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD'
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Produto'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quant'
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit'#225'rio'
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Title.Alignment = taRightJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end>
  end
  object QryVendas: TpFIBDataSet
    Transaction = Dm.TransRead
    Database = Dm.DB
    Left = 104
    Top = 152
  end
  object CdVendas: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspVendas'
    Left = 232
    Top = 160
    object CdVendasCOD: TIntegerField
      FieldName = 'COD'
    end
    object CdVendasNome: TStringField
      FieldName = 'Nome'
      Size = 250
    end
    object CdVendasQuant: TCurrencyField
      FieldName = 'Quant'
      currency = False
    end
    object CdVendasUnitário: TCurrencyField
      FieldName = 'Unit'#225'rio'
    end
    object CdVendasTotal: TCurrencyField
      FieldName = 'Total'
    end
    object CdVendasSubTotal: TAggregateField
      FieldName = 'SubTotal'
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(TOTAL)'
    end
  end
  object DsVendas: TDataSource
    DataSet = CdVendas
    Left = 296
    Top = 168
  end
  object MenuGrid: TPopupMenu
    Left = 632
    Top = 168
    object MenuGridDeletar: TMenuItem
      Caption = 'Deletar'
      OnClick = MenuGridDeletarClick
    end
  end
  object QryVendasIns: TpFIBQuery
    Transaction = Dm.TransWrite
    Database = Dm.DB
    Left = 96
    Top = 224
  end
end
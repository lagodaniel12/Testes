object FrmListagemClientes: TFrmListagemClientes
  Left = 0
  Top = 0
  BorderWidth = 4
  Caption = 'Listagem de Clientes'
  ClientHeight = 368
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Cod:'
    end
    object Label2: TLabel
      Left = 208
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object edtNome: TEdit
      Left = 242
      Top = 5
      Width = 235
      Height = 21
      TabOrder = 0
    end
    object edtCodigo: TEdit
      Left = 51
      Top = 5
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 79
    Width = 689
    Height = 242
    Align = alTop
    DataSource = DSListagemClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_CLIENTE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cod'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Nome'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 689
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object LbCountReg: TLabel
      Left = 600
      Top = 11
      Width = 62
      Height = 13
      Caption = '0 Registro(s)'
    end
    object BtnAtualizar: TButton
      Left = 221
      Top = 6
      Width = 120
      Height = 25
      Caption = 'Atualizar <F5>'
      TabOrder = 0
      OnClick = BtnAtualizarClick
    end
    object BtnLimpaCondicoes: TButton
      Left = 357
      Top = 6
      Width = 120
      Height = 25
      Caption = 'Limpar Campos <F2>'
      TabOrder = 1
      OnClick = BtnLimpaCondicoesClick
    end
  end
  object BtnImprimir: TButton
    Left = 288
    Top = 327
    Width = 97
    Height = 33
    Caption = 'Imprimir'
    TabOrder = 3
    OnClick = BtnImprimirClick
  end
  object DSListagemClientes: TDataSource
    DataSet = QryClientes
    Left = 344
    Top = 184
  end
  object QryClientes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT * FROM CLIENTES')
    Transaction = DM.TransRead
    Database = DM.DB
    DefaultFormats.DisplayFormatTime = 'HH:MM'
    Left = 344
    Top = 120
    object QryClientesCOD_CLIENTE: TFIBIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object QryClientesNOME_CLIENTE: TFIBStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 504
    Top = 160
    object EditarCliente1: TMenuItem
      Caption = 'Editar Cliente'
      OnClick = EditarCliente1Click
    end
  end
  object frxReport1: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43813.885078599500000000
    ReportOptions.LastChange = 43813.933380416670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 176
    Top = 144
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object RbTitulo: TfrxReportTitle
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CRUD:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baCenter
          Left = 255.118275000000000000
          Top = 18.897650000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Relat'#243'rio de Clientes')
          ParentFont = False
        end
        object Date: TfrxMemoView
          Align = baRight
          Left = 638.740569999999900000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
      object MDCliente: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1COD_CLIENTE: TfrxMemoView
          Left = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'COD_CLIENTE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."COD_CLIENTE"]')
        end
        object frxDBDataset1NOME_CLIENTE: TfrxMemoView
          Left = 147.401670000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_CLIENTE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NOME_CLIENTE"]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 37.795300000000000000
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Cod')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 147.401670000000000000
          Top = 7.559059999999988000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 283.464750000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 653.858690000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Page]')
          ParentFont = False
        end
      end
      object Line: TfrxMemoView
        Left = 3.779530000000000000
        Top = 241.889920000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[Line]')
        ParentFont = False
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'COD_CLIENTE=COD_CLIENTE'
      'NOME_CLIENTE=NOME_CLIENTE')
    DataSet = QryClientes
    BCDToCurrency = False
    Left = 176
    Top = 208
  end
end

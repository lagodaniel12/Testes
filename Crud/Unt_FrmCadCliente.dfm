object FrmCadCliente: TFrmCadCliente
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeftNoAlign
  BorderStyle = bsDialog
  BorderWidth = 4
  Caption = 'Cadastro de Cliente'
  ClientHeight = 119
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LbTitulo: TLabel
    Left = 0
    Top = 0
    Width = 436
    Height = 13
    Align = alTop
    Alignment = taCenter
    BiDiMode = bdRightToLeftReadingOnly
    Caption = 'Cadastro de Cliente'
    ParentBiDiMode = False
    ExplicitWidth = 95
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 23
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'Cod:'
    ParentBiDiMode = False
  end
  object Label3: TLabel
    Left = 8
    Top = 62
    Width = 31
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'Nome:'
    ParentBiDiMode = False
  end
  object EdtNome: TDBEdit
    Left = 42
    Top = 59
    Width = 383
    Height = 21
    DataField = 'NOME_CLIENTE'
    DataSource = DSClientes
    TabOrder = 1
  end
  object EdtCod: TEdit
    Left = 42
    Top = 29
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
  end
  object BtnGravar: TButton
    Left = 42
    Top = 86
    Width = 111
    Height = 27
    Action = ActGravar
    TabOrder = 2
  end
  object QryClientes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CLIENTES'
      'SET '
      '    NOME_CLIENTE = :NOME_CLIENTE'
      'WHERE'
      '    COD_CLIENTE = :OLD_COD_CLIENTE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CLIENTES'
      'WHERE'
      '        COD_CLIENTE = :OLD_COD_CLIENTE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CLIENTES('
      '    COD_CLIENTE,'
      '    NOME_CLIENTE'
      ')'
      'VALUES('
      '    :COD_CLIENTE,'
      '    :NOME_CLIENTE'
      ')')
    RefreshSQL.Strings = (
      'SELECT * FROM CLIENTES'
      ''
      ' WHERE '
      '        CLIENTES.COD_CLIENTE = :OLD_COD_CLIENTE'
      '    ')
    SelectSQL.Strings = (
      'SELECT * FROM CLIENTES'
      'where COD_CLIENTE = :COD_CLIENTE')
    Transaction = DM.TransRead
    Database = DM.DB
    UpdateTransaction = DM.TransWrite
    DefaultFormats.DisplayFormatTime = 'HH:MM'
    Left = 376
    Top = 16
    object QryClientesCOD_CLIENTE: TFIBIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object QryClientesNOME_CLIENTE: TFIBStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
      EmptyStrToNull = True
    end
  end
  object DSClientes: TDataSource
    DataSet = QryClientes
    Left = 208
    Top = 24
  end
  object ActionList1: TActionList
    Left = 288
    Top = 24
    object ActGravar: TAction
      Caption = 'Gravar <Ins>'
      ShortCut = 45
      OnExecute = ActGravarExecute
    end
  end
end

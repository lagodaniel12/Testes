object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 486
  ClientWidth = 848
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
  object btnCadastrarCliente: TButton
    Left = 16
    Top = 24
    Width = 105
    Height = 25
    Caption = 'Cadastrar Cliente'
    TabOrder = 0
    OnClick = btnCadastrarClienteClick
  end
  object Button1: TButton
    Left = 16
    Top = 87
    Width = 105
    Height = 25
    Caption = 'Listagem Clientes'
    TabOrder = 1
    OnClick = Button1Click
  end
  object BtnCadProd: TButton
    Left = 16
    Top = 55
    Width = 105
    Height = 25
    Caption = 'Cadastrar Produtos'
    TabOrder = 2
    OnClick = BtnCadProdClick
  end
  object BtnListProd: TButton
    Left = 16
    Top = 119
    Width = 105
    Height = 25
    Caption = 'Listagem Produtos'
    TabOrder = 3
    OnClick = BtnListProdClick
  end
end

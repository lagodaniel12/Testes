object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 275
  Width = 438
  object DB: TpFIBDatabase
    Connected = True
    DBName = 'C:\Users\LAGO\Desktop\Vendas\DB\BASE.FDB'
    DBParams.Strings = (
      'lc_ctype=WIN1252'
      'password=maps3880'
      'user_name=SUPS')
    SQLDialect = 1
    Timeout = 0
    LibraryName = 'C:\Users\LAGO\Desktop\Vendas\fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 32
    Top = 64
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DB
    Left = 128
    Top = 72
  end
  object TransWrite: TpFIBTransaction
    DefaultDatabase = DB
    Left = 128
    Top = 152
  end
end

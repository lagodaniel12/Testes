object Dm: TDm
  OldCreateOrder = False
  Height = 269
  Width = 421
  object DB: TpFIBDatabase
    Connected = True
    DBName = 'C:\Users\LAGO\Desktop\Cadastro\DATABASE.FDB'
    DBParams.Strings = (
      'lc_ctype=WIN1252'
      'password=maps3880'
      'user_name=SUPS')
    SQLDialect = 1
    Timeout = 0
    LibraryName = 'fbclient.dll'
    WaitForRestoreConnect = 0
    Left = 56
    Top = 56
  end
  object TransRead: TpFIBTransaction
    Active = True
    DefaultDatabase = DB
    Left = 160
    Top = 56
  end
  object TransWrite: TpFIBTransaction
    DefaultDatabase = DB
    Left = 168
    Top = 160
  end
end

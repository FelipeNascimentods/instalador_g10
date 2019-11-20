object dm: Tdm
  OldCreateOrder = False
  Height = 66
  Width = 88
  object zConn: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    HostName = 'localhost'
    Port = 5432
    Database = 'db_sgc'
    User = 'postgres'
    Password = 'acessog10'
    Protocol = 'postgresql'
    Left = 8
    Top = 8
  end
  object zq: TZQuery
    Connection = zConn
    Params = <>
    Left = 48
    Top = 8
  end
end

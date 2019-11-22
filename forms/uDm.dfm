<<<<<<< Updated upstream:forms/uDm.dfm
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
=======
object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 118
  Width = 268
  object ZConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Connected = True
    HostName = 'SG-dbsgc-1422-master.servers.mongodirector.com'
    Port = 3306
    Database = 'db_bank'
    User = 'sgroot'
    Password = '48jUpcfw1Iwv1l-P'
    Protocol = 'mysql'
    Left = 64
    Top = 32
  end
end
>>>>>>> Stashed changes:forms/uDmPrincipal.dfm

object frmInstalador: TfrmInstalador
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Instalador - G10 Sistemas'
  ClientHeight = 506
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnBot: TPanel
    Left = 0
    Top = 447
    Width = 687
    Height = 59
    Align = alBottom
    Color = clScrollBar
    ParentBackground = False
    TabOrder = 0
    object barraDeProgresso: TGauge
      Left = 8
      Top = 14
      Width = 450
      Height = 28
      Progress = 0
    end
    object btnInstalar: TSpeedButton
      Left = 479
      Top = 14
      Width = 90
      Height = 28
      Caption = 'Instalar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnInstalarClick
    end
    object btnCancelar: TSpeedButton
      Left = 580
      Top = 14
      Width = 90
      Height = 28
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object lblProgressBar: TLabel
      Left = 8
      Top = 41
      Width = 70
      Height = 13
      Caption = 'Instalando...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnClient: TPanel
    Left = 201
    Top = 0
    Width = 486
    Height = 447
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object Bevel: TBevel
      Left = 6
      Top = 52
      Width = 475
      Height = 5
      Shape = bsTopLine
    end
    object lblTitulo: TLabel
      Left = 13
      Top = 27
      Width = 112
      Height = 25
      Caption = 'Instala'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Memo: TMemo
      Left = 13
      Top = 173
      Width = 461
      Height = 260
      BevelInner = bvSpace
      BevelKind = bkTile
      BevelOuter = bvNone
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object pnLeft: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 447
    Align = alLeft
    Color = 1556970
    ParentBackground = False
    TabOrder = 2
    object Image1: TImage
      Left = 23
      Top = 14
      Width = 152
      Height = 152
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000001000000
        01000802000000D3103F31000000097048597300000B1200000B1201D2DD7EFC
        00001DEA4944415478DAED9D0F5015479EC7C788111523AEA860E084882E5C41
        2D96B02B279678EA06565C4949165971C5C2443DF1C4134EB3C1032E1875C502
        4B5D75D5C2941A70C5120F7290855CB4C4D31478B2857B7091043C30A292882B
        ABA824DE7799BA57041E8F99E9EE790FFBF729CB427CAFA767A63FBFEE9EE93F
        431482909821F6CE0041D8131280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280901A1280901A
        1280901A1280901A1280901A1280901A1280901A1280901A1280909AC12A80CB
        C8977C3D5FF69E34CC73C23037D7A1AEA3FFFA47FDAFCE27DFB57EDDD5F1F8BB
        963BCF9A6E3F6B687ED6D6DEC5F7E8E1E1E1090909E69CE99123472A2B2BCD39
        562F9C9C9C7CBB717777F7F4F474EDC6F2BFEDDDB4B4B4B4B6B63674D3D5C5F9
        3A9BC06012C0CF7B78F88C91E13346FD68DA70FCACFD8BF0E16A5D6765CD23FC
        B952FBB8EBDBE78C39B976ED5A5050903967BD72E5CA63C78E99732C80B20EBD
        C3C2C27EF2939F040404383B3B6BFC626767677D7DFDA54B97A0EBF9F3E76185
        6979666110081016343266DE2B4BE68D46B0674F0D35C3B9F30F57657DD5F9C4
        A006D1D1D167CF9E35EDF4CD1100617EE9D2A58B172F0E0E0EE692607575F5B9
        73E70A0A0A503388CE3C0B8E2B80FB38A755D1AE898BC7A29DC337E5A2F30FDF
        486936FC7533C3BF2258000478F8BC7AF56A447D4187408570E8D0A1C2C24254
        11820EC182230AE0EBF5725AA25BEC4FC738BF2C247BD37FF965CDE7066F86C9
        E15F1126008AFE9A356B366FDE8C368F09678116D1EEDDBBD19F41B7C184C369
        C7B10440D4DFB17EC2B2C8314E4345656C70857F458000E8DA2625259956F47B
        D2D6D6B66DDBB67DFBF6394E77D951044089DF92E0F66EA29BA0A86F8125FCA3
        959C9F9F6FF295E12B404444C4DEBD7BD1E237F92C7A825EC1FAF5EBCBCACAEC
        98070B0E21C0CCC01179E993743DD831064BF847E0ACABAB33BFE8F012C0D5D5
        352727C7B4A7B7038293DAB871A3DD5B447616A03BF08F4B7F7BBCB8368F85AE
        6F9FFBC77CD1D0FCD4D8D75174F2F2F2CCBE409C04401FF7F8F1E39E9E9EE6E7
        DF062D2D2D38BB8A8A0A3BE6C19E02B8B90ECD7FDF73FE8F479973B80F4ADA13
        32BE32F65D7B857F858700696969E9E9E93805F3333F20E80C646666666565D9
        2B037613000D9ED2BD7FE3EDC1F911677F0CD2F0AFB009E0ECEC8C6CA3EB6297
        9C6BA7A0A0E0ADB7DEEAE8E830FFD0F611202C68244ABFCB88974C3BE2200DFF
        0A83002E2E2EA5A5A561616176C9B65E2A2B2B232323CD77C00E02985FFA076F
        F8578C0AE0EEEE5E5E5E1E101060AF6C1BA0BEBE7EEEDCB9268FA1305B00F34B
        BFC216FED18AB871E3861DBB8F060440ECAFAAAAF2F3F3B3579E0D030766CF9E
        DDD6D666DA114D156066E088F2DF4E36B9F4773E7D1E186B3CFC272727E7E4E4
        9899E15EE8156070B57CFA62725BC83C01BC270DBB9CE7E33ECEEC67117BF2BF
        49DE6DB05645F86F6C6C34FF8D694FF40A70FAF4E99898183B66989DA2A2A237
        DE78C39C63992480CBC89750FA03A6087FD5D50B847F9F45375ABF36F8E2DDEE
        E15FD129404646467A7ABA7D33CC856DDBB6A5A5A59970209304C8CB989410E5
        CA9E8E5E067BF857F40810111181C68F7D73CB1134844C182E618600F13F1B73
        FC5F5F35E140BD7801C2BFA259003737B7BABA3AFC6DEFFC72035DE1C0C040D1
        0F85840BE03971586DC16B96F98A66C212FE5D5D5D519EEC1EFE15CD02141717
        474545D93BB39C29292959B46891D0430817E06CB65774F868D147E90B63F877
        9CC6B41601D0EB45DFD7DE3915425C5C5C414181B8F4C50A10357B74718E97D0
        43F447E6EFEE65FCEE9EB1EF22FCA3F5DF7302B81D19500017171754568E36D0
        8D1768024D9D3A55DC53518102380D1D525738C5D7EB6571875069687E7AEB6E
        57D3ED67EA3FDDC70D1D37C669C1BA9BED0FBF359620C7451F5E7FFD75C676D4
        8002985359A1455E5F5F7FF3E64D752E8B9393D3E4C993D50523441F5AE81321
        8102AC5932F6C03B1E82126FB9FBECCC270FCB2E7754D63CEA78F49DB8B360E4
        FCF9F373E6CC6149C1B600287FA8ACB4AFDDA08BCECECE8F3EFAA8A8A80867D1
        D2D2D25F06E6CF9F8FEEC7E2C58BC565C3C7C747506F58940008FF8DC5BE5CD6
        71E8054AFCEE135F975CEC605FDDC404440B909B9BBB61C306EED9363085172D
        46549B82665AEED9B3273939997BB28A38011216B9E6A54FE29B261A39A9B977
        0A3FF9B3A03C8B40A80022FA2A08B728FA595959C61671402580E6CAA64D9BF8
        D606E80378797989983E264A806B1FBE16348DE7253878E67EEA9E3B8EDCDAB1
        8A500152525276EDDAC531B7D7AF5F8F8B8BC3DF8CE90404041C3F7E9CEFEA01
        A9A9A9D9D9D91C13541122C0CCC01197F37C78A586A6CEDAEDAD478AEE8BC8AA
        68840A505757C771C827DAFACB972FE7F5BCC5C5C5252F2F8FE3A8A4A6A626F4
        0478A56641880047B64E4A5CCCA75E46E98FFBF52D739A3DE8B5CF0C1CC974E2
        45F7D145E9F91B71028485855DBC7891D7B91F3C7870FDFAF57C572B71727242
        05C5B1ED3E7BF66CEECBA4F21700DDDFDB1F4F7373E5F0EAD7CCD2EF3ECEA9B1
        782AE3A22C2B33BF3A56FCBD76AA3801506457AF5ECDE5DC0B0B0BD1F211B456
        0FC7D1A9478F1E5DB56A15DFECF11760FE8F4795FF763297A4B61EB89775D4E0
        CB2CBDE46E72DF10F703C644CC14A0B9B999CBCBAFEAEA6A445671EB16A2378C
        9A8ACB92A3ADADAD1E1E9C1FACF31760DF3FBBAFFB056B4902E7AF3E9ABBBA89
        7BF6ACC225FC2B260A80F2545555C57EE268F1070606A279CD9E940DBCBDBD6B
        6B6BD12B604F2A3434F4CA952B1CF3C65F80BA425F3F6FD6B7BF9D4F9FFBC734
        347DF58C7BF6ACC24B5AD304D8B265CBF6EDDBD933BC71E3C6DCDC5CF6740684
        D7D0DA77DE7967C78E1D1C33C659003757A77B15D3D8D36119C9A3175FAF97EB
        0AA7705999CB34014A4A4A162E5CC898DB8686067F7F7F7396E9E4B5B2465959
        59646424C78C711680CBE8B7F687DFFAFCBCC1F0481EBD1CCB98B482D3641DD3
        04B87FFF3EFBFB2F93B7DEE0B2B8467B7BFBD8B16339E68AB3006989E3DF5B3B
        9E3191FDBFFF26E93726AD8DC131FC2B66098026756363236356D1A1F4F2F232
        7395665402E8B8B30F94F0F1F1E1D869E12C40C1FB9EB13F7D85311196059CF5
        C231FC2B6609101515555C5CCC985571A36B6CC065E4D2A2458BD002E49525CE
        02541D7F2DD89F6904043ABE3E3FBFC13757FDC137FC2B6609C0A5433977EE5C
        E48DD7896B84CBCB3BBE1D77CE02DCABF821E32B309645ACF4C237FC2B660990
        9D9DBD69D32696343B3A3AD092367F970AB482D07B617C1ECAB7EEE22CC0F3EA
        BF654C61FD6F5AF7FDFE1BBEB9B24AC094E1D73E7C8DEFB2ECE608807FAE58B1
        8225CD2B57AE848686723C71ED5CBE7C79E6CC992C299C3C79323E3E9E577E78
        DE7ECF09C39AFF7D2A63227357DF3C7FF52F1C73D51F22262B9B23007B9A22C6
        1468E4C891238989892C295CB87081E3967E3C05F09EF472E3BFB13EE8F5F979
        43D357069731D44ED03467847FEEC90E1601323333333232B89FBE16D8277092
        001C10B456C5601160EBD6ADF6DA9382BD074F02B02228FC2B834700D34640F4
        65CD9A35070E1C604981046045DC52458345006A0259703801427ED558FDDF8F
        39E6AA17E2C2BF327804D8BF7F7F525292A08B601BF677618E2B80F3F0218F2F
        F93326F2E6E616A133603E3DE41D3E8369DA970DDE48692E3AFFB0E76F440850
        5050101B1BCB92E6471F7D64AF7514D987F19D397386E34C4BCEEF011EFFA73F
        E3A8FADD27BE4EC9BDC3375716C2678CFAF4109FC93A5699BDAAC9842991EC73
        C1DADADAC68F671DB2650CF6793C870E1D424782577E380B5057388571BFEB2B
        D71F8726B08EF4EA0FA1E11F78FDEC46CBDDEFCD6110210097C900FEFEFEF5F5
        F5E22E85557C7D7D6FDC601DE7C2F7111667014A72FF666118D38BEEAE6F9F7B
        BCFE795B3BFFB1D0A2C37FE7D3E723FEAEAED72F4508C065295CBB3C08E2328A
        89EF72B99C05E032B356D068081B8B3EBC3AC1897DBFEE9ACF3BA7FFF2CB5EBF
        1421405050D0B56BD718735B5D5D1D1212C298885EAAAAAAD827074F9F3EBDA6
        A6865796380B101F39E6F87BAC7B615CFFE24960EC177C33661B2EDE9E2C7D10
        BFF556AF5F8A10C0C9C9E9E1C387EC4BAF410068C0988876B8CC63EEEAEA1A3D
        7A34C729FC9C05089832BCF6D414F674FA3E4E1107AF19F11B77B7E6E6F7AEB8
        04CD08E3124ACDDC8B0E9C3D7B363A3A9A3111EE1517FF49F1F73FFD21FB7E30
        F54DA804BE3467F9DB83EF78AC5EC261969DD5793C8204E0B526AE88A5A6ACC2
        6B192FEEF378F80B50B8D373C93CD649618A59F3E267068EB878C49B7D5074FB
        C36FC7CEFD9FBEBF172400AFFDF0EAEBEBD1A416B728900A5A6BE8B47059C591
        EF7430458400ABA25D0FA77158171AE13F746593D0B7C2A8A9AE7DF89AB70787
        35DCAD7600146102B8B8B8DCBB778FCB0ACC26CC8DE4555F41D4F1E3C7F3DD2D
        86BF006EAE436F7F3C8DCB449396BB5D21CBBF34BCCF976D90C3E25CAF88500E
        AB3581E55B6F9D287DD0F7F7E25686E3D2A4B67D082E70590C424544A745C8E2
        B8E5BF9DCCFE5451A5BEE9E9DCD54DDC1D40E9CF7FFFD5181E4D35D0F1F83B8F
        D73FB7BA74BB3801E2E3E38F1F3FCE25FF5D5D5D7171718585855C52EB494C4C
        4C7E7EBE93931397D4962F5F7EE2C409BE391422009787A116E0C08275375BEE
        705B258E6FE9576CCE63162700DA3F680571596F50E9760007E25BBC962E5D0A
        4579957EB47C3C3C3CB8EF96274400E7E1436E974DE3B837306A80B85FDFE232
        55D273E2B0D33B3CD1F7E578BEA12B1BAFD45AEFAB08DD1F80E302D12A3B77EE
        4C4B4B639F2C8F429F9595B579F3668E79E33B04C882A81D62B293276E8A1FC7
        3141F489F7E47F93F1BB7B2C9BC4242C72CDF9A7897C77EDB6FA02D882500102
        02026A6B6B399E8BD2FDA0FDADB7DE6279D58A5C1D3E7C9871E67B5F020303D9
        B7AEE98B280178BD5DEA05AA82AD07EE9D286DEF7CA2EF1501FA24EFAD9DC037
        F0ABF4D7FD5511BD491EC7AEB005D400274F9E44086F6868D0F5455F5F5F5420
        CB962DE3D5ECB1206ECB7881DBA41E499B94182D64AF6968F041F183823F3C18
        700139347862FEFE156423600AD318D5FE68687EEA1FF3858D1776A205E0322E
        C82AD0A0ACAC0C26A0F0D96E79A31F327FFEFCC4C4C4888808EE455F45DC325E
        0205105409F404265CAA7974FD8B274DB79F59D652771F3714E5DECF7BF8AC1F
        8D645FA8DD36E899C0431B1F102D8022A612E8094C40BBE8B3CF3E4385D0DADA
        DAD6D6865FBAB9B9B9BBBB23E4CF983123383858D00EC12A42876C082C9D206B
        ED847713DD841EC28EA0E38BEEAFEDCF9820809F9F1F7A028242AFDD817E68FD
        8B9BBA20560097912FD59E9AC2E555ABA3A1F145B50902801D3B76F07DE4E238
        ECDEBD3B2525455CFA62055038ED18E080ECC9FF2679F7C06BB89B23005AE1A8
        04BCBDBDED7D5538D3D4D484F0CFFDD97F4F840B00F2D25F4D5834C684039946
        7DD393905F356A79206B8E00203C3CBCBCBCFC056B0899B084B51902A02174ED
        C3D77C3DC5F6474D43D7283DD304505EB886D0CE9D3BB76CD922FA286608A074
        AFC673F1A8B7CB8897CC399C5074CDD8345300847F54021CD7CCB123B86E0B16
        2C30610177930450780F10B217C74ADA57EAD9BEC04C0180BBBBFBE5CB97077B
        67A0A5A5252424A4B5D58C6DB2CC130064BC3D3EFD6DFB2C47C385F3571F2DF8
        879BBAE6A9992C80D2FD54B4AAAA8AD72039F3419737343454C4A807AB982A00
        C8D9E49ECC3CFDDC2E5CA97DBC60DD4DBD2391CC1740E99E7F585A5A3A181D40
        E98F8C8C346796A68AD9022883D301C3D312EC228032381D30BFF42B76114019
        6C0E54D63C8AFCC7FF35360AD55E022883CD01BB947EC55E02802D096EDB9326
        D8EBE8DA293AFF70F9BFDC323C06DB8E0228DD2393CBCBCBD9B7E6150DFABB28
        FD1C97BBD28EDD040031F35EC9CB98E4C8CF46771E6B4B3B708F657516FB0AA0
        743F173A7BF62CF7D1F91CA9AEAE5EB4689139CF7CFA624F0194EE85B4F2DFF7
        1434569985F687DFAECCFC8A7D712EBB0BA074BF1FC8CECEE6B22E0377F6EFDF
        9F9C9C6CFE86AD16EC2C80D23D7F327BC3C475BF70A02EC1F9AB8F5666DEB28C
        AF664ACA010450898A8A3A70E000E3D2E41C69696959BB762DDF457E0C607F01
        54C282461E4EF3605C5A9D1D04FE77F6DD3D78E63EAF041D4700E0EAEA8AAA80
        7197522E1C3D7A342525A5BDBD9D3D29461C4500A57BB186A45F8C4D7F7B3CDF
        39BB1A4143FF68517BDA81BB7C576677280154D01FD8B56B57585818C734B553
        5959999A9A7AE5CA15BB1CBD2F0E24800A4A7F72DC0F36C4FDC0340D50F44F96
        3EC83ADAD6D0CC7F733E071440253A3A3A3D3D3D2828887BCAFD515353939999
        59545464DA11B5E07002A8A0F427448D41C7C0D74BE0185234783E2879909BFF
        3597E6BE551C560095F0F070748ED13D10378E1A1D5C34F4D1D9ADA8A8107408
        161C54000BE13346C5FF6CCCE239A3DD5CB955089D4F9F577CF697537F7850F8
        1F7FD6BBBA845E1C5C0015F48CE3E3E3636363F9560808F9A74E9D3A71E204FA
        BB42F3CF82A30BA082EE41F88C91F37F3C6A4EF0A8607F67630B8FA28573E1BF
        1EA1E897543E64595C48178342000BDEDEDE11DDCC9A35CBCDCDC864EEB6B6B6
        4B972E21D823EA37353599936D160687003D711E3E24689A33FEF8790FF7F618
        36719C93BB9B93ABCB4B963E03027CEBD75D28E2B7EEFE75A9888696A7D71B9E
        54D775B6B5DBE161F3E012A027BEBEBE0101017EDD408C8913273A3B3BC30A75
        6C45474707CA7A6767E79D3B7750D01B1A1AAE77A3772921BB33F80420088E90
        0084D4900084D4900084D4900084D4900084D4900084D4900084D4900084D498
        2AC0CC9933C3C2C23C3D3D9D9D9D9B9A9A2ABBD19B485454544D4D8DDEE125EA
        260E414141387A7B7B7B434343494989C644F05D1C54E312F81D1D1D45454503
        4E71F2F5F5D53220B9A69B013F86BC454444545454E85A4716970217C4F09414
        2727275C16DC4175C700C3209DF0F0F0E0E0606F6F6F5C37DC1A9CC88BB62E10
        4EEFF0E1C37DC75AE9DD910A85E6E2C58B1F7FFC31EEB7F6A3A7A4A4BCFBEEBB
        AEAEDFDBAE06D7FA830F3E484E4E1EB0D0A4A5A5BDF7DE7BDA0FF7E69B6F0EB8
        E5685D5D9D969DD391B7D1A3476B39C15DBB76E174121212B4E7F3DAB56BB823
        A1A1A1C646E7E3D2E5E4E430EE5E111313B377EFDEBED3F6CBCACA50304C1845
        67860028B59F7EFA29446F6D6D3D77EE5C7D7D3D0A5F4040C0E2C58B71E6BAD6
        C340A84052172E5CD0BE02266E92BA133A6E33BE8800E3E6E6366BD62C753F1F
        183877EE5CDB0EA0A4A284F51A308C1410C5A1EE1FFFF8C79EBF475219191903
        06C5C6C64604BC3367CED83E34729B959535E039E288E9E9E9B8AAD3A74FD718
        3BA3A3A3CF9E3DAB30ACC07CE3C60D5C011C74EAD4A9C6C6BDAD59B3E6C08103
        4AF732E8B8143859546588954B962CC10F282DC89BB8AD3154CC1040BD52088A
        2B57AEEC79BFD1B4C8CBCB430C4071C145D432414EAF006A8D6175135C04BFD2
        D25218585050101717A7F7A48E1D3BB662C58ACCCC4C143E03D74415C0C7C787
        CB9049550045CF6E426AF8578C0A80F081ABA7FE6C6C0F0B84A1E6E66614F4BE
        7BB3A26D969F9F8F7B87F802A5D9AF8F0D840BA0EEE28672EFE5E5D5B78823AC
        A280A26F80F3D4D210D22B406E6EEE860D1B4E9E3C191F1F6F356F383A028F81
        ABEC9802002D57D212FE15A302141717A30380FE03FE46FCC2CDEDECECD49582
        BAD33DEAABC0C0C0BEFF0B3D506CD06AB55A6C38225C00B5C8A2F981B6A6D50F
        A8836C35B6F6F40AA016D3B56BD71E3C78D0EA077068C41E0397D80105C08920
        A068A904D4F08F36062A40030220E7C83F0E87D20913D068417BFDC8912306F2
        6CA3DF820602CA06630F7B40840B80AB53555585D3F0F0F0605FFEC5580DB07F
        FFFEA4A424BEE7E58002A07F3567CE1C444DDB95801AFEE1C9D8B163F1790302
        6467676FDAB4096D5A74F757AD5A75F8F06174A54242427425A2D6001515150B
        162C60BF028631AF0F60B8ACF4C4581F40C48ADB0E2800A22952C30FB62B0135
        FC431244070302202ADFBE7D1B9AA95FB4FC53EFD324543EB808F8BA968766E2
        30430074985051A2762E2B2B4330C65533BCED9981A7400833083668A1E2D0E8
        EF2256713929C7142039391929DBA804D4F0AFC65D75B69A5E01D447373DDBEE
        6A357BEAD4A9A54B97EACAB6E52910728E1614FC317F893893DE03C081BCBC3C
        F571AFFAB2E34F7FFA137C40ACD2D5C8332080BA30E0BA75EBD4E79870AFBEBE
        FEEAD5AB3834CA81E12BCE45803D7BF658ED7EA078E90A8A3DDBD3EACFFD5502
        6AF8570BBD3101D414D6AF5FBF6FDF3EF5377E7E7E7575756A9740EF129F7020
        2727477DC988208582815B83FB82D3D7DBAB3686796F8211961089972C59825E
        8165CD6E9C24CAD08E1D3B342662400095808000B456E7CD9B87BB6579A28FCB
        BD7CF97263AF81B80860E3034386E8B8353D05C075EEAF12983F7F7E7979398A
        3B0ABDF2FFF3957509606952F67A38535A5A8A18B775EB562D6F2D7A81B0885B
        B370E142786579DD0E915253537B3DB916817DC602E19C71291195D5728C5882
        88A2E58B8605E80964C0DD42ADEDE9E989B8851260604486D01A00ED225D13E1
        7B3D51E9AF12C0A5C375B394780302A00D191B1B7BE8D02144EE9EBF575B5628
        B51083A51983BE22728882A1BEA3B0F1F88E17761E0CA7BE4EC70FB367CFD652
        0AB908A0825A08710B1EA21E983A75AADEAF3B661F4015C06A25A05E3A4BF857
        F40B80B0D5DCDC8CFA13ADFF5E4F14F04B1C1101854B8F16A9A154242525A181
        00A3843E09B5FF6850440EC40FC44275C0826D380AA0F47810111212A2B773EC
        C80228D62A815EE15FD12F809A667FAF74D4115388628865EC670407D0AF4085
        60E00D832EEC2F80FA20F9934F3E410B75C00FF31500A0458B4A003D01BDCD4D
        0717A05725A05EB75E230B7409801289F0AF65B3198D2FF507447DB8C4E5E9B9
        0D840B80E2E5E6E66663495455008D033C7509807BB674E952DC0C1B6F00D442
        F0E209A07CBF1250C33F7EE879237409802B999F9F8F1E4BAFC17F3D993C7932
        4EAA6F0FC12AA8F6D1B6B1D1EE555FB70D7A01D4B760717171E83F59FD004ADE
        B265CB443481D44716E899F9FBFB5BED6B224022AAA13360206839BE00964A60
        E3C68D6852F71D58A64B00B5AADCB973E7962D5BFAFB8C3A420E0D770F0F0FDB
        A34B90ABFBF7EFDB1EBE5A5B5B1B1010207A613CE102A84DC38E8E0E9C49DFEE
        91FA3E5CD15C6FEAAD017011FDFCFCD06C8581BD8A1ACA3D0E8D38D4DF782CDB
        38BE00CAF707C9F50AFF8A1E01D4118D28AFC8B0ED515BEA3C87D4D454C46FDB
        699E3E7D3A262606E10919EBF5241A376ED7AE5D0888B008471CDC83E17032A8
        3A71AA4AF7887C753E008204AA85D8D858755694EDB8D213BD7D00DC0C7C1E2D
        571CF1CC9933A8701B1A1A50F4714757AF5EADCE4658B06081815701421F835A
        406EB5B4CDFA13C05209581D57AC5D8083070FE272691966A73ED6D3F2600D0D
        63D42AEAACA0929212B481F12D9416447DCB3AD5A27BC08A399D609C15CA37DA
        73BDE66429DD2FC2B66DDBA6FDED892A80C61EB38AA7A7E7DEBD7B11E9FBFE17
        CB8B30DC98C4C4442DA1CE2A6ACB70C08F21E80E1B366CC08FA9D5ACD5C6774A
        4ACAF6EDDB5170FB4E7DACA8A898376F9E9607D06A5C8F8C8C2C2B2BB3FD49DC
        E2DBB76F3B3B3B7B79790D38C2179148DDB2A9EFEE04880BEBD7AF7FA15E84E1
        6C510A67CE9C89C8A7CE09AEAEAE46A348D7535E5C29DC63DC30BD4D7694361C
        1DD10547C7C5C5D171FB713B0DBFB5413A48101A181BD784AA4F8BC3B8445AE6
        ECE2DAAE5AB50ABD2C5D23111065910D44F7012F02EE1A3EACF19D148214828E
        F6B28B7A1857323838587D2F895B8390F4020E85200807840420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4860420A4860420A4860420A4860420A4860420A486
        0420A4860420A4860420A4E6FF002569D2F1978E83220000000049454E44AE42
        6082}
      Proportional = True
    end
    object cbxHD: TCheckBox
      Left = 9
      Top = 178
      Width = 186
      Height = 17
      Caption = 'Criando Parti'#231#227'o G:\'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cbxBanco: TCheckBox
      Left = 9
      Top = 201
      Width = 186
      Height = 17
      Caption = 'Configurando Banco de Dados'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object cbxArquivo: TCheckBox
      Left = 9
      Top = 224
      Width = 186
      Height = 17
      Caption = 'Copiando Arquivos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object cbxProgramas: TCheckBox
      Left = 9
      Top = 247
      Width = 186
      Height = 17
      Caption = 'Instalando Programas Extras'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object cbxAtalho: TCheckBox
      Left = 9
      Top = 270
      Width = 186
      Height = 17
      Caption = 'Criando Atalhos'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
  end
end

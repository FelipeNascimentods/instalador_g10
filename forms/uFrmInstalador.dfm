object frmInstalador: TfrmInstalador
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Instalador - G10 Sistemas'
  ClientHeight = 506
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnBot: TPanel
    Left = 0
    Top = 456
    Width = 529
    Height = 50
    Align = alBottom
    TabOrder = 0
    object btnInstalar: TSpeedButton
      Left = 398
      Top = 7
      Width = 125
      Height = 38
      Caption = 'Instalar'
      OnClick = btnInstalarClick
    end
    object barraDeProgresso: TGauge
      Left = 3
      Top = 7
      Width = 387
      Height = 37
      Progress = 0
    end
  end
  object pnLeft: TPanel
    Left = 0
    Top = 0
    Width = 167
    Height = 456
    Align = alLeft
    TabOrder = 1
    object imgLogo: TImage
      Left = 16
      Top = 8
      Width = 131
      Height = 105
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
        00400806000000AA6971DE00000006624B474400FF00FF00FFA0BDA793000007
        D44944415478DAED9A7B50546518C69F65D985BDB0BBA261AEE205974B368D8A
        56A664419AE2A50935322F8533A9CD644DEA34DA658AEEF64797997034AF983A
        63A44CA989B74951702C03A9A92658404C21C1CB2EBB0B2CBBC0F67D0716F6EC
        9DDD43C7559E7F16CE397BCEF7FCCEFBBDEFFB9D3D02DCE512F03D00BED50F80
        EF01F0AD7E007C0F806FF503E07B007CCB054076769E38EA86E903B26B29F977
        08DF03E44875C4E96EE340D93BD9D99916AF003E7B65E706D8B08EEF11F78904
        F874ED57CBD67B07B06A672DF950272F4881F2DE68BE87CC891AEB6EA234BF98
        FE59B73667D9505F006CF43375D5537C8F9B539DCA39C87C12002CCF7E0128DD
        5F048409903C6F4AC86E0B0A80FDCBA1BCAD1F405053A03381B0432CC4B60505
        E04E503F80DE02080529D503BB43BCF440111AFFBDC5DE4FFA18DACFDCB10006
        8D1C8CC797A7337F9FDE5A801B35F5ACFD51B131B87FF174840B0428FA644FEF
        004C5ABF986F7F6E151D29845C1CE671BFC9D2815BE6F6EEFFC3492F10231522
        FFED5DA10F2050F3F433EFCD5CEE01580CCDD069AF4057590773A309166333B3
        5D1C2545A4520E95468DE8F8588815524ECCFFB2F3286E5C6E70BB3F3C428489
        AB33DD9AA7E21480C5D882DAE2DFD1F07B356C1D1D5E072E20F32F3A3116C353
        9311A194056C9EDEF99FB6B8CE73474D5AB79871E46C9E53003A6D2D2A0F15A3
        DD628550088CD658314A63414C4C3B64B24E18A6A6305C6F10A2BA52846AAD18
        ED64B3502C8266CE640C481816907967B53699717AFB31345ED3B100840B5DCD
        7306E05A49392E9F2C81CD668326C18AC9292D50287B22E0C0B772C026C0FC85
        C6EE6D86C6309C3B2B41A556C444C3F027923164621267E625031568B96520D7
        0552DE58821899AB794E00D03B5F915F48BE61C314627CDC8456978BE47CA962
        06B2EA35BDCB99CB4A22505C24610025644CF51909FE9A1FB3681A4A72F299EB
        CEFBE0052602DC29280074CEFFB6F51013F62953D9E64DC6309C2D94E04A4D38
        2CD6CED38945360C1BDE86C98FB64035A02742CA4A2350448EA5D361ECF2B924
        594A82362F924970FED3BD0C80CC8FB23C3EE50C0A4075C1CF68F8AD129A782B
        66CE696299DFB7270A66B3FBAB4646DAB0708911F2A81E08470FCB98E970CFD8
        D1189D3E2968F334DC9926A7AF00B492D27671D3F71092D05FFC828135E7ED66
        468CB2226D5A0B64F2AE246812E0D449292E5F12B940A33961EF2E05DAC95448
        7EE96956890CC43C4D7867B61D25006C485B390B9E1430806B2515A8397101F1
        8916CC98D5CC3A76CB46252C1601B25E343077D931095208B95B95CC7458B1AA
        91F5BDE34764A8281761D4F489183C213128F3EE121EA700FEFEEE34F455B58C
        790AC11B00E724989F27672E312FD3C8FA9EB64284633FCAA08A53232933B5CF
        CD0705A06CCB41986F19B17499014A15BBE93972484A6ABD1823465A914AA640
        EE7685C72AE0A846320D76EF5020323A0A69AF66786C6F4F6C3C0C5DED0D4806
        2931E6396A3E127FED3E0E43ED75B7C7D3C551DA8A746E015CF83C8FC9FE2B49
        188B44EC85A25E27C4FE7D729724E8A90AD8D5D626C0E6AF944C35989FEDB9E3
        3CB1B98044581B929E799C31CF24BC8FF778BDD3991F67710CE00B02A09502D0
        1300AE27A673BDA8508A7F6819B4B04FE7AE0A3000ACC0E61C15C20980791E00
        18C9C246E7655557FBBC8A75FCD06FF47D03A06CCB2132050C5842A6804AE5BD
        EF7784E2A90A5035EAC914D8A9401409EDF43519DDDBE99CBF70A0188A1183A1
        1A9FD8639E7490F60ECF6EE47F03604F824FCE6A4242A29575AC73EBEB6F15D0
        968B71EC8814431286E2D1ACE9DDE64F6F2309AF5E87019A61485CF018EBCE3B
        AFEA7A058038CA7B2B4000F5A515B874FC0234A402CCF451061DAB80A9A90B80
        980078990D809AA71092E74E82E6912458CD16FCF4750163DE31E1795BD5F90D
        808CE77A4B3B4E7DB83B3000B4112ADBF403C2D0814559A4123834429EAA0005
        72EAA404976B44CCA269E66CA746285741CE26C0ECD717404A96C8F5957528DC
        71DCEF6CEF37802EF32D6D1D38BF616F6000A8ECAD305DFAA6CFED31E3A90AD8
        E52E091690EEB18A748F710F266062C664669BB1B503357F5F855C3D10C208B1
        5FD9DE270007F3544101B098BA1643A41A4C218BA1F18E8B2137558086FDF091
        6D4879AC1972794FE92C2B8944D1994888224498B93A0312D206FBCAF6597276
        F3956B12FB06E0643E6800CCDDAEAC45F98142062DADEFE37BB91CBEF86B04CE
        15772E87A72C4983FABE588FE61DB37DAF01900591B3794E0050D59794A3A6EB
        81489CC642A2C1CCCA09EE5A5FDAF59D3B23415565E7039171731E42FC23F779
        354F152880D4B797BA98E70C803D12B4F49118990E42D2C18E8AB7206EB41531
        311D24DC3B0D994C42343484A1BA4A844B5D8FC468D83FFCEC54A893627D9A0F
        0680A771730680AAADD98CABC57FA0FEA2D6AF87A223C6C5E1811913DCCE795F
        D9FEB60460172D917AED55E8AAEAD0AA37324F8EE809A54A296403E41892180B
        F59858A6D451198879BDD39DF795ED6F6B008EF2F5A3853BF38ED97ECDBB6DAC
        E33F7F2F3C7400046ADE31DB872C8060CC5385348060CD8724803F49D6367AC9
        DAB783EC3F8BF70D80BD2760BCE2FE07CADB457D0AC067D893858DBED57BD8F7
        5A6E7AFBDEAA370098576529414AF24E304F2396462EFC7A55F60E7E599A98DD
        B02667D91B5E0130AFCBDF6C7A9F40A0AFCBABF91E3447F2FF75F9BB4DFD00F8
        1E00DFEA07C0F700F8563F00BE07C0B7EE7A00FF01DF60BA8CEF5737CA000000
        0049454E44AE426082}
      Stretch = True
    end
    object RadioButton1: TRadioButton
      Left = 2
      Top = 119
      Width = 113
      Height = 17
      Caption = 'Criando Unidade G:\'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 2
      Top = 142
      Width = 167
      Height = 17
      Caption = 'Configurando Banco de Dados'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 2
      Top = 165
      Width = 113
      Height = 17
      Caption = 'Copiando Arquivos'
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 2
      Top = 188
      Width = 169
      Height = 17
      Caption = 'Instalando Programas Extras'
      TabOrder = 3
    end
    object RadioButton5: TRadioButton
      Left = 2
      Top = 211
      Width = 113
      Height = 17
      Caption = 'Criando Atalhos'
      TabOrder = 4
    end
  end
  object pnClient: TPanel
    Left = 167
    Top = 0
    Width = 362
    Height = 456
    Align = alClient
    TabOrder = 2
    object lblTitulo: TLabel
      Left = 206
      Top = 8
      Width = 144
      Height = 33
      Caption = 'Titulo aqui'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTexto: TLabel
      Left = 8
      Top = 46
      Width = 98
      Height = 182
      Caption = 
        'Funcionalidades:'#13#10'bla '#13#10'bla '#13#10'bla'#13#10#13#10'Modulos:'#13#10'Rotinas'#13#10'Financei' +
        'ro'#13#10'Pr'#233'-Venda'#13#10'NFCe'#13#10'Ordem de Servi'#231'o'#13#10'Comanda'#13#10'SPED'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object mLog: TMemo
      Left = 8
      Top = 234
      Width = 347
      Height = 207
      Lines.Strings = (
        'mLog')
      ReadOnly = True
      TabOrder = 0
    end
  end
end

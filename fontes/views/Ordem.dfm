object fOrdem: TfOrdem
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 567
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 21
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = _eCodigo
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label3: TLabel
    Left = 311
    Top = 105
    Width = 63
    Height = 13
    Caption = 'Entregue por'
    FocusControl = _boxEntregue
  end
  object Label4: TLabel
    Left = 24
    Top = 144
    Width = 79
    Height = 13
    Caption = 'Data de entrada'
    FocusControl = _eDtEntrega
  end
  object Label5: TLabel
    Left = 24
    Top = 184
    Width = 51
    Height = 13
    Caption = 'Valor Total'
    FocusControl = _eVlrTotal
  end
  object Label6: TLabel
    Left = 24
    Top = 105
    Width = 63
    Height = 13
    Caption = 'Recebido por'
    FocusControl = _boxRecebido
  end
  object Label7: TLabel
    Left = 185
    Top = 144
    Width = 67
    Height = 13
    Caption = 'Data de Sa'#237'da'
    FocusControl = _eDtSaida
  end
  object Label8: TLabel
    Left = 24
    Top = 232
    Width = 48
    Height = 13
    Caption = 'Criado em'
    FocusControl = _eAdd
  end
  object Label9: TLabel
    Left = 178
    Top = 232
    Width = 77
    Height = 13
    Caption = #218'ltima altera'#231#227'o'
    FocusControl = _eAlt
  end
  object Label10: TLabel
    Left = 311
    Top = 255
    Width = 67
    Height = 13
    Caption = 'Total do Itens'
  end
  object _eDtEntrega: TcxDBDateEdit
    Left = 24
    Top = 160
    DataBinding.DataField = 'dt_entrada'
    DataBinding.DataSource = dsOrdem
    TabOrder = 0
    Width = 145
  end
  object _eVlrTotal: TcxDBCurrencyEdit
    Left = 24
    Top = 203
    DataBinding.DataField = 'vlr_total'
    DataBinding.DataSource = dsOrdem
    TabOrder = 1
    Width = 121
  end
  object _eDtSaida: TcxDBDateEdit
    Left = 185
    Top = 160
    DataBinding.DataField = 'dt_saida'
    DataBinding.DataSource = dsOrdem
    TabOrder = 2
    Width = 145
  end
  object _eAdd: TcxDBDateEdit
    Left = 24
    Top = 248
    DataBinding.DataField = 'dt_create'
    DataBinding.DataSource = dsOrdem
    Enabled = False
    TabOrder = 3
    Width = 121
  end
  object _eAlt: TcxDBDateEdit
    Left = 176
    Top = 251
    DataBinding.DataField = 'dt_alt'
    DataBinding.DataSource = dsOrdem
    Enabled = False
    TabOrder = 4
    Width = 121
  end
  object _chkStatus: TcxDBCheckBox
    Left = 176
    Top = 38
    Caption = 'Ativo'
    DataBinding.DataField = 'status'
    DataBinding.DataSource = dsOrdem
    TabOrder = 5
  end
  object _eCodigo: TDBEdit
    Left = 24
    Top = 38
    Width = 121
    Height = 21
    DataField = 'id'
    DataSource = dsOrdem
    TabOrder = 6
  end
  object _boxEntregue: TDBLookupComboBox
    Left = 311
    Top = 119
    Width = 273
    Height = 21
    DataField = 'user_id'
    DataSource = dsOrdem
    KeyField = 'id'
    ListField = 'nome'
    ListSource = dsUserEntregue
    NullValueKey = 46
    TabOrder = 7
  end
  object _boxRecebido: TDBLookupComboBox
    Left = 24
    Top = 119
    Width = 273
    Height = 21
    DataField = 'user_recept_id'
    DataSource = dsOrdem
    KeyField = 'id'
    ListField = 'nome'
    ListSource = dsUserRecept
    NullValueKey = 46
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 0
    Top = 523
    Width = 859
    Height = 44
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 9
    DesignSize = (
      859
      44)
    object _btnSalvar: TBitBtn
      Left = 771
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000040000
        00130000001E0000002000000020000000200000002100000021000000210000
        002200000022000000220000002300000021000000160000000500000012281E
        16CB37291EFF463A31FFBD8150FFBC7E4DFFB97949FFB67646FFB37141FFB06D
        3DFFAD6839FFAB6535FF42362EFF3D3026FF241A13CE00000015000000193B2C
        21FF685C54FF483C34FFE8C28BFFE7C088FFE6BD85FFE5BB81FFE4B87CFFE3B5
        79FFE2B276FFE2B273FF443931FF51433AFF34261DFF0000001E000000183E2F
        24FF6C6057FF4A3F37FFD9B27DFFD8B07BFFD7AE77FFD7AB74FFD6A970FFD5A6
        6DFFD4A56AFFD4A268FF473B33FF5B4F47FF37291EFF0000001D000000164031
        26FF6F645CFF4C4038FFFFFFFFFFF7F1EBFFF7F0EBFFF7F0EBFFF7EFEBFFF6EF
        EAFFF6EFEAFFF6EFE9FF463B34FF5D5249FF3A2C21FF0000001B000000144434
        29FF73675FFF4F443CFFFFFFFFFFF8F2EDFFF8F1EDFFF7F1EDFFF7F0EDFFF8F1
        EBFFF7F0EBFFF7F0ECFF4A4037FF5F534BFF3D2E23FF00000019000000124637
        2CFF776B63FF50453DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF4E433BFF61544CFF403126FF0000001700000010493A
        2FFF796E66FF50453DFF61564EFF60564EFF60554DFF5F544CFF5E544CFF5E53
        4BFF5D524AFF5C5249FF5B5149FF61554DFF433429FF000000150000000E4C3D
        32FF7C706AFF674E44FF654B42FF634A41FF61473FFF5F473EFF5C443CFF5B43
        3AFF594139FF584038FF573F37FF63574FFF46362DFF000000130000000D4E3F
        35FF80746DFF6B5248FFF4ECE6FFE9DACEFFE9D8CDFFE9D8CCFFE9D8CBFFE8D7
        CAFFF3EAE2FFF3E9E2FF5A4139FF645850FF483A2FFF000000110000000B5142
        36FF827770FF70564DFFF9F5F2FFF4EAE4FFF1E6DEFFEBDCD2FFE9D9CCFF4E41
        3DFF60534CFFF3EAE3FF5D453CFF655951FF4C3D32FF0000000F000000095344
        39FF857A73FF755A50FFFAF6F3FFF5EDE7FFF4EDE6FFF4ECE6FFEFE2DAFF493D
        38FF5A4D46FFF4EBE4FF60483FFF655A52FF4F3F34FF0000000D000000075545
        3AFF887D76FF795E54FFFAF6F4FFF5EEE9FFF5EDE7FFF4EDE7FFF4ECE6FF473A
        36FF483D36FFE9D9CDFF644C43FF675A52FF514137FF0000000B000000065748
        3DFF898079FF7C6157FFFAF7F4FFFAF6F4FFFAF6F4FFFAF6F3FFFAF6F3FFFAF5
        F2FFF5EEE9FFF4ECE6FF695046FF82776FFF534439FF00000009000000034235
        2EC058493DFF7F645AFF998178FF967F75FF937A72FF8E786DFF8B7269FF866E
        64FF82695FFF7D645BFF6E544AFF56453BFF3F332BC200000005000000000000
        0002000000030000000400000004000000040000000400000005000000050000
        0005000000050000000500000006000000060000000400000001}
      ParentFont = False
      TabOrder = 0
      OnClick = _btnSalvarClick
    end
    object _btnCancelar: TBitBtn
      Left = 690
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000020000000C05031A46110852AB190C76E31D0E89FF1C0E89FF190C
        76E4120852AD06031B4D0000000E000000030000000000000000000000000000
        000301010519130A55A9211593FF2225AEFF2430C2FF2535CBFF2535CCFF2430
        C3FF2225AFFF211594FF140B58B20101051E0000000400000000000000020101
        03151C1270CD2522A6FF2D3DCCFF394BD3FF3445D1FF2939CDFF2839CDFF3344
        D0FF394AD4FF2D3CCDFF2523A8FF1C1270D20101051D00000003000000091912
        5BA72A27AAFF2F41D0FF3541C7FF2726ABFF3137BCFF384AD3FF384BD3FF3137
        BCFF2726ABFF3540C7FF2E40D0FF2927ACFF1A115EB10000000D08061C3D3129
        A2FD2C3CCCFF3842C6FF5F5DBDFFEDEDF8FF8B89CEFF3337B9FF3437B9FF8B89
        CEFFEDEDF8FF5F5DBDFF3741C6FF2B3ACDFF3028A4FF0907204A1E185F9F373B
        BCFF3042D0FF2621A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
        EDFFF3E9E2FFECE6EBFF2621A5FF2E3FCFFF343ABEFF201A66B0312A92E03542
        CBFF3446D1FF2C2FB5FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
        E2FFEADAD1FF7F6FACFF2B2EB5FF3144D0FF3040CBFF312A95E53E37AEFA3648
        D0FF374AD3FF3A4ED5FF3234B4FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
        E5FF897DB8FF3233B4FF384BD3FF3547D2FF3446D1FF3E37AEFA453FB4FA4557
        D7FF3B50D5FF4C5FDAFF4343B7FF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
        E8FF9087C5FF4242B7FF495DD8FF394CD4FF3F52D4FF443FB3FA403DA1DC5967
        DAFF5B6EDDFF4F4DBAFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
        EAFFFAF5F2FF8F89CAFF4E4DB9FF576ADCFF5765D9FF403EA4E12E2D70987C85
        DDFF8798E8FF291D9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
        D8FFF4ECE7FFE5D9DCFF291D9BFF8494E7FF7A81DDFF33317BAC111125356768
        D0FC9EACEDFF686FCEFF5646A1FFCCB6BCFF7A68A8FF4C4AB6FF4D4BB7FF7A68
        A8FFCBB5BCFF5646A1FF666DCCFF9BAAEEFF696CD0FD1212273F000000043B3B
        79977D84DFFFA5B6F1FF6D74D0FF2D219BFF5151B9FF8EA2ECFF8EA1ECFF5252
        BBFF2D219BFF6B72D0FFA2B3F0FF8086E0FF404183A700000008000000010303
        050C4E509DBC8087E2FFAEBDF3FFA3B6F1FF9DAFF0FF95A9EEFF95A8EEFF9BAD
        EFFFA2B3F0FFACBCF3FF838AE3FF4F52A0C10303051100000002000000000000
        000100000005323464797378D9F8929CEAFFA1AEEFFFB0BFF3FFB0BFF4FFA2AE
        EFFF939DE9FF7479DAF83234647D000000080000000200000000000000000000
        000000000000000000031213232D40437D935D61B5D07378DFFC7378DFFC5D61
        B5D040437D951212223000000004000000010000000000000000}
      ParentFont = False
      TabOrder = 1
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 78
    Width = 350
    Height = 21
    DataField = 'cliente_id'
    DataSource = dsOrdem
    KeyField = 'id'
    ListField = 'nome'
    ListSource = dsCliente
    TabOrder = 10
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 289
    Width = 859
    Height = 209
    Align = alBottom
    DataSource = dsItensOS
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 498
    Width = 859
    Height = 25
    DataSource = dsItensOS
    Align = alBottom
    TabOrder = 12
  end
  object dsOrdem: TDataSource
    OnStateChange = dsOrdemStateChange
    Left = 797
    Top = 23
  end
  object dsUserRecept: TDataSource
    Left = 652
    Top = 23
  end
  object dsCliente: TDataSource
    Left = 592
    Top = 23
  end
  object dsUserEntregue: TDataSource
    Left = 512
    Top = 23
  end
  object dsItensOS: TDataSource
    OnStateChange = dsItensOSStateChange
    OnUpdateData = dsItensOSUpdateData
    Left = 720
    Top = 23
  end
end

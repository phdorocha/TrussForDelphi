object fLogin: TfLogin
  Left = 0
  Top = 0
  Caption = #193'rea restrita'
  ClientHeight = 231
  ClientWidth = 352
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
  object GroupBox1: TGroupBox
    Left = 40
    Top = 33
    Width = 273
    Height = 161
    TabOrder = 0
    object Label1: TLabel
      Left = 41
      Top = 32
      Width = 25
      Height = 13
      Caption = 'Login'
    end
    object Label2: TLabel
      Left = 41
      Top = 56
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object _eLogin: TEdit
      Left = 96
      Top = 29
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'admin'
      TextHint = 'Informe o usu'#225'rio'
    end
    object _ePassword: TEdit
      Left = 96
      Top = 56
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = 'admin'
      TextHint = 'Informa senha'
    end
    object _btnCancelar: TBitBtn
      Left = 41
      Top = 99
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
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
      ModalResult = 2
      TabOrder = 2
      OnClick = _btnCancelarClick
    end
    object _btnOK: TBitBtn
      Left = 142
      Top = 99
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00030000000C0000001300000015000000150000001600000016000000170000
        00170000001800000018000000170000000F0000000400000000000000000000
        000B2C517EC33C6BACFF3967A7FF3762A2FF345E9EFF335999FF315595FF2E51
        90FF2C4D8CFF2A4A88FF2A4685FF1D305DC70000000F00000000000000000000
        000F4176B5FF8DDDFEFF52C9FEFF4AC4FEFF40BEFDFF44C2FDFF60CFFEFF55CC
        FEFF2BB3FCFF19A8FCFF12A4FBFF294786FF0000001500000000000000000000
        000E437BBBFFA1E5FFFF5ED0FFFF57CCFFFF4BAAD3FF405357FF3C5156FF55AD
        D3FF2DB6FFFF26B0FEFF1DA9FCFF2C4B8AFF0000001400000000000000000000
        000D4680C0FFB4EBFFFF6BD7FFFF63D4FFFF5BCFFFFF48707DFF436D7CFF55CA
        FFFF3ABCFFFF31B9FFFF28B2FCFF2E5090FF0000001300000000000000000000
        000B4884C5FFC5F2FFFF78DDFFFF70D8FFFF69D5FFFF57A3BFFF529FBFFF78D9
        FFFF47C4FFFF3FBFFFFF35BAFDFF305594FF0000001100000000000000000000
        000A4A88C8FFD4F6FFFF81E3FFFF7CDFFFFF74DCFFFF527177FF4F6F76FF7CDB
        FFFF54CBFFFF4CC7FFFF43BFFDFF335B9AFF0000000F00000000000000000000
        00084C8BCBFFE0F9FFFF8CE6FFFF85E4FFFF7EE1FFFF5F8C95FF5B8995FF69D8
        FFFF62D2FFFF5ACFFFFF4FC7FDFF36609FFF0000000E00000000000000000000
        00064C8CCCFFE7FBFFFFE4FAFFFFDFF9FFFFD8F7FFFFD1F4FFFFC8F2FFFFBFEE
        FFFFB4EBFFFFA8E7FFFF99E0FDFF3966A5FF0000000C00000000000000000000
        0003386897C44C8CCCFF4C8CCCFF4B8ACAFF4A87C7FF4884C4FF4681C0FF447D
        BCFF4279B9FF4075B4FF3E70B0FF2C507FC80000000700000000000000000000
        000100000012564B3EFFD0CCC8FF665B4EFF0000001B00000007000000080000
        001F726A5FFFB6AFA9FF4B3F30FF0000001C0000000200000000000000000000
        00000000000D5E5447F3D8D3CFFF6D6256FF16130F5600000008000000091713
        105A6F6557FFB6AEA5FF4B3F31F4000000150000000000000000000000000000
        000000000008585046CBB9B3ACFFA0988FFF3D352BBA1613105616130F583A31
        28BC91877DFF958C81FF3E352ACE0000000E0000000000000000000000000000
        000000000003211F1C4D999187FDC3BEB8FFA19990FF72675BFF6F6557FF9289
        7FFFACA59DFF766C60FE14110E53000000050000000000000000000000000000
        00000000000000000005433F3A839E958CFFBDB7B0FFD9D5D1FFD6D2CDFFAFA8
        A0FF7E7569FF2B261F890000000A000000010000000000000000000000000000
        000000000000000000010000000524211F4A5B554CB96B6256E75B5144E8453D
        34BA1815124E0000000800000001000000000000000000000000}
      ModalResult = 1
      TabOrder = 3
      OnClick = _btnOKClick
    end
  end
  object adsQry: TADODataSet
    Parameters = <>
    Left = 296
    Top = 137
  end
end
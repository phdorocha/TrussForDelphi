object fServicos: TfServicos
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os'
  ClientHeight = 501
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 734
    Height = 311
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 311
    Width = 734
    Height = 25
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 336
    Width = 734
    Height = 165
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 72
      Top = 24
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 72
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = cxDBTextEdit1
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 72
      Top = 80
      DataBinding.DataField = 'descricao'
      DataBinding.DataSource = DataSource1
      TabOrder = 0
      Width = 121
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 40
      Width = 121
      Height = 21
      DataField = 'id'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.adsServicos
    Left = 688
    Top = 368
  end
end

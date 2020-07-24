object fClientes: TfClientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
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
  object pBotton: TPanel
    Left = 0
    Top = 301
    Width = 734
    Height = 200
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
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
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = cxDBTextEdit1
    end
    object Label3: TLabel
      Left = 72
      Top = 104
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = cxDBTextEdit2
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 72
      Top = 80
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = DataSource1
      TabOrder = 0
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 72
      Top = 120
      DataBinding.DataField = 'telefone'
      DataBinding.DataSource = DataSource1
      TabOrder = 1
      Width = 121
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 43
      Width = 81
      Height = 21
      Color = clSkyBlue
      DataField = 'id'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 734
    Height = 276
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 276
    Width = 734
    Height = 25
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 2
  end
  object DataSource1: TDataSource
    DataSet = DM.adsClientes
    Left = 648
    Top = 96
  end
end

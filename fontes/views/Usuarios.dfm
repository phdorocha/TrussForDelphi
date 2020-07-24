object fUsuarios: TfUsuarios
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rios'
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
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 734
    Height = 200
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 307
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
      Width = 25
      Height = 13
      Caption = 'Login'
      FocusControl = cxDBTextEdit1
    end
    object Label3: TLabel
      Left = 72
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = cxDBTextEdit2
    end
    object Label4: TLabel
      Left = 72
      Top = 144
      Width = 30
      Height = 13
      Caption = 'Senha'
      FocusControl = cxDBTextEdit3
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 72
      Top = 80
      DataBinding.DataField = 'login'
      DataBinding.DataSource = DataSource1
      TabOrder = 0
      Width = 121
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 72
      Top = 121
      DataBinding.DataField = 'nome'
      DataBinding.DataSource = DataSource1
      TabOrder = 1
      Width = 353
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 72
      Top = 160
      DataBinding.DataField = 'password'
      DataBinding.DataSource = DataSource1
      Properties.PasswordChar = '*'
      Style.Shadow = False
      TabOrder = 2
      Width = 121
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 37
      Width = 89
      Height = 21
      Color = clSkyBlue
      DataField = 'id'
      DataSource = DataSource1
      ReadOnly = True
      TabOrder = 3
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 276
    Width = 734
    Height = 25
    DataSource = DataSource1
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 256
    ExplicitTop = 152
    ExplicitWidth = 240
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 734
    Height = 276
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = DM.adsUsers
    Left = 664
    Top = 376
  end
end

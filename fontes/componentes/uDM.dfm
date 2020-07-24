object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 346
  Width = 446
  object ADO: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\RepositorioEasy\' +
      'EasyServico\bd\base.mdb;Persist Security Info=False;Jet OLEDB:Da' +
      'tabase Password=easy@servico;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    BeforeConnect = ADOBeforeConnect
    Left = 41
    Top = 8
  end
  object adsQry: TADODataSet
    Connection = ADO
    Parameters = <>
    Left = 40
    Top = 64
  end
  object adsClientes: TADODataSet
    Connection = ADO
    CursorType = ctStatic
    BeforeDelete = adsClientesBeforeDelete
    CommandText = 'SELECT id, nome, telefone FROM Clientes;'
    Parameters = <>
    Left = 40
    Top = 120
    object adsClientesid: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      DisplayFormat = '00000'
    end
    object adsClientesnome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 80
      FieldName = 'nome'
      Size = 255
    end
    object adsClientestelefone: TWideStringField
      Alignment = taRightJustify
      DisplayLabel = 'Telefone'
      DisplayWidth = 20
      FieldName = 'telefone'
      Size = 255
    end
  end
  object adsUsers: TADODataSet
    Connection = ADO
    CursorType = ctStatic
    CommandText = 'select id, login, nome, password from Users'
    Parameters = <>
    Left = 40
    Top = 184
    object adsUsersid: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object adsUserslogin: TWideStringField
      DisplayLabel = 'Login'
      DisplayWidth = 25
      FieldName = 'login'
      Size = 255
    end
    object adsUsersnome: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 45
      FieldName = 'nome'
      Size = 255
    end
    object adsUserspassword: TWideStringField
      DisplayLabel = 'Senha'
      DisplayWidth = 30
      FieldName = 'password'
      Visible = False
      Size = 255
    end
  end
  object adsServicos: TADODataSet
    Connection = ADO
    CursorType = ctStatic
    CommandText = 'select id, descricao from Servicos;'
    Parameters = <>
    Left = 40
    Top = 248
    object adsServicosid: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object adsServicosdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'descricao'
      Size = 255
    end
  end
  object cxLocalizer1: TcxLocalizer
    Left = 216
    Top = 240
  end
  object adsOrdens: TADODataSet
    Connection = ADO
    CursorType = ctStatic
    CommandText = 'select * from OrdensServico'
    Parameters = <>
    Left = 112
    Top = 72
    object adsOrdensid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object adsOrdenscliente_id: TIntegerField
      FieldName = 'cliente_id'
    end
    object adsOrdensuser_id: TIntegerField
      FieldName = 'user_id'
    end
    object adsOrdensdt_entrada: TDateTimeField
      FieldName = 'dt_entrada'
    end
    object adsOrdensvlr_total: TBCDField
      FieldName = 'vlr_total'
      Precision = 19
    end
    object adsOrdensuser_recept_id: TIntegerField
      FieldName = 'user_recept_id'
    end
    object adsOrdensdt_saida: TDateTimeField
      FieldName = 'dt_saida'
    end
    object adsOrdensdt_create: TDateTimeField
      FieldName = 'dt_create'
    end
    object adsOrdensdt_alt: TDateTimeField
      FieldName = 'dt_alt'
    end
    object adsOrdensstatus: TBooleanField
      FieldName = 'status'
    end
  end
  object adsItensOS: TADODataSet
    Connection = ADO
    CursorType = ctStatic
    CommandText = 
      'SELECT itens_os.id, itens_os.os_id, itens_os.servico_id, itens_o' +
      's.produto_descricao, itens_os.item_vlr, itens_os.item_qtde, iten' +
      's_os.item_desconto, itens_os.item_subtotal FROM itens_os;'
    DataSource = dsOrdem
    IndexFieldNames = 'os_id'
    MasterFields = 'id'
    Parameters = <>
    Left = 112
    Top = 120
    object adsItensOSid: TAutoIncField
      DisplayWidth = 10
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object adsItensOSos_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'os_id'
    end
    object adsItensOSservico_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'servico_id'
    end
    object adsItensOSproduto_descricao: TWideStringField
      DisplayWidth = 31
      FieldName = 'produto_descricao'
      Size = 255
    end
    object adsItensOSitem_vlr: TBCDField
      DisplayWidth = 20
      FieldName = 'item_vlr'
      DisplayFormat = '#,##0.00'
      Precision = 19
    end
    object adsItensOSitem_qtde: TFloatField
      DisplayWidth = 10
      FieldName = 'item_qtde'
      DisplayFormat = '0.00'
    end
    object adsItensOSitem_desconto: TBCDField
      DisplayWidth = 20
      FieldName = 'item_desconto'
      Precision = 19
    end
    object adsItensOSitem_subtotal: TBCDField
      DisplayWidth = 20
      FieldName = 'item_subtotal'
      DisplayFormat = '#,##0.00'
      Precision = 19
    end
    object adsItensOSTotalItens: TAggregateField
      DefaultExpression = 'SUM(item_subtotal)'
      FieldName = 'TotalItens'
      DisplayName = ''
    end
  end
  object dsOrdem: TDataSource
    DataSet = adsOrdens
    Left = 186
    Top = 72
  end
  object dsItensOS: TDataSource
    DataSet = adsItensOS
    Left = 186
    Top = 120
  end
end

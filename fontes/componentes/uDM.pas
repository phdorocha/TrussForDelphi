unit uDM;

interface

uses
  Vcl.Forms, Winapi.Windows, System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, cxClasses, cxLocalization;

type
  TDM = class(TDataModule)
    ADO: TADOConnection;
    adsQry: TADODataSet;
    adsClientes: TADODataSet;
    adsClientesid: TAutoIncField;
    adsClientesnome: TWideStringField;
    adsClientestelefone: TWideStringField;
    adsUsers: TADODataSet;
    adsUsersid: TAutoIncField;
    adsUserslogin: TWideStringField;
    adsUsersnome: TWideStringField;
    adsUserspassword: TWideStringField;
    adsServicos: TADODataSet;
    adsServicosid: TAutoIncField;
    adsServicosdescricao: TWideStringField;
    cxLocalizer1: TcxLocalizer;
    adsOrdens: TADODataSet;
    adsOrdensid: TAutoIncField;
    adsOrdenscliente_id: TIntegerField;
    adsOrdensuser_id: TIntegerField;
    adsOrdensdt_entrada: TDateTimeField;
    adsOrdensvlr_total: TBCDField;
    adsOrdensuser_recept_id: TIntegerField;
    adsOrdensdt_saida: TDateTimeField;
    adsOrdensdt_create: TDateTimeField;
    adsOrdensdt_alt: TDateTimeField;
    adsOrdensstatus: TBooleanField;
    adsItensOS: TADODataSet;
    adsItensOSid: TAutoIncField;
    adsItensOSos_id: TIntegerField;
    adsItensOSservico_id: TIntegerField;
    adsItensOSproduto_descricao: TWideStringField;
    adsItensOSitem_vlr: TBCDField;
    adsItensOSitem_qtde: TFloatField;
    adsItensOSitem_desconto: TBCDField;
    adsItensOSitem_subtotal: TBCDField;
    dsOrdem: TDataSource;
    dsItensOS: TDataSource;
    adsItensOSTotalItens: TAggregateField;
    procedure ADOBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure adsClientesBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    function ConfirmaDelete: Integer;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Constants, Util;

{$R *.dfm}

procedure TDM.ADOBeforeConnect(Sender: TObject);
begin
    // Preenche caminho conforme informações em ServerConfig.ini
  ADO.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;'+
    'Data Source='+ TUtil.ReadIni(TUtil.IniFileServer, INI_SESSAO_CONEXAO, INI_BD) + ';'+
    'Jet OLEDB:Database Password='+TUtil.Criptografar(TUtil.ReadIni(TUtil.IniFileServer, INI_SESSAO_CONEXAO, INI_PSWDB));
end;

procedure TDM.adsClientesBeforeDelete(DataSet: TDataSet);
begin
  ConfirmaDelete;
end;

function TDM.ConfirmaDelete: Integer;
begin
  result := Application.MessageBox('Deseja realmente excluir o registro?','CONFIRME',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2);

  if result = IDNO then
    Abort;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  sPathFile: string;
begin
  try
    if not ADO.Connected then
      ADO.Open;
  except
    On E: Exception do
    begin
      E.Message := 'Erro de conexão com o banco' + sLineBreak + E.Message;
      Application.MessageBox(PChar(E.Message),'ERRO',MB_OK+MB_DEFBUTTON1+MB_ICONERROR);
      Application.Terminate;
    end;
  end;

  sPathFile := TUtil.CaminhoExe + 'IdiomaBrasil.ini';

  if FileExists(sPathFile) then
  begin
    cxLocalizer1.LoadFromFile(sPathFile);
    cxLocalizer1.LanguageIndex := 1;
    cxLocalizer1.Active   := true;
  end;

end;

end.

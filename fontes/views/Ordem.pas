unit Ordem;

interface

uses
{$REGION 'Próprias'}
  FormBase, BuilderDAO,
{$ENDREGION}
{$REGION 'DevExpress'}
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxSkinXmas2008Blue, cxCheckBox, cxDBEdit, cxCurrencyEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxMaskEdit, cxSpinEdit, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
{$ENDREGION}
{$REGION 'Delphi'}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Factory.Forms, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Data.Win.ADODB;
{$ENDREGION}

type
  TfOrdem = class(TBaseForm)
    dsOrdem: TDataSource;
    dsUserRecept: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    _eDtEntrega: TcxDBDateEdit;
    Label5: TLabel;
    _eVlrTotal: TcxDBCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    _eDtSaida: TcxDBDateEdit;
    Label8: TLabel;
    _eAdd: TcxDBDateEdit;
    Label9: TLabel;
    _eAlt: TcxDBDateEdit;
    _chkStatus: TcxDBCheckBox;
    _eCodigo: TDBEdit;
    dsCliente: TDataSource;
    _boxEntregue: TDBLookupComboBox;
    _boxRecebido: TDBLookupComboBox;
    dsUserEntregue: TDataSource;
    Panel1: TPanel;
    _btnSalvar: TBitBtn;
    _btnCancelar: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    dsItensOS: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure _btnSalvarClick(Sender: TObject);
    procedure dsItensOSStateChange(Sender: TObject);
    procedure dsOrdemStateChange(Sender: TObject);
    procedure dsItensOSUpdateData(Sender: TObject);
  private
    { Private declarations }
    procedure DefineDataSet;
    procedure DefaultValues;
  public
    { Public declarations }
  end;

var
  fOrdem: TfOrdem;

implementation

{$R *.dfm}
{ TfOrdem }

{ Registrarmos a class no próprio formulário }

{ TfOrdem }

procedure TfOrdem._btnSalvarClick(Sender: TObject);
begin
  inherited;

  if dsOrdem.DataSet.State in [dsInsert, dsEdit] then
    dsOrdem.DataSet.Post;
end;

procedure TfOrdem.DefaultValues;
begin
  dsOrdem.DataSet.FieldByName('dt_entrada').AsDateTime := Now;
  dsOrdem.DataSet.FieldByName('vlr_total').AsFloat := 0;
  dsOrdem.DataSet.FieldByName('dt_saida').AsDateTime := Now;
  dsOrdem.DataSet.FieldByName('dt_create').AsDateTime := Now;
  dsOrdem.DataSet.FieldByName('dt_alt').AsDateTime := Now;
  dsOrdem.DataSet.FieldByName('status').AsBoolean := True;
end;

procedure TfOrdem.DefineDataSet;
var
  I: Integer;
  dstOrdem, dstUserRecpt,
  dstUserEnt, dstCliente,
  dstItensOS: TDataSet;
  Field: TAggregateField;
begin
  inherited;

{$REGION 'Carregar DataSets pelo Dictionary'}
  if not Controllers.TryGetValue('dsOrdensServico',dstOrdem) then
    Exception.Create('DataSet Ordem não definido');
  dsOrdem.DataSet := dstOrdem;

  if Controllers.TryGetValue('dsClientes',dstCliente) then
    Exception.Create('DataSet Cliente não definido');
  dsCliente.DataSet := dstCliente;

  if Controllers.TryGetValue('dsusers',dstUserRecpt) then
    Exception.Create('DataSet Recebeu não definido');
  dsUserRecept.DataSet := dstUserRecpt;

  if Controllers.TryGetValue('dsuserentreg',dstUserEnt) then
    Exception.Create('DataSet Entregue não definido');
  dsUserEntregue.DataSet := dstUserEnt;

  if Controllers.TryGetValue('dsitens_os',dstItensOS) then
    Exception.Create('DataSet ItensOS não definido!');
  dsItensOS.DataSet := dstItensOS;
{$ENDREGION}

{$REGION 'Abrir DataSets Caso fechado'}
  if not dsOrdem.DataSet.Active then
    dsOrdem.DataSet.Open;

  if not dsCliente.DataSet.Active then
    dsCliente.DataSet.Open;

  if not dsUserEntregue.DataSet.Active then
    dsUserEntregue.DataSet.Open;

  if not dsUserRecept.DataSet.Active then
    dsUserRecept.DataSet.Open;

  if not dsUserEntregue.DataSet.Active then
    dsUserEntregue.DataSet.Open;

  if not dsItensOS.DataSet.Active then
    dsItensOS.DataSet.Open;
{$ENDREGION}

{$REGION 'Definição de Fields'}
  TAutoIncField(dsOrdem.DataSet.Fields[0]).DisplayLabel  := 'Código';
  TIntegerField(dsOrdem.DataSet.Fields[1]).DisplayLabel  := 'Cliente';
  TIntegerField(dsOrdem.DataSet.Fields[2]).DisplayLabel  := 'Usuários';
  TDateTimeField(dsOrdem.DataSet.Fields[3]).DisplayLabel := 'Entrada';
  TBCDField(dsOrdem.DataSet.Fields[4]).DisplayLabel      := 'Vlr Total';
  TIntegerField(dsOrdem.DataSet.Fields[5]).DisplayLabel  := 'Quem recebeu';
  TDateTimeField(dsOrdem.DataSet.Fields[6]).DisplayLabel := 'Saída';
  TAutoIncField(dsOrdem.DataSet.Fields[7]).Visible       := False;
  TAutoIncField(dsOrdem.DataSet.Fields[8]).Visible       := False;
  TBooleanField(dsOrdem.DataSet.Fields[9]).DisplayLabel  := 'Ativo';

  TAutoIncField(dsCliente.DataSet.Fields[0]).DisplayLabel    := 'Código';
  TWideStringField(dsCliente.DataSet.Fields[1]).DisplayLabel := 'Nome';

  TAutoIncField(dsUserRecept.DataSet.Fields[0]).DisplayLabel    := 'Código';
  TWideStringField(dsUserRecept.DataSet.Fields[1]).DisplayLabel := 'Nome';

  TAutoIncField(dsUserEntregue.DataSet.Fields[0]).DisplayLabel    := 'Código';
  TWideStringField(dsUserEntregue.DataSet.Fields[1]).DisplayLabel := 'Nome';

  TAutoIncField(dsItensOS.DataSet.Fields[0]).DisplayLabel     := 'Código';
  TAutoIncField(dsItensOS.DataSet.Fields[0]).ProviderFlags    := [pfInUpdate,pfInWhere,pfInKey];
  TIntegerField(dsItensOS.DataSet.Fields[1]).Visible          := False;
  TIntegerField(dsItensOS.DataSet.Fields[1]).Required         := True;
  TIntegerField(dsItensOS.DataSet.Fields[2]).DisplayLabel     := 'Serviço';
  TWideStringField(dsItensOS.DataSet.Fields[3]).DisplayLabel  := 'Descr. Produto';
  TWideStringField(dsItensOS.DataSet.Fields[3]).DisplayWidth  := 40;
  TBCDField(dsItensOS.DataSet.Fields[4]).DisplayLabel         := 'Vlr Unit.';
  TBCDField(dsItensOS.DataSet.Fields[4]).DisplayWidth         := 20;
  TFloatField(dsItensOS.DataSet.Fields[5]).DisplayLabel       := 'Qtde';
  TFloatField(dsItensOS.DataSet.Fields[5]).DisplayWidth       := 20;
  TBCDField(dsItensOS.DataSet.Fields[6]).DisplayLabel         := 'Desconto';
  TBCDField(dsItensOS.DataSet.Fields[6]).DisplayWidth         := 20;
  TBCDField(dsItensOS.DataSet.Fields[7]).DisplayLabel         := 'SubTotal';

  TDataSetSid(dsItensOS.DataSet).DataSource := dsOrdem;
  TDataSetSid(dsItensOS.DataSet).IndexFieldNames := dsItensOS.DataSet.Fields[1].FieldName;
  TDataSetSid(dsItensOS.DataSet).MasterFields    := dsOrdem.DataSet.Fields[0].FieldName;

  {$REGION 'Corrigir e implentar o Aggregate do Total'}
  {dsItensOS.DataSet.Close;
  Field := TAggregateField.Create(dsItensOS);
  with TAggregateField(Field) do
  begin
    DataSet       := dsItensOS.DataSet;
    FieldName     := 'TotalItens';
    DisplayName   := 'Vlr Total';
    DisplayFormat := ',0.00';
    Expression    := 'SUM(item_subtotal)';
    Active        := True;
    _tTotal.DataSource.DataSet := DataSet;
    _tTotal.DataField := FieldName;
  end;
  dsItensOS.DataSet.Open;}
  {$ENDREGION}
{$ENDREGION}

{$REGION 'Seta Formatos dos Fields'}
  for I := 0 to dsOrdem.DataSet.Fields.Count - 1 do
  begin
    if dsOrdem.DataSet.Fields[I] is TBCDField then
      TBCDField(dsOrdem.DataSet.Fields[I]).DisplayFormat := ',0.00';

    if dsOrdem.DataSet.Fields[I] is TFloatField then
      TFloatField(dsOrdem.DataSet.Fields[I]).DisplayFormat := ',0.00';

    if dsOrdem.DataSet.Fields[I] is TCurrencyField then
      TCurrencyField(dsOrdem.DataSet.Fields[I]).DisplayFormat := ',0.00';

    if dsOrdem.DataSet.Fields[I] is TAutoIncField then
      TAutoIncField(dsOrdem.DataSet.Fields[I]).DisplayFormat := '00000';
  end;

  for I := 0 to dsItensOS.DataSet.Fields.Count - 1 do
  begin
    if dsItensOS.DataSet.Fields[I] is TBCDField then
      TBCDField(dsItensOS.DataSet.Fields[I]).DisplayFormat := ',0.00';

    if dsItensOS.DataSet.Fields[I] is TFloatField then
      TFloatField(dsItensOS.DataSet.Fields[I]).DisplayFormat := ',0.00';

    if dsItensOS.DataSet.Fields[I] is TCurrencyField then
      TCurrencyField(dsItensOS.DataSet.Fields[I]).DisplayFormat := ',0.00';

    if dsItensOS.DataSet.Fields[I] is TAutoIncField then
      TAutoIncField(dsItensOS.DataSet.Fields[I]).DisplayFormat := '00000';
  end;
{$ENDREGION}

  if dsOrdem.DataSet.State in [dsInsert] then
    DefaultValues;
end;

procedure TfOrdem.dsItensOSStateChange(Sender: TObject);
begin
  inherited;

  {$REGION 'Defaults values'}
  if dsItensOS.State in [dsInsert] then
  begin
    dsItensOS.DataSet.FieldByName('os_id').AsInteger         := dsOrdem.DataSet.FieldByName('id').AsInteger;
    dsItensOS.DataSet.FieldByName('item_vlr').AsInteger      := 0;
    dsItensOS.DataSet.FieldByName('item_desconto').AsInteger := 0;
    dsItensOS.DataSet.FieldByName('item_qtde').AsInteger     := 1;
    dsItensOS.DataSet.FieldByName('item_subtotal').AsInteger := 0;
  end;
  {$ENDREGION}
end;

procedure TfOrdem.dsItensOSUpdateData(Sender: TObject);
begin
  inherited;

  if (dsItensOS.DataSet.State in [dsInsert,dsEdit]) then
    dsItensOS.DataSet.FieldByName('item_subtotal').AsFloat := (dsItensOS.DataSet.FieldByName('item_vlr').AsInteger -
      dsItensOS.DataSet.FieldByName('item_desconto').AsInteger) * dsItensOS.DataSet.FieldByName('item_qtde').AsInteger;
end;

procedure TfOrdem.dsOrdemStateChange(Sender: TObject);
begin
  inherited;

  _btnSalvar.Enabled   := (dsOrdem.DataSet.State in [dsInsert,dsEdit]);
  _btnCancelar.Enabled := not _btnSalvar.Enabled;
end;

procedure TfOrdem.FormShow(Sender: TObject);
begin
  inherited;

  DefineDataSet;
end;

initialization

RegisterClass(TfOrdem);

end.

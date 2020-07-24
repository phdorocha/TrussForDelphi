unit Pesquisar.Ordem;

interface

uses
{$REGION 'Próprias'}
  uDM, Controller.Ordem,
{$ENDREGION}
{$REGION 'DevExpress'}
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, cxDBData, cxGridLevel,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridExportLink, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxPSCore, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxCommon,
{$ENDREGION}
{$REGION 'Delphi'}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Data.DB,
  Vcl.ExtCtrls, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons;
{$ENDREGION}

type
  TfPsqOrdemServico = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    _pBottom: TPanel;
    dsOS: TDataSource;
    adsOS: TADODataSet;
    adsOScnome: TWideStringField;
    adsOSunome: TWideStringField;
    adsOSdt_entrada: TDateTimeField;
    adsOSdt_saida: TDateTimeField;
    adsOSvlr_total: TBCDField;
    adsOSstatus: TBooleanField;
    adsOSid: TAutoIncField;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    _btnIncluir: TBitBtn;
    _btnAlterar: TBitBtn;
    _btnExcluir: TBitBtn;
    _btnImprimi: TBitBtn;
    _btnExpPDF: TBitBtn;
    dxComponentPrinter1: TdxComponentPrinter;
    SaveDialog1: TSaveDialog;
    dxComponentPrinter1Link1: TdxGridReportLink;
    saveExcel: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure _btnIncluirClick(Sender: TObject);
    procedure _btnAlterarClick(Sender: TObject);
    procedure _btnExcluirClick(Sender: TObject);
    procedure _btnExpPDFClick(Sender: TObject);
    procedure _btnImprimiClick(Sender: TObject);
  private
    { Private declarations }
    Controller: TControllerOrdem;
  public
    { Public declarations }
  end;

var
  fPsqOrdemServico: TfPsqOrdemServico;

implementation

{$R *.dfm}

procedure TfPsqOrdemServico._btnIncluirClick(Sender: TObject);
begin
  Controller := TControllerOrdem.Create(self);

  try
    Controller.Incluir;
    dsOS.DataSet.Close;
    dsOS.DataSet.Open;
    dsOS.DataSet.Last;
  finally
    Controller.DisposeOf;
  end;
end;

procedure TfPsqOrdemServico._btnAlterarClick(Sender: TObject);
var
  iID: Integer;
begin
  Controller := TControllerOrdem.Create(self);

  try
    iID := dsOS.DataSet.FieldByName('id').AsInteger;
    Controller.Alterar(iID);
    dsOS.DataSet.Close;
    dsOS.DataSet.Open;
    dsOS.DataSet.Locate('id', iID, [loCaseInsensitive]);
  finally
    Controller.DisposeOf;
  end;
end;

procedure TfPsqOrdemServico._btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deeja realmente excluir o registro?', 'CONFIRME',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
    Abort;

  Assert(Controller.Excluir(dsOS.DataSet.FieldByName('id').AsInteger), 'Erro tentar excluir registro!');
  dsOS.DataSet.Close;
  dsOS.DataSet.Open;
end;

procedure TfPsqOrdemServico._btnImprimiClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True);
end;

procedure TfPsqOrdemServico._btnExpPDFClick(Sender: TObject);
begin
  SaveDialog1.InitialDir := ExtractFilePath(ParamStr(0));

  if SaveDialog1.Execute then
    dxComponentPrinter1.ExportToPDF(SaveDialog1.FileName, False);
end;

procedure TfPsqOrdemServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fPsqOrdemServico := NIL;
end;

procedure TfPsqOrdemServico.FormCreate(Sender: TObject);
begin
  if not adsOS.Active then
    adsOS.Open;
end;

end.

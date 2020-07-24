unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter, dxBar, cxClasses, dxRibbon, dxSkinsdxStatusBarPainter, dxStatusBar,
  dxBarApplicationMenu, Clientes, Usuarios, dxSkinscxPCPainter;

type
  TfPrincipal = class(TForm)
    tabCadastros: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    tabProcessos: TdxRibbonTab;
    tabRelatorios: TdxRibbonTab;
    dxBarLargeButton3: TdxBarLargeButton;
    dxRibbonPopupMenu1: TdxRibbonPopupMenu;
    dxBarButton1: TdxBarButton;
    Cadastros: TdxBarGroup;
    Processos: TdxBarGroup;
    Relatorios: TdxBarGroup;
    dxStatusBar1: TdxStatusBar;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dxBarButton2: TdxBarButton;
    dxBarManager1Bar1: TdxBar;
    dxBarManager1Bar2: TdxBar;
    dxBarManager1Bar3: TdxBar;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses Pesquisar.Ordem, Servicos;

procedure TfPrincipal.dxBarButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfPrincipal.dxBarLargeButton4Click(Sender: TObject);
begin
  fClientes := TfClientes.Create(self);
  fClientes.Show;
end;

procedure TfPrincipal.dxBarLargeButton5Click(Sender: TObject);
begin
  fServicos := TfServicos.Create(self);
  fServicos.Show;
end;

procedure TfPrincipal.dxBarLargeButton6Click(Sender: TObject);
begin
  fUsuarios := TfUsuarios.Create(self);
  fUsuarios.Show;
end;

procedure TfPrincipal.dxBarLargeButton7Click(Sender: TObject);
begin
  fPsqOrdemServico := TfPsqOrdemServico.Create(Self);
  fPsqOrdemServico.Show;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.

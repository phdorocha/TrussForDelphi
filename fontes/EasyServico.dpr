program EasyServico;

{$IMAGEBASE 61234589}  //Altera o cabeçalho do Software, assim evita de AntiVírus dar Falso-Positivo.

uses
  ShareMem,
  MidasLib,
  RLConsts,
  Vcl.Forms,
  Vcl.StdCtrls,
  System.SysUtils,
  Splash in 'views\Splash.pas' {fSplash},
  Vcl.Themes,
  Vcl.Styles,
  uDM in 'componentes\uDM.pas' {DM: TDataModule},
  Constants in '..\..\Util\Constants.pas',
  Funcoes in '..\..\Util\Funcoes.pas',
  Util in '..\..\Util\Util.pas',
  ufMensagensBox in '..\..\Util\ufMensagensBox.pas' {fMensagensBox},
  MkDirMul in '..\..\Util\MkDirMul.pas',
  Login in 'views\Login.pas' {fLogin},
  Model.User in 'model\Model.User.pas',
  Model.Base in 'model\Model.Base.pas',
  Controller.User in 'controler\Controller.User.pas',
  BuilderDAO in 'componentes\BuilderDAO.pas',
  Principal in 'views\Principal.pas' {fPrincipal},
  Clientes in 'views\Clientes.pas' {fClientes},
  Usuarios in 'views\Usuarios.pas' {fUsuarios},
  Servicos in 'views\Servicos.pas' {fServicos},
  Pesquisar.Ordem in 'views\Pesquisar.Ordem.pas' {fPsqOrdemServico};

{$R *.res}

var
  lLabelApp: TLabel;

begin
  Application.Initialize;
  fSplash   := TfSplash.Create(Application);
  lLabelApp := TLabel.Create(fSplash);
  fSplash.MostrarForm(lLabelApp);
  fSplash.Refresh;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'EasyServico';
  TStyleManager.TrySetStyle('Windows10 Blue');
  lLabelApp.Caption := 'Carregando banco de dados...';
  fSplash.Refresh;
  Sleep(2000);
  Application.CreateForm(TDM, DM);
  lLabelApp.Caption := 'Preparando validações...';
  fSplash.Refresh;
  Sleep(2000);
  Application.CreateForm(TfLogin, fLogin);
  fSplash.Close;
  fLogin.Show;
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.

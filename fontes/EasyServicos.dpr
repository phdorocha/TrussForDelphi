program EasyServicos;

uses
  ShareMem,
  MidasLib,
  RLConsts,
  Vcl.Forms,
  Vcl.StdCtrls,
  System.SysUtils,
  BuilderDAO in 'componentes\BuilderDAO.pas',
  uDM in 'componentes\uDM.pas' {DM: TDataModule},
  Factory.Forms in 'componentes\Factory.Forms.pas' {BaseForm},
  Controller in 'controler\Controller.pas',
  Controller.User in 'controler\Controller.User.pas',
  Controller.Ordem in 'controler\Controller.Ordem.pas',
  Model.Base in 'model\Model.Base.pas',
  Model.User in 'model\Model.User.pas',
  Model.Ordem in 'model\Model.Ordem.pas',
  Model.Cliente in 'model\Model.Cliente.pas',
  FormBase in 'componentes\FormBase.pas' {BaseForm},
  Clientes in 'views\Clientes.pas' {fClientes},
  Login in 'views\Login.pas' {fLogin},
  Ordem in 'views\Ordem.pas' {fOrdem},
  Pesquisar.Ordem in 'views\Pesquisar.Ordem.pas' {fPsqOrdemServico},
  Principal in 'views\Principal.pas' {fPrincipal},
  Servicos in 'views\Servicos.pas' {fServicos},
  Splash in 'views\Splash.pas' {fSplash},
  Usuarios in 'views\Usuarios.pas' {fUsuarios},
  MkDirMul in '..\..\Util\MkDirMul.pas',
  Model.ItensOS in 'model\Model.ItensOS.pas',
  Controller.ItensOS in 'controler\Controller.ItensOS.pas';

{$R *.res}

var
  lLabelApp: TLabel;

begin
  Application.Initialize;
  fSplash   := TfSplash.Create(Application);
  lLabelApp := TLabel.Create(fSplash);
  fSplash.MostrarForm(lLabelApp);
  fSplash.Refresh;
  Application.Title := 'EasyServico';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfLogin, fLogin);
  fSplash.Close;
  fLogin.Show;
  Application.Run;
end.

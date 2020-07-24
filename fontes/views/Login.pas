unit Login;

interface

uses
{$REGION 'Próprias'}
  Controller.User,
{$ENDREGION}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Data.Win.ADODB;

type
  TfLogin = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    _eLogin: TEdit;
    _ePassword: TEdit;
    _btnCancelar: TBitBtn;
    _btnOK: TBitBtn;
    adsQry: TADODataSet;
    procedure _btnCancelarClick(Sender: TObject);
    procedure _btnOKClick(Sender: TObject);
  private
    { Private declarations }
    Controller: TControllerUser;
  public
    { Public declarations }
  end;

var
  fLogin: TfLogin;

implementation

{$R *.dfm}

uses uDM, Principal;

procedure TfLogin._btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfLogin._btnOKClick(Sender: TObject);
begin
  Controller := TControllerUser.Create(Self);

  try
    Controller.SetDataSet(adsQry);

    if not Controller.Logar(_eLogin.Text,_ePassword.Text) then
      Application.MessageBox('Usuário ou senha inválido!','LOGAR',MB_OK+MB_ICONEXCLAMATION+MB_DEFBUTTON1)
    else begin
      Application.CreateForm(TfPrincipal, fPrincipal);
      fPrincipal.Show;
      fLogin.Hide;
    end;
  finally
    Controller.DisposeOf;
  end;
end;

end.

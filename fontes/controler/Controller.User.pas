unit Controller.User;

interface

uses
  // Próprias
  BuilderDAO, Controller, Model.User,
  // Delphi
  System.Classes, SysUtils, Generics.Collections, DB, DBClient;

type
  TControllerUser = class(TController)
  private
    { private declarations }
    FConexao: TConexao;
    User: TModelUser;
  protected
    { protected declarations }
  public
    { public declarations }
    procedure SetDataSet(ADataSet: TDataSetSiD);
    function Logar(ALogin, ASenha: string): Boolean;

    Constructor Create(AOwner: TComponent); overload;
  end;

implementation

uses
  Login;

{ TControllerUser }

Constructor TControllerUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  User := TModelUser.Create(Self);
end;

function TControllerUser.Logar(ALogin, ASenha: string): Boolean;
begin result := true;
{  if User.DataSet.Active then
    User.DataSet.Close;

  User.DataSet.CommandText := 'select * from users where login = :pLogin AND password = :pPassword';
  User.DataSet.Parameters[0].Value := ALogin;
  User.DataSet.Parameters[1].Value := ASenha;
  User.DataSet.Open;
  result := User.DataSet.RecordCount = 1;}
end;

procedure TControllerUser.SetDataSet(ADataSet: TDataSetSiD);
begin
  ADataSet := User.DataSet;
end;

end.

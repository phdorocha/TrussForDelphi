unit Model.User;

interface

uses
{$REGION 'Próprias'}
  BuilderDAO, Model.Base,
{$ENDREGION}
  System.Classes;

type
  TModelUser = class(TModelBase)
  private
    function TableName: string; override;

  public
    Constructor Create(AOwner: TComponent); overload;
    Destructor Destroy; override;
  end;

implementation

{ TUser }

constructor TModelUser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TModelUser.Destroy;
begin

  inherited;
end;

function TModelUser.TableName: string;
begin
  result := 'users';
end;

end.

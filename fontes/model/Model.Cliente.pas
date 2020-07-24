unit Model.Cliente;

interface

uses
{$REGION 'Próprias'}
  BuilderDAO, Model.Base,
{$ENDREGION}
  System.Classes;

type
  TModelCliente = class(TModelBase)
  private
    function TableName: string; override;

  public
    Constructor Create(AOwner: TComponent); overload;
    Destructor Destroy; override;
  end;

implementation

{ TCliente }

constructor TModelCliente.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TModelCliente.Destroy;
begin

  inherited;
end;

function TModelCliente.TableName: string;
begin
  result := 'Clientes';
end;

end.

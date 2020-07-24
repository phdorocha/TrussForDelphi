unit Model.Ordem;

interface

uses
{$REGION 'Próprias'}
  BuilderDAO, Model.Base,
{$ENDREGION}
  System.Classes;

type
  TModelOrdem = class(TModelBase)
  private
    function TableName: string; override;

  public
    Constructor Create(AOwner: TComponent); overload;
    Destructor Destroy; override;
  end;

implementation

{ TOrdem }

constructor TModelOrdem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TModelOrdem.Destroy;
begin

  inherited;
end;

function TModelOrdem.TableName: string;
begin
  result := 'OrdensServico';
end;

end.

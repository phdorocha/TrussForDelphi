unit Model.ItensOS;

interface

uses
  // Próprias
  BuilderDAO, Model.Base,
  // Delphi
  System.Classes;

type
  TModelItensOS = class(TModelBase)
  private
    { private declarations }
    function TableName: string; override;
    function PrimaryKey: string;
  public
    { public declarations }
    Constructor Create(AOwner: TComponent); overload;
    Destructor Destroy; override;

  end;

implementation

  { TModelItensOS }

Constructor TModelItensOS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TModelItensOS.Destroy;
begin

  inherited;
end;

function TModelItensOS.TableName: string;
begin
  result := 'itens_os';
end;

function TModelItensOS.PrimaryKey: string;
begin
  result := 'id';
end;

end.

unit Model.Base;

interface

uses
{$REGION 'Próprias'}
  BuilderDAO,
{$ENDREGION}
  System.Classes, System.SysUtils;

type
  TModelBase = class(TBuilderSQL)
  private
    FDataSet: TDataSetSiD;
    FsSQL: string;

    procedure SetDataSet(const Value: TDataSetSiD);
    function GetDataSet: TDataSetSiD;

  public
    property DataSet: TDataSetSiD read GetDataSet write SetDataSet;
    property sSQL   : string read FsSQL write FsSQL;

    procedure Assign(ADataSet: TDataSetSiD);
    procedure OpenDataSet;

    Constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;
  end;

implementation

{ TModelBase }

procedure TModelBase.Assign(ADataSet: TDataSetSiD);
begin
  self.DataSet := ADataSet;
end;

constructor TModelBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

end;

destructor TModelBase.Destroy;
begin

  inherited;
end;

function TModelBase.GetDataSet: TDataSetSiD;
begin
  result := FDataSet;
end;

procedure TModelBase.OpenDataSet;
begin
  if not self.FDataSet.Active then
    self.FDataSet.Open;
end;

procedure TModelBase.SetDataSet(const Value: TDataSetSiD);
begin
  FDataSet := Value;
end;

end.

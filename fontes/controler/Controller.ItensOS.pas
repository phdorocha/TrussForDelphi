unit Controller.ItensOS;

interface

uses
  // Próprias
  BuilderDAO, Controller, Model.ItensOS,
  // Delphi
  System.Classes, SysUtils, Generics.Collections, DB, DBClient;

type
  TControllerItensOS = class(TController)
  private
    { private declarations }
    FConexao: TConexao;
    ItensOS: TModelItensOS;
  protected
    { protected declarations }
  public
    { public declarations }
    procedure SetDataSet(ADataSet: TDataSetSiD);
    procedure BuscarPorID(ADataSet: TDataSetSiD; const AID: Integer);

    Constructor Create(AOwner: TComponent); overload;
  end;

implementation

uses
  Login;

{ TControllerItensOS }

procedure TControllerItensOS.BuscarPorID(ADataSet: TDataSetSiD; const AID: Integer);
begin
  ADataSet := self.ItensOS.get(AID);
  ADataSet.Active := True;
end;

Constructor TControllerItensOS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ItensOS := TModelItensOS.Create(Self);
end;

procedure TControllerItensOS.SetDataSet(ADataSet: TDataSetSiD);
begin
  ADataSet := ItensOS.DataSet;
end;

end.

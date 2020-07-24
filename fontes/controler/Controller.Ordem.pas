unit Controller.Ordem;

interface

uses
  // Próprias
  BuilderDAO, Controller, Model.Ordem, Model.User, Model.Cliente, Model.ItensOS,
  // Delphi
  System.Classes, SysUtils, Generics.Collections, DB, DBClient, Vcl.Forms;

type
  TControllerOrdem = class(TController)
  private
    { private declarations }
    FConexao: TConexao;
    Ordem: TModelOrdem;
    Cliente: TModelCliente;
    UserRecept: TModelUser;
    UserEntreg: TModelUser;
    ItensOS: TModelItensOS;
  protected
    { protected declarations }
  public
    { public declarations }
    procedure SetDataSet(ADataSet: TDataSetSiD);
    procedure BuscarPorID(ADataSet: TDataSetSiD; const AID: Integer);
    procedure Incluir;
    procedure Alterar(const AID: Integer);
    function Excluir(const AID: Integer): boolean;

    Constructor Create(AOwner: TComponent); overload;
  end;

implementation

{ TControllerOrdem }

Constructor TControllerOrdem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Ordem      := TModelOrdem.Create(Self);
  Cliente    := TModelCliente.Create(Self);
  UserRecept := TModelUser.Create(Self);
  UserEntreg := TModelUser.Create(Self);
  ItensOS    := TModelItensOS.Create(Self);
end;

function TControllerOrdem.Excluir(const AID: Integer): boolean;
begin
  result := true;
  Ordem.DataSet := Ordem.Where('id',AID).get;

  try
    if Ordem.DataSet.RecordCount = 1 then
      Ordem.DataSet.Delete;
  except
    result := false;
  end;
end;

procedure TControllerOrdem.Incluir;
var
  lstDataSets: TObjectList<TComponent>;
begin
  lstDataSets := TObjectList<TComponent>.Create;

  try
    Ordem.DataSet := Ordem.get;
    Ordem.OpenDataSet;
    Ordem.DataSet.Append;

    Cliente.DataSet := Cliente.Select(['id','nome']).get;
    Cliente.OpenDataSet;

    UserRecept.DataSet := UserRecept.Select(['id','nome']).get;
    UserRecept.OpenDataSet;

    UserEntreg.DataSet := UserEntreg.Select(['id','nome']).get;
    UserEntreg.OpenDataSet;

    lstDataSets.Add(Ordem.DataSet);
    lstDataSets.Add(UserRecept.DataSet);
    lstDataSets.Add(UserEntreg.DataSet);
    lstDataSets.Add(Cliente.DataSet);
//    ViewModal('TfOrdem',lstDataSets);
  finally
    lstDataSets.DisposeOf;
  end;
end;

procedure TControllerOrdem.Alterar(const AID: Integer);
var
  lstDataSets: TDictionary<String, TDataSet>;
begin
  lstDataSets := TDictionary<String,TDataSet>.Create;

  try
    Ordem.DataSet := Ordem.get(AID);

    Ordem.DataSet.RecordCount;
    Assert(
      Ordem.DataSet.RecordCount = 1,
      'Código ' + AID.ToString + ' não encontrado!'
    );

    Cliente.DataSet := Cliente.Select(['id','nome']).get;
    Cliente.OpenDataSet;

    UserRecept.DataSet := UserRecept.Select(['id','nome']).get;
    UserRecept.OpenDataSet;

    UserEntreg.DataSet := UserEntreg.Select(['id','nome']).get;
    UserEntreg.DataSet.Name := 'dsuserentreg';
    UserEntreg.OpenDataSet;

    ItensOS.DataSet := ItensOS.Where('os_id',AID).get;
    ItensOS.OpenDataSet;

    Ordem.DataSet.Edit;

    lstDataSets.Add(Ordem.DataSet.Name,Ordem.DataSet); // Aqui
    lstDataSets.Add(UserRecept.DataSet.Name,UserRecept.DataSet);
    lstDataSets.Add(UserEntreg.DataSet.Name,UserEntreg.DataSet);
    lstDataSets.Add(Cliente.DataSet.Name,Cliente.DataSet);
    lstDataSets.Add(ItensOS.DataSet.Name,ItensOS.DataSet);
    ViewModal('TfOrdem',lstDataSets);
  finally
    lstDataSets.DisposeOf;
  end;
end;

procedure TControllerOrdem.BuscarPorID(ADataSet: TDataSetSiD; const AID: Integer);
begin
  ADataSet := self.Ordem.get(AID);
  ADataSet.Active := True;
end;

procedure TControllerOrdem.SetDataSet(ADataSet: TDataSetSiD);
begin
  ADataSet := Ordem.DataSet;
end;

end.

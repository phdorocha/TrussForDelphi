unit BuilderDAO;

interface

uses
  System.Classes, Data.Win.ADODB, Variants, SysUtils;

{ IfThen will return the true string if the value passed in is true, else
  it will return the false variant }
function IfThen(AValue: Boolean; const ATrue: Variant;
  AFalse: Variant): Variant; overload; inline;

function VarIsBoolean(const V: Variant): Boolean;

function IsEmpty(Str: String = ''): Boolean;

type
  TFieldType = (ftVarChar, ftDate, ftNumber);
  TConexao    = TADOConnection;
  TDataSetSiD = TADODataSet;
  TJoin = Array [0 .. 2] of String;
  FColumns = Array of string;
  TOperacao = (ftInsert,ftEdit,ftBrowser);

  TBuilderSQL = class(TComponent)
  private
    FLimit: Integer;
    Columns: array of string;
    Wheres: TArray<String>;
    FWiths: TArray<String>;
    orderBys: TArray<String>;
    Plucks: TArray<String>;

    function loadQuery: string;
  protected

  public
    Conexao: TConexao;
    Joins: array of string;
    fillable: TArray<string>;

    function TableName: string; virtual;
    function PrimaryKey: string; virtual;
    function Select(Columns: Array of string): TBuilderSQL; virtual;
    function Where(AColumn: String; AValue: Variant): TBuilderSQL; overload;
    function Where(AColumn: String; AOperator: String; AValue: Variant): TBuilderSQL; overload;
    function WithSet(AModel: String): TBuilderSQL;
    function OrderBy(AColumns: Array of string): TBuilderSQL;
    function get: TDataSetSiD; overload;
    function get(const AID: Integer): TDataSetSiD; overload;

    Constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TBuilderSQL }

uses uDM;

function IfThen(AValue: Boolean; const ATrue: variant; AFalse: variant): variant;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

function VarIsBoolean(const V: Variant): Boolean;
begin
   result := varIsType(v, varBoolean);
end;

function IsEmpty(Str: String = ''): Boolean;
begin
  Result := Str = EmptyStr;
end;

function TBuilderSQL.TableName: string;
begin
  Assert(False,
    'A função "TableName" não foi implementada em ' + QuotedStr
      (self.ClassName) + sLineBreak);
end;

function TBuilderSQL.PrimaryKey: string;
begin
  result := 'id';
end;

function TBuilderSQL.Select(Columns: array of string): TBuilderSQL;
var
  I: Integer;
begin
  if (Length(Columns) >0) then
  begin
    SetLength(Self.Columns, Length(Columns));

    for I := 0 to Length(Columns)-1 do
      Self.Columns[i] := Columns[i];
  end else
    Self.Columns := ['*'];

  result := self;
end;

function TBuilderSQL.Where(AColumn: String; AValue: Variant): TBuilderSQL;
begin
  result := Self.where(AColumn, '=', AValue);
end;

function TBuilderSQL.Where(AColumn, AOperator: String; AValue: Variant): TBuilderSQL;
begin
  if Length(Trim(AOperator)) = 0 then
    AOperator := '=';

  if VarIsClear(AValue) or VarIsEmpty(AValue) then
    AValue := '"%%"'
  else
    if VarIsBoolean(AValue) then
      AValue := BoolToStr(AValue)
    else
      if VarIsStr(AValue) then
        AValue := '"' + AValue + '"'
      else
        if VarIsNumeric(AValue) then
          AValue := FloatToStr(AValue);

  SetLength(self.Wheres, Length(self.Wheres)+1);
  self.Wheres[High(self.Wheres)] := AColumn +' '+ AOperator +' '+ AValue;

  result := Self;
end;

function TBuilderSQL.WithSet(AModel: String): TBuilderSQL;
begin
  SetLength(self.FWiths, Length(self.FWiths)+1);
  self.Wheres[High(self.FWiths)] := AModel;

  result := Self;
end;

function TBuilderSQL.OrderBy(AColumns: array of string): TBuilderSQL;
var
  I: Integer;
begin
  SetLength(orderBys, Length(orderBys)+Length(AColumns));

  for I := Low(AColumns) to High(AColumns) do
    orderBys[High(orderBys)] := AColumns[I];
end;

constructor TBuilderSQL.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Conexao := TConexao.Create(AOwner);
  Conexao := DM.ADO;
end;

function TBuilderSQL.get: TDataSetSiD;
var
  cdsResult: TDataSetSiD;
  I: Integer;
begin
  cdsResult := TDataSetSiD.Create(self);
  cdsResult.Name := 'ds'+Self.TableName;
  cdsResult.Connection := self.Conexao;
  result := cdsResult;

  if Length(Self.Columns) <= 0 then
    Self.Columns := ['*'];

  cdsResult.CommandText := self.loadQuery;

  try
    cdsResult.Open;
  except
    on e: Exception do
    begin
      e.Message := 'Erro ao abrir model: ' + e.Message + sLineBreak +
        'Classe: ' + e.ClassName.QuotedString;
      raise;
    end;
  end;
end;

function TBuilderSQL.get(const AID: Integer): TDataSetSiD;
begin
  self.Where(PrimaryKey,AID);
  result := self.Where(PrimaryKey,AID).get;
end;

function TBuilderSQL.loadQuery: String;
var
  sQuery, Str, FWith,
  AWhere, AOrderBy: String;
  I: Integer;
begin
  sQuery := 'SELECT ';

  // Atribui as Colunas da tabela
  for I := Low(self.Columns) to High(self.Columns) do
  begin
    if I = 0 then // se primeira coluna, não coloca vírgula
      sQuery := sQuery + self.Columns[I]
    else
      sQuery := sQuery + ' ,' + self.Columns[I];
  end;

  for I := Low(self.Joins) to High(self.Joins) do
  begin
    FWith := ' INNER JOIN ';
    FWith := FWith + Self.Joins[0];
    FWith := FWith + ' ON ' + UpperCase(self.TableName) + '.' + Self.Joins[2] + ' = '
      + Self.Joins[0] + '.' + Self.Joins[1];
  end;

  for I := Low(self.Wheres) to High(self.Wheres) do
  begin
    if I = 0 then
      AWhere := AWhere + self.Wheres[I]
    else
      AWhere := AWhere + ' AND ' + self.Wheres[I];
  end;

  for I := Low(self.orderBys) to High(self.orderBys) do
  begin
    if I = 0 then
      AOrderBy := AOrderBy + self.orderBys[I]
    else
      AOrderBy := AOrderBy + ',' + self.orderBys[I];
  end;

  // Incrementa Tabel, Where, Order By e Join
  sQuery := UpperCase(sQuery.Trim) +     ' FROM ' + UpperCase(self.TableName)
    + IfThen(IsEmpty(AWhere.Trim), '',   ' WHERE ' + UpperCase(AWhere.Trim))
    + IfThen(IsEmpty(AOrderBy.Trim), '', ' ORDER BY ' + AOrderBy.Trim) + IfThen
    (IsEmpty(FWith.Trim), '', FWith);

  Result := sQuery.Trim;
end;

end.

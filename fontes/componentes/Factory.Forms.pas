unit Factory.Forms;

interface

uses
  FormBase,
  System.Classes, Generics.Collections, Vcl.Forms, Data.DB;

type
  TOperacao = (ftInsert,ftEdit,ftBrowser);

  TFactoryForms = class(TComponent)
  private
    FOperacao: TOperacao;

    procedure SetOperacao(const Value: TOperacao);
    function GetOperacao: TOperacao;

  public
    property Operacao: TOperacao read GetOperacao write SetOperacao;

    procedure View(AFormName: String; AControllers: TDictionary<String, TDataSet> = NIL);
    function ViewModal(AFormName: String; AControllers: TDictionary<String, TDataSet> = NIL): integer;
  end;

implementation

function TFactoryForms.GetOperacao: TOperacao;
begin
  result := FOperacao;
end;

procedure TFactoryForms.SetOperacao(const Value: TOperacao);
begin
  FOperacao := Value;
end;

procedure TFactoryForms.View(AFormName: String; AControllers: TDictionary<String, TDataSet>);
var
  FrmClass : TBaseFormClass;
  Frm      : TBaseForm;
begin
  {Finalidade : Criar o Formulário pelo Nome}

  try
    FrmClass := TBaseFormClass(FindClass(AFormName));
    Frm      := FrmClass.Create(Application);
    Frm.Controllers := AControllers;
    Frm.Show;
  except
    on E: EClassNotFound do
    begin
      Assert(
        False,
        'Classe não encontrada possívelmente por:' + sLineBReak +
        '- Classe não foi registrada.'             + sLineBreak +
        'Mesma não existe no projeto'
      );
    end;
  end;
end;

function TFactoryForms.ViewModal(AFormName: String; AControllers: TDictionary<String, TDataSet>): integer;
var
  FrmClass : TBaseFormClass;
  Frm      : TBaseForm;
begin
  {Finalidade : Criar o Formulário pelo Nome}

  try
    FrmClass := TBaseFormClass(FindClass(AFormName));
    Frm      := FrmClass.Create(Application);
    Frm.Controllers := AControllers;
    result   := Frm.ShowModal;
  except
    on E: EClassNotFound do
    begin
      Assert(
        False,
        'Classe não encontrada possívelmente por:' + sLineBReak +
        '- Classe não foi registrada.'             + sLineBreak +
        'Mesma não existe no projeto'
      );
    end;
  end;
end;

end.

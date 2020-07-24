unit FormBase;

interface

uses
{$REGION 'Delphi'}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Generics.Collections, DB;
{$ENDREGION}

type
  TBaseForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
    Controllers: TDictionary<String, TDataSet>;

    procedure SetDataSet(const ANomeDataSet: String; ADataSet: TDataSet);
  end;

  TBaseFormClass = class of TBaseForm;

var
  BaseForm: TBaseForm;

implementation

{$R *.dfm}

{ TBaseForm }

procedure TBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Self := NIL;
end;

procedure TBaseForm.SetDataSet(const ANomeDataSet: String; ADataSet: TDataSet);
begin
  Assert(
    not self.Controllers.TryGetValue(ANomeDataSet.Trim, ADataSet),
    'DataSet ' + ANomeDataSet.Trim + ' não definido!'
  );
end;

end.

unit Controller;

interface

uses
  // Próprias
  BuilderDAO, Factory.Forms,
  // Delphi
  System.Classes, SysUtils, Generics.Collections, DB, DBClient, Vcl.Forms;

type
  TController = class(TFactoryForms)
  private
    { private declarations }
    FConexao: TConexao;

  protected
    { protected declarations }
  public
    { public declarations }

    Constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  FormBase;

{ TController }

constructor TController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

end.

unit Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfSplash = class(TForm)
    Image1: TImage;
    _lNome: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarForm(ALabelInfo: TLabel);
  end;

var
  fSplash: TfSplash;

implementation

{$R *.dfm}

{ TfSplash }

{ TfSplash }

procedure TfSplash.MostrarForm(ALabelInfo: TLabel);
begin
  _lNome.Caption := Application.Title;
  Self.Show;
end;

end.



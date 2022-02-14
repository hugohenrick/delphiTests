unit br.com.hugo.uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions,
  Vcl.ActnList;

type
  TFrmDashboard = class(TForm)
    MainMenu: TMainMenu;
    Cadastros1: TMenuItem;
    Vendas1: TMenuItem;
    Faturamento1: TMenuItem;
    Contato1: TMenuItem;
    N1: TMenuItem;
    Cidade1: TMenuItem;
    ActionListMainMenu: TActionList;
    actFrmContatos: TAction;
    procedure actFrmContatosExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDashboard: TFrmDashboard;

implementation

uses
  br.com.hugo.uContato, br.com.hugo.utils, br.com.hugo.dmConnection;

{$R *.dfm}

procedure TFrmDashboard.actFrmContatosExecute(Sender: TObject);
var
  LFormCotato: TFrmContato;
begin
  LFormCotato := TFrmContato.Create(nil);
  try
    LFormCotato.ShowModal;
  finally
    LFormCotato.Free;
  end;
end;

procedure TFrmDashboard.FormCreate(Sender: TObject);
var
  LDataBaseHelper: TDataBaseHelper;
begin
  LDataBaseHelper := TDataBaseHelper.Create;
  try
    LDataBaseHelper.CreateData;
  finally
    LDataBaseHelper.Free;
  end;
end;

procedure TFrmDashboard.FormDestroy(Sender: TObject);
begin
  TdmConnection.Destroy;
end;

end.

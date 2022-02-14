unit br.com.hugo.uContato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, br.com.hugo.uBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.ExtCtrls, br.com.hugo.dmContato, Vcl.StdCtrls,
  Vcl.Mask, System.Actions, Vcl.ActnList, br.com.hugo.ContatoController;

type
  TFrmContato = class(TFrmBase)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ActionList: TActionList;
    actAbrir: TAction;
    actNovo: TAction;
    actSalvar: TAction;
    actDeletar: TAction;
    actAtualizar: TAction;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure actAbrirExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actDeletarExecute(Sender: TObject);
    procedure actAtualizarExecute(Sender: TObject);
    procedure actNovoUpdate(Sender: TObject);
    procedure actSalvarUpdate(Sender: TObject);
    procedure actAtualizarUpdate(Sender: TObject);
    procedure actDeletarUpdate(Sender: TObject);
  private
    { Private declarations }
    FContato: TdmContato;
    FContatoController: TContatoController;
  public
    { Public declarations }
  end;

var
  FrmContato: TFrmContato;

implementation

{$R *.dfm}

procedure TFrmContato.actAbrirExecute(Sender: TObject);
begin
  inherited;
  FContatoController.Open([FContato.dsPessoa, FContato.dsContato]);
end;

procedure TFrmContato.actAtualizarExecute(Sender: TObject);
begin
  inherited;
  FContatoController.SaveOrUpdate(FContato.dsPessoa);
end;

procedure TFrmContato.actAtualizarUpdate(Sender: TObject);
begin
  inherited;
  actAtualizar.Enabled := FContato.dsPessoa.DataSet.State = dsEdit;
end;

procedure TFrmContato.actDeletarExecute(Sender: TObject);
begin
  inherited;
  FContato.dsContato.DataSet.First;

  while not FContato.dsContato.DataSet.Eof do
    FContatoController.Delete(FContato.dsContato);

  FContatoController.Delete(FContato.dsPessoa);
end;

procedure TFrmContato.actDeletarUpdate(Sender: TObject);
begin
  inherited;
  actDeletar.Enabled := (FContato.dsPessoa.DataSet.State = dsBrowse) and
                        (FContato.dsPessoa.DataSet.RecordCount > 0);
end;

procedure TFrmContato.actNovoExecute(Sender: TObject);
begin
  inherited;
  FContatoController.Insert( FContato.dsPessoa);
end;

procedure TFrmContato.actNovoUpdate(Sender: TObject);
begin
  inherited;
  actNovo.Enabled := FContato.dsPessoa.DataSet.State = dsBrowse;
end;

procedure TFrmContato.actSalvarExecute(Sender: TObject);
begin
  inherited;
  FContatoController.SaveOrUpdate(FContato.dsPessoa);
end;

procedure TFrmContato.actSalvarUpdate(Sender: TObject);
begin
  inherited;
  actSalvar.Enabled := FContato.dsPessoa.DataSet.State = dsInsert;
end;

procedure TFrmContato.FormCreate(Sender: TObject);
begin
  inherited;
  FContato := TdmContato.Create(Self);
  FContatoController := TContatoController.Create;
end;

procedure TFrmContato.FormDestroy(Sender: TObject);
begin
  inherited;
  FContato.Free;
  FContatoController.Free;
end;

end.

unit br.com.hugo.dmContato;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, br.com.hugo.dmConnection;

type
  TdmContato = class(TDataModule)
    fdqryPessoa: TFDQuery;
    fdqryContato: TFDQuery;
    dsPessoa: TDataSource;
    dsContato: TDataSource;
    fdqryPessoaID: TFDAutoIncField;
    fdqryPessoaNOME: TStringField;
    fdqryPessoaSOBRENOME: TStringField;
    fdqryContatoID: TFDAutoIncField;
    fdqryContatoDESCRICAO: TStringField;
    fdqryContatoTELEFONE: TStringField;
    fdqryContatoEMAIL: TStringField;
    fdqryContatoID_PESSOA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmContato: TdmContato;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmContato.DataModuleCreate(Sender: TObject);
begin
  fdqryPessoa.Connection := TdmConnection.GetConnection.FDConnection;
  fdqryContato.Connection := TdmConnection.GetConnection.FDConnection;
end;

end.

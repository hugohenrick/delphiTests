unit br.com.hugo.utils;

interface

type
  TDataBaseHelper = class
  public
    procedure CreateData;
  end;

implementation

uses
  FireDAC.Comp.Client, br.com.hugo.dmConnection;

{ TDataBaseHelper }

procedure TDataBaseHelper.CreateData;
var
  LFDQuery: TFDQuery;
begin
  LFDQuery := TFDQuery.Create(nil);
  try
    LFDQuery.Connection := TdmConnection.GetConnection.FDConnection;

    // TABLE PESSOA
    LFDQuery.SQL.Clear;
    LFDQuery.SQL.Append('CREATE TABLE IF NOT EXISTS PESSOA (');
    LFDQuery.SQL.Append('  ID INTEGER PRIMARY KEY AUTOINCREMENT, ');
    LFDQuery.SQL.Append('  NOME VARCHAR(150) NOT NULL, ');
    LFDQuery.SQL.Append('  SOBRENOME VARCHAR(100) NOT NULL )');
    LFDQuery.ExecSQL;

    // TABLE CONTATO
    LFDQuery.SQL.Clear;
    LFDQuery.SQL.Append('CREATE TABLE IF NOT EXISTS CONTATO (');
    LFDQuery.SQL.Append('  ID INTEGER PRIMARY KEY AUTOINCREMENT, ');
    LFDQuery.SQL.Append('  DESCRICAO VARCHAR(50), ');
    LFDQuery.SQL.Append('  TELEFONE VARCHAR(20), ');
    LFDQuery.SQL.Append('  EMAIL VARCHAR(50), ');
    LFDQuery.SQL.Append('  ID_PESSOA INTEGER, ');
    LFDQuery.SQL.Append('  FOREIGN KEY (ID_PESSOA) REFERENCES PESSOA(ID) )');
    LFDQuery.ExecSQL;

  finally
    LFDQuery.Free;
  end;

end;

end.

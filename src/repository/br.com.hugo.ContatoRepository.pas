unit br.com.hugo.ContatoRepository;

interface

uses
  Data.DB, FireDAC.Comp.Client, System.SysUtils;

type
  TContatoRepository = class
  public
    function SaveOrUpdate(ADataSource: TDataSource): Integer;
    function Delete(ADataSource: TDataSource): Boolean;
    procedure Open(ADataSources: array of TDataSource);
    procedure Insert(ADataSource: TDataSource);

    function RunSql(ACommand: string): TFDQuery;
  end;
  
implementation

uses
  br.com.hugo.dmConnection;

{ TContatoRepository }

function TContatoRepository.Delete(ADataSource: TDataSource): Boolean;
begin
  Result := True;
  try
    ADataSource.DataSet.Delete;
  except
    Result := False;
  end;
end;

procedure TContatoRepository.Insert(ADataSource: TDataSource);
begin
  ADataSource.DataSet.Insert;
end;

procedure TContatoRepository.Open(ADataSources: array of TDataSource);
begin
  for var ADataSource in ADataSources do
  begin
    ADataSource.DataSet.Open;
  end;
end;

function TContatoRepository.RunSql(ACommand: string): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  try
    Result.Connection := TdmConnection.GetConnection.FDConnection;
    
    Result.SQL.Clear;
    Result.SQL.Text := ACommand;
    Result.ExecSQL;
  except
    on E: Exception do
      raise Exception.Create('Comando inválido: ' +E.Message);
  end;
end;

function TContatoRepository.SaveOrUpdate(ADataSource: TDataSource): Integer;
begin
  ADataSource.DataSet.Post;
  Result := ADataSource.DataSet.FieldByName('ID').AsInteger;
end;

end.

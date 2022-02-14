unit br.com.hugo.ContatoService;

interface

uses
  Data.DB, br.com.hugo.ContatoRepository;

type
  TContatoService = class
  private
    FContatoRepository: TContatoRepository;
  public
    function SaveOrUpdate(ADataSource: TDataSource): Integer;
    function Delete(ADataSource: TDataSource): Boolean;
    procedure Open(ADataSources: array of TDataSource);
    procedure Insert(ADataSource: TDataSource);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TContatoService }

constructor TContatoService.Create;
begin
  FContatoRepository := TContatoRepository.Create;
end;

function TContatoService.Delete(ADataSource: TDataSource): Boolean;
begin
  Result := FContatoRepository.Delete(ADataSource);
end;

destructor TContatoService.Destroy;
begin
  FContatoRepository.Free;
  inherited;
end;

procedure TContatoService.Insert(ADataSource: TDataSource);
begin
  FContatoRepository.Insert(ADataSource);
end;

procedure TContatoService.Open(ADataSources: array of TDataSource);
begin
  FContatoRepository.Open(ADataSources);
end;

function TContatoService.SaveOrUpdate(ADataSource: TDataSource): Integer;
begin
  if not Assigned(ADataSource) then
    raise Exception.Create('Informe um DataSource');

  Result := FContatoRepository.SaveOrUpdate(ADataSource);
end;

end.

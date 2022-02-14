unit br.com.hugo.ContatoController;

interface

uses
  Data.DB, br.com.hugo.ContatoService;

type
  TContatoController = class
  private
    FContatoService: TContatoService;
  public
    function SaveOrUpdate(ADataSource: TDataSource): Integer;
    function Delete(ADataSource: TDataSource): Boolean;
    procedure Open(ADataSources: array of TDataSource);
    procedure Insert(ADataSource: TDataSource);

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TContatoController }

constructor TContatoController.Create;
begin
  FContatoService := TContatoService.Create;
end;

function TContatoController.Delete(ADataSource: TDataSource): Boolean;
begin
  Result := FContatoService.Delete(ADataSource);
end;

destructor TContatoController.Destroy;
begin
  FContatoService.Free;
  inherited;
end;

procedure TContatoController.Insert(ADataSource: TDataSource);
begin
   FContatoService.Insert(ADataSource);
end;

procedure TContatoController.Open(ADataSources: array of TDataSource);
begin
  FContatoService.Open(ADataSources);
end;

function TContatoController.SaveOrUpdate(ADataSource: TDataSource): Integer;
begin
  Result := FContatoService.SaveOrUpdate(ADataSource);
end;

end.

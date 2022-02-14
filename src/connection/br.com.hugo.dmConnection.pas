unit br.com.hugo.dmConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Comp.UI,
  FireDAC.Phys.SQLite, FireDAC.DApt;

type
  TdmConnection = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDTransaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    class var FConnection: TdmConnection;
  public
    { Public declarations }
    property Connection: TFDConnection read FDConnection;
    class function GetConnection: TdmConnection;
    class procedure Destroy;
  end;

var
  dmConnection: TdmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

{ TdmConnection }

procedure TdmConnection.DataModuleCreate(Sender: TObject);
var
  LDataBase: string;
begin
//  LDatabase := ExtractFileDir(GetCurrentDir);
  LDatabase := ExtractFileDir(ParamStr(0));
  LDataBase := LDataBase + '\src\database\data.db';

  FDConnection.DriverName := 'SQLite';
  FDConnection.Params.Database := LDataBase;
end;

class procedure TdmConnection.Destroy;
begin
  if Assigned(FConnection) then
    FConnection.Free;
end;

class function TdmConnection.GetConnection: TdmConnection;
begin
  if not Assigned(FConnection) then
    FConnection := TdmConnection.Create(nil);

  Result := FConnection;
end;

end.

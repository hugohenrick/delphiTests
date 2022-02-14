unit br.com.hugo.ContatoTest;

interface

uses
  DUnitX.TestFramework,
  br.com.hugo.ContatoService,
  br.com.hugo.dmContato,
  br.com.hugo.utils;

type
  [TestFixture]
  TContatoTest = class
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [SetupFixture]
    procedure InicializaSuite;
    [TearDownFixture]
    procedure FinalizaSuite;
    // Sample Methods
    // Simple single Test
    [Test]
    procedure TestCadastroPessoa;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestA','1,2')]
    [TestCase('TestB','3,4')]
    procedure Test2(const AValue1 : Integer;const AValue2 : Integer);
  end;

implementation

uses
  System.SysUtils;

procedure TContatoTest.FinalizaSuite;
begin
//
end;

procedure TContatoTest.InicializaSuite;
const
  DBNAME = 'C:\Projetos\Delphi\FormacaoDelphi\src\test\Win32\Debug\src\database\data.db';
var
  DbHelper: TDataBaseHelper;
begin
  if FileExists(DBNAME) then
    DeleteFile(DBNAME);

  DbHelper := TDataBaseHelper.Create;
  try
    DbHelper.CreateData;
  finally
    DbHelper.Free;
  end;
end;

procedure TContatoTest.Setup;
begin
end;

procedure TContatoTest.TearDown;
begin
end;

procedure TContatoTest.TestCadastroPessoa;
var
  LContatoService: TContatoService;
  LDmContato: TdmContato;
  id: Integer;
begin
  LDmContato := TdmContato.Create(nil);
  LContatoService := TContatoService.Create;
  try
    LContatoService.Open(LDmContato.dsPessoa);
    LContatoService.Insert(LDmContato.dsPessoa);
    LDmContato.dsPessoa.DataSet.FieldByName('nome').AsString := 'Lucas';
    LDmContato.dsPessoa.DataSet.FieldByName('sobrenome').AsString := 'Silva';
    id := LContatoService.SaveOrUpdate(LDmContato.dsPessoa);
    Assert.IsTrue(id > 0);
  finally
    LContatoService.Free;
    LDmContato.Free;
  end;
end;

procedure TContatoTest.Test2(const AValue1 : Integer;const AValue2 : Integer);
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TContatoTest);

end.

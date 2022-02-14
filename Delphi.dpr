program Delphi;

uses
  Vcl.Forms,
  br.com.hugo.uMain in 'src\view\br.com.hugo.uMain.pas' {FrmDashboard},
  br.com.hugo.uBase in 'src\view\br.com.hugo.uBase.pas' {FrmBase},
  br.com.hugo.uContato in 'src\view\br.com.hugo.uContato.pas' {FrmContato},
  br.com.hugo.dmContato in 'src\model\br.com.hugo.dmContato.pas' {dmContato: TDataModule},
  br.com.hugo.dmConnection in 'src\connection\br.com.hugo.dmConnection.pas' {dmConnection: TDataModule},
  br.com.hugo.utils in 'src\utils\br.com.hugo.utils.pas',
  br.com.hugo.ContatoRepository in 'src\repository\br.com.hugo.ContatoRepository.pas',
  br.com.hugo.ContatoService in 'src\services\br.com.hugo.ContatoService.pas',
  br.com.hugo.ContatoController in 'src\controller\br.com.hugo.ContatoController.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmDashboard, FrmDashboard);
  Application.Run;
end.

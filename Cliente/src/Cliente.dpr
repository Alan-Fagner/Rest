program Cliente;

uses
  Vcl.Forms,
  uPrincipal in 'View\uPrincipal.pas' {FrmPrincipal},
  uPessoa in 'View\uPessoa.pas' {FrmPessoa},
  uModel.Interfaces in 'Model\uModel.Interfaces.pas',
  uModel.Pessoa in 'Model\uModel.Pessoa.pas',
  uController.Interfaces in 'Controller\uController.Interfaces.pas',
  uController in 'Controller\uController.pas',
  uEnviar in 'View\uEnviar.pas' {FrmEnviar},
  UEnviarThread in 'Util\UEnviarThread.pas';

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

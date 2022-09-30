unit uEnviar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Threading,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Samples.Gauges,
  uController.Interfaces,
  UEnviarThread, Vcl.ExtCtrls;

type

  TFrmEnviar = class(TForm)
    Gauge1: TGauge;
    LblCaminho: TLabel;
    OD: TOpenDialog;
    BtnEnviar: TButton;
    LblInfo: TLabel;
    Timer: TTimer;
    LblTempo: TLabel;
    LblEnviados: TLabel;
    Button1: TButton;
    procedure BtnEnviarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    arq : TStringList;
    EnviarThread: TEnviar;
    Inicio: TDateTime;
  public
    { Public declarations }
  end;

var
  FrmEnviar: TFrmEnviar;

implementation

uses
  uController, System.Types,System.StrUtils;

{$R *.dfm}

procedure TFrmEnviar.BtnEnviarClick(Sender: TObject);
begin
  if (EnviarThread <> nil) and ( not EnviarThread.Finished) then begin
    ShowMessage('Existe uma thread em andamento');
  end else begin
    FrmEnviar.Gauge1.Progress:=0;
    LblTempo.Caption    := '00:00:00.000';
    LblInfo.Caption     := '(%) Enviado : 0%';
    LblEnviados.Caption := 'Enviados: 0 / 0';

    arq.Clear;
    OD.Execute;
    arq.LoadFromFile(OD.FileName);

    FrmEnviar.LblCaminho.Caption := FrmEnviar.OD.FileName;


    FrmEnviar.Gauge1.MaxValue:= arq.Count -1;

    FrmEnviar.inicio := now;
    EnviarThread := TEnviar.Create(arq);
  end;
end;

procedure TFrmEnviar.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmEnviar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if EnviarThread <> nil then begin
    if not EnviarThread.Finished then begin
      Action := caNone;
      ShowMessage('Existe um processo em andamento... Ele ser� parado');
      EnviarThread.Terminate;
    end;
  end;

  FreeAndNil(arq);
  FreeAndNil(EnviarThread);
end;

procedure TFrmEnviar.FormCreate(Sender: TObject);
begin
  arq := TStringList.Create;
  EnviarThread := nil;
end;

procedure TFrmEnviar.TimerTimer(Sender: TObject);
begin
  LblTempo.Caption := FormatDateTime('hh:nn:ss.zzz',now-inicio);
end;

end.

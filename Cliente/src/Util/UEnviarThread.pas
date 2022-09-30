unit UEnviarThread;

interface

uses
  uController.Interfaces,
  System.Classes,
  System.StrUtils,
  System.SysUtils;

type

  TEnviar = class(TThread)
  private
    Controller: iController;
    Farq: TStringList;

  public
    constructor Create(arq : TStringList);
    destructor Destroy; override;
    procedure Execute; override;
  end;

implementation

uses
  uController, uEnviar;

{ TEnviar }

constructor TEnviar.Create(arq : TStringList);
begin
  inherited Create(False);
  Farq := arq;
end;

destructor TEnviar.Destroy;
begin
  inherited;
end;

procedure TEnviar.Execute;
var
  i: integer;
begin
  Controller := TController.New;
  try
    FrmEnviar.Timer.Enabled := True;

    for i := 1 to Farq.Count -1 do begin
      if Self.Terminated then break;
      

      Controller.Pessoa
        .NATUREZA   (StrToInt(SplitString(Farq[i],';')[0]))
        .DOCUMENTO  (SplitString(Farq[i],';')[1])
        .NMPRIMEIRO (SplitString(Farq[i],';')[2])
        .NMSEGUNDO  (SplitString(Farq[i],';')[3])
        .DTREGISTRO (StrToDate(SplitString(Farq[i],';')[4]))
        .CEP        (SplitString(Farq[i],';')[5])
        .Insert;

      FrmEnviar.Gauge1.Progress:= i;
      FrmEnviar.LblInfo.Caption := '(%) Enviado : '+IntToStr(FrmEnviar.Gauge1.PercentDone)+'%';
      FrmEnviar.LblEnviados.Caption := 'Enviados: '+IntToStr(i)+' / '+IntToStr(Farq.Count -1);
     // FrmEnviar.Gauge1.Refresh;
    end;

    FrmEnviar.Timer.Enabled := False;

  except on E: Exception do
    raise Exception.Create('Erro no processamento do arquivo'+#13+E.Message);
  end;
end;

end.

unit uThreadInsert;

interface

uses
  FireDAC.Stan.Param,
  System.Classes,
  System.JSON,
  uCEP,
  uDM;

type
  TThInsert = class(TThread)
  private
    vCEP  : TCEP;
    Dados : TDM;
    ID    : Integer;

    FNatureza: integer;
    FDocumento: string;
    FNmPrimeiro: string;
    FNmSegundo: string;
    FDtRegistro: TDateTime;
    FCep: string;

  public
    constructor Create(Pessoa: TJSONObject);
    destructor Destroy; override;
    procedure Execute; override;
  end;

implementation

uses
  System.SysUtils;

{ TThInsert }

constructor TThInsert.Create(Pessoa: TJSONObject);
begin
  inherited Create(False);
  FreeOnTerminate := True;
  Dados := TDM.Create(nil);
  vCEP := TCEP.Create.Consulta(Pessoa.GetValue('CEP').Value);

  FNatureza := StrToInt(Pessoa.GetValue('NATUREZA').Value);
  FDocumento := Pessoa.GetValue('DOCUMENTO').Value;
  FNmPrimeiro := Pessoa.GetValue('NMPRIMEIRO').Value;
  FNmSegundo := Pessoa.GetValue('NMSEGUNDO').Value;
  FDtRegistro := StrToDate(Pessoa.GetValue('DTREGISTRO').Value);
  FCep := Pessoa.GetValue('CEP').Value;
end;

destructor TThInsert.Destroy;
begin
  FreeAndNil(vCEP);
  FreeAndNil(Dados);
  inherited;
end;

procedure TThInsert.Execute;
begin
  Dados.Conexao.StartTransaction;
  try
    Dados.Qry.SQL.Clear;
    Dados.Qry.SQL.Add('INSERT INTO public.pessoa(flnatureza, dsdocumento, nmprimeiro, nmsegundo, dtregistro) '+
                      'VALUES (:flnatureza, :dsdocumento, :nmprimeiro, :nmsegundo, :dtregistro) returning idpessoa ');
    Dados.Qry.ParamByName('flnatureza').AsInteger     := FNatureza;
    Dados.Qry.ParamByName('dsdocumento').AsString     := FDocumento;
    Dados.Qry.ParamByName('nmprimeiro').AsString      := FNmPrimeiro;
    Dados.Qry.ParamByName('nmsegundo').AsString       := FNmSegundo;
    Dados.Qry.ParamByName('dtregistro').AsDateTime    := FDtRegistro;
    Dados.Qry.open;

    ID := Dados.Qry.Fields[0].Value;

    Dados.Conexao.StartTransaction;
    try
      Dados.Qry.SQL.Clear;
      Dados.Qry.SQL.Add('INSERT INTO public.endereco(idpessoa, dscep) VALUES (:idpessoa,:dscep) returning idendereco');
      Dados.Qry.ParamByName('idpessoa').AsInteger := ID;
      Dados.Qry.ParamByName('dscep').AsString     := FCep;
      Dados.Qry.open;

      ID := Dados.Qry.Fields[0].Value;

      Dados.Conexao.Commit;
    except on E: Exception do
      Dados.Conexao.Rollback;
    end;

    Dados.Conexao.StartTransaction;
    try
      Dados.Qry.SQL.Clear;
      Dados.Qry.SQL.Add('INSERT INTO public.endereco_integracao (idendereco, dsuf, nmcidade, nmbairro, nmlogradouro, dscomplemento) '+
                    'VALUES (:idendereco, :dsuf, :nmcidade, :nmbairro, :nmlogradouro, :dscomplemento) ');

      Dados.Qry.ParamByName('idendereco').AsInteger     := ID;
      Dados.Qry.ParamByName('dsuf').AsString            := vCEP.UF;
      Dados.Qry.ParamByName('nmcidade').AsString        := vCEP.LOCALIDADE;
      Dados.Qry.ParamByName('nmbairro').AsString        := vCEP.BAIRRO;
      Dados.Qry.ParamByName('nmlogradouro').AsString    := vCEP.LOGRADOURO;
      Dados.Qry.ParamByName('dscomplemento').AsString   := vCEP.COMPLEMENTO;
      Dados.Qry.ExecSQL;

      Dados.Conexao.Commit;
    except on E: Exception do
      Dados.Conexao.Rollback;
    end;

    Dados.Conexao.Commit;

    except on E: Exception do begin
      Dados.Conexao.Rollback;
    end;
  end;
end;


end.

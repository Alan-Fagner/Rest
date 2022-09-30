unit uCEP;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  idHTTP,
  IdSSLOpenSSL;

type
  TCEP = class
  private
    Fcep: string;
    FLogradouro: string;
    Fcomplemento :string;
    Fbairro :string;
    Flocalidade :string;
    Fuf :string;
    Fibge :string;
    Fgia :string;
    Fddd :string;
    Fsiafi :string;

  public
    constructor Create;
    destructor Destroy; override;

    Function Consulta(vCEP: string): TCEP;

    Function CEP (Value: string) : TCEP; overload;
    Function CEP : string; overload;
    Function LOGRADOURO (Value: string) : TCEP; overload;
    Function LOGRADOURO : string; overload;
    Function COMPLEMENTO (Value: string) : TCEP; overload;
    Function COMPLEMENTO : string; overload;
    Function BAIRRO (Value: string) : TCEP; overload;
    Function BAIRRO : string; overload;
    Function LOCALIDADE (Value: string) : TCEP; overload;
    Function LOCALIDADE : string; overload;
    Function UF (Value: string) : TCEP; overload;
    Function UF : string; overload;
    Function IBGE (Value: string) : TCEP; overload;
    Function IBGE : string; overload;
    Function GIA (Value: string) : TCEP; overload;
    Function GIA : string; overload;
    Function DDD (Value: string) : TCEP; overload;
    Function DDD : string; overload;
    Function SIAFI (Value: string) : TCEP; overload;
    Function SIAFI : string; overload;


  end;

implementation

{ TCEP }

constructor TCEP.Create;
begin

end;

destructor TCEP.Destroy;
begin
  inherited;
end;

function TCEP.Consulta(vCEP: string): TCEP;
var
  Obj : TJSONObject;
  HTTP: TIdHTTP;
  SSL : TIdSSLIOHandlerSocketOpenSSL;
  Response: TStringStream;
begin
  HTTP := TIdHTTP.Create;
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
  Response := TStringStream.Create('');

  HTTP.IOHandler := SSL;
  HTTP.Request.ContentType := 'application/json';
  SSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
  try
    try
      HTTP.Get('https://viacep.com.br/ws/' + vCEP + '/json', Response);
      Response.Position := 0;

      Obj := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;

      case HTTP.ResponseCode of
        200: begin
          if Obj.FindValue('erro') = nil then begin
            Self.CEP         (Obj.GetValue('cep').Value);
            Self.LOGRADOURO  (Obj.GetValue('logradouro').Value);
            Self.COMPLEMENTO (Obj.GetValue('complemento').Value);
            Self.BAIRRO      (Obj.GetValue('bairro').Value);
            Self.LOCALIDADE  (Obj.GetValue('localidade').Value);
            Self.UF          (Obj.GetValue('uf').value);
            Self.IBGE        (Obj.GetValue('ibge').Value);
            Self.GIA         (Obj.GetValue('gia').Value);
            Self.DDD         (Obj.GetValue('ddd').Value);
            Self.SIAFI       (Obj.GetValue('siafi').Value);
          end else begin
            Self.CEP         ('--');
            Self.LOGRADOURO  ('--');
            Self.COMPLEMENTO ('--');
            Self.BAIRRO      ('--');
            Self.LOCALIDADE  ('--');
            Self.UF          ('--');
            Self.IBGE        ('--');
            Self.GIA         ('--');
            Self.DDD         ('--');
            Self.SIAFI       ('--');
          end;

        end;

        400: begin
          Self.CEP         ('--');
          Self.LOGRADOURO  ('--');
          Self.COMPLEMENTO ('--');
          Self.BAIRRO      ('--');
          Self.LOCALIDADE  ('--');
          Self.UF          ('--');
          Self.IBGE        ('--');
          Self.GIA         ('--');
          Self.DDD         ('--');
          Self.SIAFI       ('--');
        end;
      end;

      Result := Self;

      except on E: Exception do begin
        Self.CEP         ('--');
        Self.LOGRADOURO  ('--');
        Self.COMPLEMENTO ('--');
        Self.BAIRRO      ('--');
        Self.LOCALIDADE  ('--');
        Self.UF          ('--');
        Self.IBGE        ('--');
        Self.GIA         ('--');
        Self.DDD         ('--');
        Self.SIAFI       ('--');
        Result := Self;
      end;
    end;

  finally
    FreeAndNil(Obj);
    Response.Destroy;
    FreeAndNil(SSL);
    FreeAndNil(HTTP);
  end;
end;

function TCEP.BAIRRO: string;
begin
  Result := Fbairro;
end;

function TCEP.BAIRRO(Value: string): TCEP;
begin
  Result := Self;
  Fbairro := Value;
end;

function TCEP.CEP: string;
begin
  Result := Fcep
end;

function TCEP.COMPLEMENTO: string;
begin
  Result := Fcomplemento;
end;

function TCEP.COMPLEMENTO(Value: string): TCEP;
begin
  Result := Self;
  Fcomplemento := Value;
end;

function TCEP.CEP(Value: string): TCEP;
begin
  Result := Self;
  Fcep := Value;
end;

function TCEP.DDD: string;
begin
  Result := Fddd;
end;

function TCEP.DDD(Value: string): TCEP;
begin
  Result := Self;
  Fddd := Value;
end;

function TCEP.GIA: string;
begin
  Result := Fgia;
end;

function TCEP.GIA(Value: string): TCEP;
begin
  Result := Self;
  Fgia := Value;
end;

function TCEP.IBGE(Value: string): TCEP;
begin
  Result := Self;
  Fibge := Value;
end;

function TCEP.IBGE: string;
begin
  Result := Fibge;
end;

function TCEP.LOCALIDADE: string;
begin
  Result := Flocalidade;
end;

function TCEP.LOCALIDADE(Value: string): TCEP;
begin
  Result := Self;
  Flocalidade := Value;
end;

function TCEP.LOGRADOURO(Value: string): TCEP;
begin
  Result := Self;
  FLogradouro := Value;
end;

function TCEP.LOGRADOURO: string;
begin
  Result := FLogradouro;
end;

function TCEP.SIAFI(Value: string): TCEP;
begin
  Result := Self;
  Fsiafi := Value;
end;

function TCEP.SIAFI: string;
begin
  Result := Fsiafi;
end;

function TCEP.UF(Value: string): TCEP;
begin
  Result := Self;
  Fuf := Value;
end;

function TCEP.UF: string;
begin
  Result := Fuf;
end;

end.

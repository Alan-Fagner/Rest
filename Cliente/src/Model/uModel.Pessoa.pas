unit uModel.Pessoa;

interface

uses
  uModel.Interfaces,
  System.JSON,
  System.Classes,
  System.Generics.Collections,
  idHTTP;

type

  TModelPessoa = class(TInterfacedObject, iPessoa)
  private
    HTTP: TIdHTTP;
    Lista: TList<iPessoa>;

    FID : Integer;
    FNatureza : Integer;
    FDocumento : string;
    FPrimeiro : String;
    FSegundo : String;
    FDtRegistro : TDateTime;
    FCep : string;
    FEndereco : string;
    FComplemento : string;
    FBairro : string;
    FCidade : string;
    FUF : string;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iPessoa;

    function List(ID: string = '') : TList<iPessoa>;
    function Insert: boolean;

    function ID (Value: Integer) : iPessoa; overload;
    Function ID : Integer; overload;
    function NATUREZA (Value: Integer) : iPessoa; overload;
    Function NATUREZA : Integer; overload;
    function DOCUMENTO (Value: string) : iPessoa; overload;
    Function DOCUMENTO : string; overload;
    Function NMPRIMEIRO (Value: string) : iPessoa; overload;
    Function NMPRIMEIRO : string; overload;
    Function NMSEGUNDO (Value: string) : iPessoa; overload;
    Function NMSEGUNDO : string; overload;
    Function DTREGISTRO (Value: TDateTime) : iPessoa; overload;
    Function DTREGISTRO : TDateTime; overload;
    Function CEP (Value: string) : iPessoa; overload;
    Function CEP : string; overload;
    Function ENDERECO (Value: string) : iPessoa; overload;
    Function ENDERECO : string; overload;
    Function COMPLEMENTO (Value: string) : iPessoa; overload;
    Function COMPLEMENTO : string; overload;
    Function BAIRRO (Value: string) : iPessoa; overload;
    Function BAIRRO : string; overload;
    Function CIDADE (Value: string) : iPessoa; overload;
    Function CIDADE : string; overload;
    Function UF (Value: string) : iPessoa; overload;
    Function UF : string; overload;

  end;

const
  URL = 'http://localhost:8085/datasnap/rest/TSM/pessoa';

implementation

uses
  System.SysUtils;

{ TModelPessoa }

function TModelPessoa.BAIRRO(Value: string): iPessoa;
begin
  Result := Self;
  FBairro := Value;
end;

function TModelPessoa.BAIRRO: string;
begin
  Result := FBairro;
end;

function TModelPessoa.CEP: string;
begin
  Result := FCep;
end;

function TModelPessoa.CEP(Value: string): iPessoa;
var
i: integer;
Value2: string;
begin
  Result := Self;
  Value := StringReplace(Value,'.','',[rfReplaceAll,rfIgnoreCase]); // remover pontos
  Value := StringReplace(Value,'-','',[rfReplaceAll,rfIgnoreCase]); // remover tra?o

  //valida se ap?s remover pontos, tra?os e espa?os, sobraram somente numeros.
  for i := 1 To Length(value) do begin
    if Value[I] In ['0'..'9'] then
      Value2 := Value2 + value[I];
  end;

  Value := Value2;

  trim(value); // remover espa?os

  //Valida se ap?s essas valida??es o cep contem 8 caracteres
  if Length(Value) < 8 then
    Value := '999999999';

    FCep := Value;
end;

function TModelPessoa.CIDADE: string;
begin
  Result := FCidade;
end;

function TModelPessoa.CIDADE(Value: string): iPessoa;
begin
  Result := Self;
  FCidade := Value;
end;

function TModelPessoa.COMPLEMENTO(Value: string): iPessoa;
begin
  Result := Self;
  FComplemento := Value;
end;

function TModelPessoa.COMPLEMENTO: string;
begin
  Result := FComplemento;
end;

constructor TModelPessoa.Create;
begin
  HTTP := TIdHTTP.Create;
  HTTP.Request.ContentType := 'application/json';
  Lista := TList<iPessoa>.Create;
end;

destructor TModelPessoa.Destroy;
begin
  FreeAndNil(Lista);
  FreeAndNil(HTTP);
  inherited;
end;


function TModelPessoa.DOCUMENTO: string;
begin
  Result := FDocumento;
end;

function TModelPessoa.DOCUMENTO(Value: string): iPessoa;
begin
  Result := Self;
  FDocumento := Value;
end;

function TModelPessoa.DTREGISTRO: TDateTime;
begin
  Result := FDtRegistro;
end;

function TModelPessoa.ENDERECO: string;
begin
  Result := FEndereco
end;

function TModelPessoa.ENDERECO(Value: string): iPessoa;
begin
  Result := Self;
  FEndereco := Value;
end;

function TModelPessoa.DTREGISTRO(Value: TDateTime): iPessoa;
begin
  Result := Self;
  FDtRegistro := Value;
end;

function TModelPessoa.ID: Integer;
begin
  Result := FID;
end;

function TModelPessoa.Insert: boolean;
var
  body: TStringStream;
  Json: string;
  txt : string;
begin
  Result := False;

  Json := '{"NATUREZA": "'+IntToStr(NATUREZA)+'","DOCUMENTO": "'+DOCUMENTO+'","NMPRIMEIRO": "'+NMPRIMEIRO+'","NMSEGUNDO": "'+NMSEGUNDO+'","DTREGISTRO": "'+DateToStr(DTREGISTRO)+'","CEP": "'+CEP+'"}';

  body := TStringStream.Create(Json,TEncoding.UTF8);
  try
    try
      HTTP.Post(URL,body);

      if HTTP.ResponseCode = 200 then begin
        Result := True;
      end;

    except on E: Exception do
      raise Exception.Create('Erro em Inserir Pessoa');
    end;

  finally
    FreeAndNil(body)
  end;

end;

function TModelPessoa.List(ID: string): TList<iPessoa>;
var
  Response: TStringStream;
  JO : TJSONObject;
  JA : TJSONArray;
  i: integer;
  item : TModelPessoa;
begin
  Response := TStringStream.Create('');
  try
    try
      if ID = '' then
        HTTP.Get(URL,Response)
      else
        HTTP.Get(URL+'/'+ID,Response);

      JA := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(Response.DataString),0) as TJSONArray;

      for i := 0 to JA.Count -1 do begin
        JO := (JA.Items[i] as TJSONObject);
        item := TModelPessoa.Create;
        item.ID           (StrToInt(JO.GetValue('ID').Value));
        item.NATUREZA     (StrToInt(JO.GetValue('NATUREZA').Value));
        item.DOCUMENTO    (JO.GetValue('DOCUMENTO').Value);
        item.NMPRIMEIRO   (JO.GetValue('NMPRIMEIRO').Value);
        item.NMSEGUNDO    (JO.GetValue('NMSEGUNDO').Value);
        item.DTREGISTRO   (StrToDate(JO.GetValue('DTREGISTRO').Value));
        item.CEP          (JO.GetValue('CEP').Value);
        item.ENDERECO     (JO.GetValue('ENDERECO').Value);
        item.COMPLEMENTO  (JO.GetValue('COMPLEMENTO').Value);
        item.BAIRRO       (JO.GetValue('BAIRRO').Value);
        item.CIDADE       (JO.GetValue('CIDADE').Value);
        item.UF           (JO.GetValue('UF').Value);

        Lista.Add(item);
      end;

      Result := Lista;

    except on E: Exception do
      raise Exception.Create('Erro em Listar Pessoas');
    end;

  finally
    FreeAndNil(JA);
    FreeAndNil(Response);
  end;
end;

function TModelPessoa.ID(Value: Integer): iPessoa;
begin
  Result := Self;
  FID := Value;
end;

function TModelPessoa.NATUREZA: Integer;
begin
  Result := FNatureza;
end;

function TModelPessoa.NATUREZA(Value: Integer): iPessoa;
begin
  Result := Self;
  FNatureza := Value;
end;

class function TModelPessoa.New: iPessoa;
begin
  Result := Self.Create;
end;

function TModelPessoa.NMPRIMEIRO(Value: string): iPessoa;
begin
  Result := Self;
  FPrimeiro := Value;
end;

function TModelPessoa.NMPRIMEIRO: string;
begin
  Result := FPrimeiro;
end;

function TModelPessoa.NMSEGUNDO(Value: string): iPessoa;
begin
  Result := Self;
  FSegundo := Value;
end;

function TModelPessoa.NMSEGUNDO: string;
begin
  Result := FSegundo;
end;

function TModelPessoa.UF(Value: string): iPessoa;
begin
  Result := Self;
  FUF := Value;
end;

function TModelPessoa.UF: string;
begin
  Result := FUF;
end;

end.

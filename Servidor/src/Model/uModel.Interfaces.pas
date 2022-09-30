unit uModel.Interfaces;

interface

uses
  System.JSON,
  FireDAC.Comp.Client;

type
  iPessoa = interface
    ['{87A8AFF6-E1FA-4C53-9594-EF6650ED62BF}']
    function List(ID: string): TJSONArray;
    function Insert(Pessoa: TJSONObject):TJSONObject;
    function Update(Pessoa: TJSONObject):TJSONObject;
    function Delete(ID: string): TJSONObject;

    function ID(Value: Integer) : iPessoa; overload;
    Function ID:Integer; overload;
    function NATUREZA(Value: Integer) : iPessoa; overload;
    Function NATUREZA:Integer; overload;
    function DOCUMENTO(Value: string) : iPessoa; overload;
    Function DOCUMENTO:string; overload;
    Function NMPRIMEIRO(Value: string) : iPessoa; overload;
    Function NMPRIMEIRO:string; overload;
    Function NMSEGUNDO(Value: string) : iPessoa; overload;
    Function NMSEGUNDO:string; overload;
    Function DTREGISTRO(Value: TDateTime) : iPessoa; overload;
    Function DTREGISTRO:TDateTime; overload;
    function CEP(Value: string) : iPessoa; overload;
    Function CEP:string; overload;
    function ENDERECO(Value: string) : iPessoa; overload;
    Function ENDERECO:string; overload;
    function COMPLEMENTO(Value: string) : iPessoa; overload;
    Function COMPLEMENTO:string; overload;
    function BAIRRO(Value: string) : iPessoa; overload;
    Function BAIRRO:string; overload;
    function CIDADE(Value: string) : iPessoa; overload;
    Function CIDADE:string; overload;
    function UF(Value: string) : iPessoa; overload;
    Function UF:string; overload;

  end;

implementation

end.

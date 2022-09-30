unit uModel.Interfaces;

interface

uses
  System.Classes,
  System.Generics.Collections;

type

  iPessoa = interface
    ['{04CFF5CD-E14D-4223-8CB2-90D85C213445}']

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

implementation


end.

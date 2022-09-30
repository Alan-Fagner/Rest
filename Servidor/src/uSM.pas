unit uSM;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  Datasnap.DSServer,
  Datasnap.DSAuth,
  uController.Interfaces;

type
{$METHODINFO ON}
  TSM = class(TComponent)
  private
    Controller : iController;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    Function Pessoa(ID:string) : TJSONArray;                       //get
    Function AcceptPessoa(pessoa: TJSONObject) : TJSONObject;      //put
    Function UpdatePessoa(pessoa: TJSONObject) : TJSONObject;      //post
    Function cancelPessoa(ID:string) : TJSONObject;                //delete
  end;
{$METHODINFO OFF}

implementation

uses
  uController;

{ TSM }

function TSM.AcceptPessoa(pessoa: TJSONObject): TJSONObject;
begin
  Result := Controller.Pessoa.Update(pessoa);
end;

function TSM.cancelPessoa(ID: string): TJSONObject;
begin
  Result := Controller.Pessoa.Delete(ID);
end;

constructor TSM.Create(AOwner: TComponent);
begin
  inherited;
  Controller := TController.New;
end;

destructor TSM.Destroy;
begin

  inherited;
end;

function TSM.Pessoa(ID: string): TJSONArray;
begin
  Result := Controller.Pessoa.List(ID);
end;

function TSM.UpdatePessoa(pessoa: TJSONObject): TJSONObject;
begin
  Result := Controller.Pessoa.Insert(pessoa);
end;

end.


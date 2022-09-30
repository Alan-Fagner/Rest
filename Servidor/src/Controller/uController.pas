unit uController;

interface

uses
  uController.Interfaces, uModel.Interfaces;

type

  TController = class(TInterfacedObject, iController)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iController;

    Function Pessoa: iPessoa;

  end;

implementation

uses
  uModel.Pessoa;

{ TController }

constructor TController.Create;
begin

end;

destructor TController.Destroy;
begin

  inherited;
end;

class function TController.New: iController;
begin
  Result:= Self.Create;
end;

function TController.Pessoa: iPessoa;
begin
  Result := TModelPessoa.New;
end;

end.

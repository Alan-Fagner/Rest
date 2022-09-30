unit uPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  uController.Interfaces,
  idHTTP;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    LV: TListView;
    Panel2: TPanel;
    Panel3: TPanel;
    OD: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure LVDblClick(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private
    Controller: iController;

    Procedure ListaTodos;
  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  uController, uPessoa, IdMultipartFormData, System.Types,System.StrUtils,
  uEnviar;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Controller := TController.New;
  ListaTodos;
end;

procedure TFrmPrincipal.ListaTodos;
var
  i: integer;
  item: TListItem;
begin
  LV.Clear;
  with Controller.Pessoa.List do begin
    for i := 0 to Count -1 do begin
      item := LV.Items.Add;
      item.Caption := IntToStr(Items[i].ID);
      item.SubItems.Add(Items[i].NMPRIMEIRO);
      item.SubItems.Add(Items[i].NMSEGUNDO);
      item.SubItems.Add(DateToStr(Items[i].DTREGISTRO));
      item.SubItems.Add(IntToStr(Items[i].NATUREZA));
      item.SubItems.Add(Items[i].DOCUMENTO);
      item.SubItems.Add(Items[i].CEP);
      item.SubItems.Add(Items[i].ENDERECO);
      item.SubItems.Add(Items[i].COMPLEMENTO);
      item.SubItems.Add(Items[i].BAIRRO);
      item.SubItems.Add(Items[i].CIDADE);
      item.SubItems.Add(Items[i].UF);
    end;

  end;
end;

procedure TFrmPrincipal.LVDblClick(Sender: TObject);
begin
  FrmPessoa:= TFrmPessoa.Create(Self);
  try
    FrmPessoa.ShowModal;
  finally
    FreeAndNil(FrmPessoa);
  end;
end;

procedure TFrmPrincipal.Panel2Click(Sender: TObject);
begin
  FrmPessoa:= TFrmPessoa.Create(Self);
  try
    FrmPessoa.ShowModal;

    if FrmPessoa.ModalResult = mrOk then begin
      ListaTodos;
    end;

  finally
    FreeAndNil(FrmPessoa);
  end;
end;

procedure TFrmPrincipal.Panel3Click(Sender: TObject);
begin
  FrmEnviar := TFrmEnviar.Create(Self);
  try
    FrmEnviar.ShowModal;
  finally
    FreeAndNil(FrmEnviar);
  end;

  ListaTodos;
end;

end.

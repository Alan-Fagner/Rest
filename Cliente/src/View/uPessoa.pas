unit uPessoa;

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
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  uController.Interfaces;

type
  TFrmPessoa = class(TForm)
    EdtNome: TEdit;
    LblNome: TLabel;
    LblSobrenome: TLabel;
    EdtSobrenome: TEdit;
    Label1: TLabel;
    EdtDocumento: TEdit;
    Label2: TLabel;
    EdtNatural: TEdit;
    DTP: TDateTimePicker;
    Label3: TLabel;
    EdtCep: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    Controller: iController;
  public
    { Public declarations }
  end;

var
  FrmPessoa: TFrmPessoa;

implementation

uses
  uController;

{$R *.dfm}




procedure TFrmPessoa.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmPessoa.BitBtn2Click(Sender: TObject);
begin
  Controller.Pessoa
    .NMPRIMEIRO (EdtNome.Text)
    .NMSEGUNDO  (EdtSobrenome.Text)
    .DOCUMENTO  (EdtDocumento.Text)
    .NATUREZA   (StrToInt(EdtNatural.Text))
    .CEP        (EdtCep.Text)
    .Insert;
end;

procedure TFrmPessoa.FormCreate(Sender: TObject);
begin
  Controller := TController.New;
end;

end.

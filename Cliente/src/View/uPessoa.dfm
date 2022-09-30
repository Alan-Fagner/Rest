object FrmPessoa: TFrmPessoa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pessoa'
  ClientHeight = 216
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object LblNome: TLabel
    Left = 3
    Top = 10
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object LblSobrenome: TLabel
    Left = 205
    Top = 10
    Width = 61
    Height = 15
    Caption = 'Sobrenome'
  end
  object Label1: TLabel
    Left = 3
    Top = 63
    Width = 63
    Height = 15
    Caption = 'Documento'
  end
  object Label2: TLabel
    Left = 205
    Top = 63
    Width = 39
    Height = 15
    Caption = 'Natural'
  end
  object Label3: TLabel
    Left = 3
    Top = 116
    Width = 91
    Height = 15
    Caption = 'Data do Cadastro'
  end
  object Label4: TLabel
    Left = 205
    Top = 116
    Width = 21
    Height = 15
    Caption = 'CEP'
  end
  object EdtNome: TEdit
    Left = 3
    Top = 30
    Width = 192
    Height = 23
    TabOrder = 0
  end
  object EdtSobrenome: TEdit
    Left = 205
    Top = 30
    Width = 192
    Height = 23
    TabOrder = 1
  end
  object EdtDocumento: TEdit
    Left = 3
    Top = 83
    Width = 192
    Height = 23
    TabOrder = 2
  end
  object EdtNatural: TEdit
    Left = 205
    Top = 83
    Width = 192
    Height = 23
    TabOrder = 3
  end
  object DTP: TDateTimePicker
    Left = 3
    Top = 136
    Width = 192
    Height = 23
    Date = 44821.000000000000000000
    Time = 0.726877326385874800
    TabOrder = 4
  end
  object EdtCep: TEdit
    Left = 205
    Top = 136
    Width = 192
    Height = 23
    TabOrder = 5
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 178
    Width = 394
    Height = 35
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 6
    object BitBtn1: TBitBtn
      AlignWithMargins = True
      Left = 267
      Top = 3
      Width = 120
      Height = 25
      Align = alRight
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      AlignWithMargins = True
      Left = 141
      Top = 3
      Width = 120
      Height = 25
      Align = alRight
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end

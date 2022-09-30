object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cliente'
  ClientHeight = 768
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 100
    Height = 762
    Margins.Right = 0
    Align = alLeft
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 90
      Height = 80
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 89
      Width = 90
      Height = 80
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = 'Enviar Arquivo'
      TabOrder = 1
      OnClick = Panel3Click
    end
  end
  object LV: TListView
    AlignWithMargins = True
    Left = 106
    Top = 3
    Width = 915
    Height = 762
    Align = alClient
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'ID'
      end
      item
        AutoSize = True
        Caption = 'Nome'
      end
      item
        AutoSize = True
        Caption = 'Sobrenome'
      end
      item
        Alignment = taCenter
        Caption = 'Data'
        Width = 80
      end
      item
        Caption = 'Natureza'
        Width = 80
      end
      item
        Caption = 'Documento'
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = 'CEP'
        Width = 80
      end
      item
        Caption = 'Endere'#231'o'
        Width = 300
      end
      item
        Caption = 'Complemento'
        Width = 150
      end
      item
        Caption = 'Bairro'
        Width = 150
      end
      item
        Caption = 'Cidade'
        Width = 150
      end
      item
        Alignment = taCenter
        Caption = 'UF'
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = LVDblClick
  end
  object OD: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Texto|*.txt'
    InitialDir = 'C:\Rest\Cliente\Arquivos'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Left = 456
    Top = 264
  end
end

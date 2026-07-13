object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 40
    Top = 80
    Width = 96
    Height = 15
    Caption = 'Digite o Alimento:'
  end
  object edtAlimento: TEdit
    Left = 40
    Top = 101
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object btnBuscar: TButton
    Left = 174
    Top = 100
    Width = 83
    Height = 25
    Caption = 'Buscar Dados'
    TabOrder = 1
  end
  object memResultado: TMemo
    Left = 40
    Top = 149
    Width = 313
    Height = 132
    TabOrder = 2
  end
end

object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Busca de Informa'#231#245'es Nutricionais'
  ClientHeight = 400
  ClientWidth = 500
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 249
    Height = 21
    Caption = 'Qual alimento voc'#234' deseja buscar?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = []
    ParentFont = False
  end
  object edtAlimento: TEdit
    Left = 20
    Top = 55
    Width = 330
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    TextHint = 'Ex: Ma'#231#227', Arroz, Frango...'
  end
  object btnBuscar: TButton
    Left = 360
    Top = 53
    Width = 120
    Height = 30
    Anchors = [akTop, akRight]
    Caption = 'Buscar'
    Cursor = crHandPoint
    TabOrder = 1
  end
  object memResultado: TMemo
    Left = 20
    Top = 100
    Width = 460
    Height = 280
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
end

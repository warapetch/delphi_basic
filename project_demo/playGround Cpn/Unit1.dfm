object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 30
  object Label1: TLabel
    Left = 80
    Top = 32
    Width = 121
    Height = 38
    Alignment = taCenter
    AutoSize = False
    Caption = 'Label1'
    Color = clRed
    ParentColor = False
    Transparent = False
  end
  object Edit1: TEdit
    Left = 80
    Top = 168
    Width = 305
    Height = 38
    MaxLength = 5
    NumbersOnly = True
    PasswordChar = '?'
    TabOrder = 2
    TextHint = #3585#3635#3627#3609#3604#3619#3627#3633#3626#3612#3656#3634#3609
  end
  object Memo1: TMemo
    Left = 344
    Top = 8
    Width = 272
    Height = 148
    HideSelection = False
    Lines.Strings = (
      'Memo1'
      '00002'
      '00003'
      '00004')
    ScrollBars = ssVertical
    TabOrder = 1
    OnClick = Memo1Click
    OnDblClick = Memo1DblClick
  end
  object Button1: TButton
    Left = 216
    Top = 24
    Width = 97
    Height = 49
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 408
    Top = 184
    Width = 169
    Height = 33
    Caption = 'CheckBox1'
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object RadioButton1: TRadioButton
    Left = 408
    Top = 278
    Width = 153
    Height = 41
    Caption = 'RadioButton1'
    TabOrder = 6
  end
  object ListBox1: TListBox
    Left = 80
    Top = 264
    Width = 305
    Height = 97
    ItemHeight = 30
    Items.Strings = (
      #3626#3623#3633#3626#3604#3637#3648#3604#3621#3652#3615
      #3617#3634#3648#3619#3637#3618#3609#3585#3633#3609)
    TabOrder = 4
    OnClick = ListBox1Click
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 212
    Width = 305
    Height = 38
    TabOrder = 3
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
    OnClick = ComboBox1Click
    Items.Strings = (
      '00000'
      '11111'
      '22222'
      '33333')
  end
  object Panel1: TPanel
    Left = 0
    Top = 384
    Width = 624
    Height = 57
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 7
    object Button2: TButton
      Tag = 1
      Left = 408
      Top = 8
      Width = 105
      Height = 41
      Caption = 'Button2'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object CheckBox2: TCheckBox
    Left = 408
    Top = 223
    Width = 169
    Height = 33
    Caption = 'CheckBox2'
    TabOrder = 8
  end
  object RadioButton2: TRadioButton
    Left = 408
    Top = 320
    Width = 153
    Height = 41
    Caption = 'RadioButton2'
    TabOrder = 9
  end
end

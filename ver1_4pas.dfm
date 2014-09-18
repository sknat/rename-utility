object Form1: TForm1
  Left = 287
  Top = 166
  Width = 711
  Height = 553
  Caption = 'Renommer les fichiers'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000330077000000000000000000000000003B077070000000000000
    000000000000BB807007000000000000000000000300B0007000700000000000
    00000000330070070700070000000000000000003B0700700070007000000000
    00000000BB800700000700070000000000000300B00070000000700070000000
    0000330070070000000007000700000000003B07007000000000007007000000
    0000BB800700000000000007070000000300B000700000000070000077000000
    330070070000000007000000803300003B070070000000000000000800330000
    BB8007000000000000000080BBBB0300B000700000000070000008000BB03300
    70070000000707000000803300003B070070000000707000000800330000BB80
    07000000070700000080BBBB0000B000700000000070000008000BB000007007
    0000000007000000803300000000707000007770000000080033000000008700
    0007070700000080BBBB00000000080000077777000008000BB0000000000080
    0007070700008033000000000000000800007770000800330000000000000000
    800000000080BBBB00000000000000000800000008000BB00000000000000000
    0080000080330000000000000000000000080008003300000000000000000000
    00008080BBBB00000000000000000000000008000BB00000000000000000FFFF
    33FFFFFF21FFFFFF00FFFFFB007FFFF3003FFFF2001FFFF0000FFFB00007FF30
    0003FF200003FF000003FB000003F3000000F2000000F0000010B00000393000
    000F2000000F0000010F0000039F000000FF000000FF000010FF800039FFC000
    0FFFE0000FFFF0010FFFF8039FFFFC00FFFFFE00FFFFFF10FFFFFFB9FFFF}
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbox: TListBox
    Left = 224
    Top = 8
    Width = 233
    Height = 441
    ItemHeight = 13
    MultiSelect = True
    Sorted = True
    TabOrder = 0
    OnMouseUp = lboxMouseUp
  end
  object dirbox: TShellTreeView
    Left = 8
    Top = 8
    Width = 209
    Height = 441
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    AutoRefresh = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 1
    OnClick = dirboxClick
  end
  object config: TGroupBox
    Left = 464
    Top = 344
    Width = 233
    Height = 105
    Caption = 'configuration'
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 56
      Width = 98
      Height = 13
      Caption = 'Nombre de champs :'
    end
    object cksousdos: TCheckBox
      Left = 24
      Top = 80
      Width = 129
      Height = 17
      Caption = 'voir les sous-dossiers'
      TabOrder = 5
    end
    object btrefresh: TButton
      Left = 136
      Top = 16
      Width = 25
      Height = 25
      Hint = 'actualiser'
      Caption = 'v'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btrefreshClick
    end
    object btstartdir: TButton
      Left = 24
      Top = 16
      Width = 105
      Height = 25
      Caption = 'repertoire racine'
      TabOrder = 0
      OnClick = btstartdirClick
    end
    object edchampnum: TEdit
      Left = 152
      Top = 56
      Width = 17
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '7'
    end
    object btchampdim: TButton
      Left = 128
      Top = 56
      Width = 17
      Height = 17
      Caption = '<'
      TabOrder = 2
      OnClick = btchampdimClick
    end
    object btchampadd: TButton
      Left = 176
      Top = 56
      Width = 17
      Height = 17
      Caption = '>'
      TabOrder = 4
      OnClick = btchampaddClick
    end
  end
  object infos: TGroupBox
    Left = 464
    Top = 232
    Width = 233
    Height = 105
    Caption = 'informations'
    TabOrder = 3
    object lbelem: TLabel
      Left = 9
      Top = 28
      Width = 161
      Height = 13
      Caption = '0 fichiers en cours de visualisation'
    end
    object lbsel: TLabel
      Left = 9
      Top = 44
      Width = 176
      Height = 13
      Caption = '0 '#233'l'#233'ments actuellement selectionn'#233's'
    end
    object Label3: TLabel
      Left = 56
      Top = 72
      Width = 106
      Height = 13
      Caption = 'Renommer version 1.4'
      OnClick = Label3Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 464
    Top = 8
    Width = 233
    Height = 217
    Caption = 'Renommer'
    TabOrder = 4
    object btrename: TButton
      Left = 80
      Top = 184
      Width = 81
      Height = 25
      Caption = '>> renommer'
      TabOrder = 7
      OnClick = btrenameClick
    end
    object Edit1: TEdit
      Left = 8
      Top = 16
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 152
      Top = 40
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      OnChange = ComboBox2Change
    end
    object Edit2: TEdit
      Left = 8
      Top = 40
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object ComboBox3: TComboBox
      Left = 152
      Top = 64
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 10
      OnChange = ComboBox3Change
    end
    object Edit3: TEdit
      Left = 8
      Top = 64
      Width = 137
      Height = 21
      TabOrder = 2
    end
    object ComboBox4: TComboBox
      Left = 152
      Top = 88
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 11
      OnChange = ComboBox4Change
    end
    object Edit4: TEdit
      Left = 8
      Top = 88
      Width = 137
      Height = 21
      TabOrder = 3
    end
    object ComboBox5: TComboBox
      Left = 152
      Top = 112
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 12
      OnChange = ComboBox5Change
    end
    object Edit5: TEdit
      Left = 8
      Top = 112
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object ComboBox6: TComboBox
      Left = 152
      Top = 136
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 13
      OnChange = ComboBox6Change
    end
    object Edit6: TEdit
      Left = 8
      Top = 136
      Width = 137
      Height = 21
      TabOrder = 5
    end
    object ComboBox7: TComboBox
      Left = 152
      Top = 160
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 14
      OnChange = ComboBox7Change
    end
    object Edit7: TEdit
      Left = 8
      Top = 160
      Width = 137
      Height = 21
      TabOrder = 6
    end
    object ComboBox1: TComboBox
      Left = 152
      Top = 16
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      Text = 'Texte'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Texte'
        'Incr'#233'mant'
        'Espace')
    end
  end
end

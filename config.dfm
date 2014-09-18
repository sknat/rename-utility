object Form2: TForm2
  Left = 236
  Top = 303
  Width = 704
  Height = 266
  Caption = 'Param'#232'tres'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 681
    Height = 225
    ActivePage = TabSheet5
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Texte'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 231
        Height = 13
        Caption = 'Param'#233'trer l'#39' ajout de texte dans le nom du fichier'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Espace'
      ImageIndex = 1
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 168
        Height = 13
        Caption = 'Param'#233'trer les espaces entre textes'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Incr'#233'mant'
      ImageIndex = 2
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 193
        Height = 13
        Caption = 'Incr'#233'mant de liste d'#39'un groupe de fichiers'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Tronquer'
      ImageIndex = 3
      object Label5: TLabel
        Left = 8
        Top = 8
        Width = 262
        Height = 13
        Caption = 'Comment redimensionner le nom d'#39'un groupe de fichiers'
      end
      object Label6: TLabel
        Left = 152
        Top = 42
        Width = 111
        Height = 13
        Caption = 'Nombre de caract'#232'res :'
      end
      object Label7: TLabel
        Left = 152
        Top = 74
        Width = 111
        Height = 13
        Caption = 'Nombre de caract'#232'res :'
      end
      object CheckBox1: TCheckBox
        Left = 24
        Top = 40
        Width = 121
        Height = 17
        Caption = 'Tronquer '#224' gauche'
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 24
        Top = 72
        Width = 121
        Height = 17
        Caption = 'Tronquer '#224' droite'
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 272
        Top = 40
        Width = 65
        Height = 21
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 272
        Top = 72
        Width = 65
        Height = 21
        TabOrder = 3
      end
      object CheckBox3: TCheckBox
        Left = 24
        Top = 104
        Width = 241
        Height = 17
        Caption = 'Retirer une chaine de caracteres pr'#233'cise :'
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 272
        Top = 104
        Width = 209
        Height = 21
        TabOrder = 5
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Date'
      ImageIndex = 4
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 180
        Height = 13
        Caption = 'Ajout de la date dans le nom du fichier'
      end
      object RadioButton1: TRadioButton
        Left = 24
        Top = 40
        Width = 153
        Height = 17
        Caption = 'Date de cr'#233'ation du fichier'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 24
        Top = 64
        Width = 169
        Height = 17
        Caption = 'Date du clich'#233' pour les JPG'
        TabOrder = 1
      end
    end
  end
end

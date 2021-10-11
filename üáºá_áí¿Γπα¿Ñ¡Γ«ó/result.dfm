object Form3: TForm3
  Left = 419
  Top = 397
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
  ClientHeight = 143
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 65
    Width = 290
    Height = 78
    Align = alClient
    Caption = #1054#1094#1077#1085#1082#1072
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Edit1: TEdit
      Left = 8
      Top = 20
      Width = 121
      Height = 19
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object cbocenka1: TComboBox
      Left = 136
      Top = 20
      Width = 145
      Height = 21
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 1
      Text = #1054#1094#1077#1085#1082#1072
      OnChange = cbocenka1Change
      Items.Strings = (
        #1054#1090#1083#1080#1095#1085#1086
        #1061#1086#1088#1086#1096#1086
        #1059#1076#1086#1074#1083#1080#1090#1074#1086#1088#1080#1090#1077#1083#1100#1085#1086
        #1053#1077#1091#1076#1086#1074#1083#1080#1090#1074#1086#1088#1080#1090#1077#1083#1100#1085#1086
        #1053#1077#1103#1074#1082#1072)
    end
    object Button1: TButton
      Left = 104
      Top = 48
      Width = 75
      Height = 25
      Caption = #1054#1082
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 290
    Height = 65
    Align = alTop
    Caption = #8470' '#1073#1080#1083#1077#1090#1072
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object ENumbilet: TEdit
      Left = 8
      Top = 36
      Width = 65
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = #8470' '#1073#1080#1083#1077#1090#1072
      OnClick = ENumbiletClick
    end
    object Cbneiavka: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = #1053#1077' '#1103#1074#1080#1083#1089#1103
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = CbneiavkaClick
    end
  end
  object Query1: TQuery
    DatabaseName = '.\dbase'
    Left = 256
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 224
    Top = 8
  end
end

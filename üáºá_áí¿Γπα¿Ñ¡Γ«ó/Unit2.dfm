object Form2: TForm2
  Left = 199
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1069#1082#1079#1072#1084#1077#1085#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
  ClientHeight = 337
  ClientWidth = 805
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 805
    Height = 312
    Align = alClient
    Ctl3D = False
    DataSource = DataSource1
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 25
    Align = alTop
    TabOrder = 1
    object cbpredmet: TComboBox
      Left = 280
      Top = 0
      Width = 145
      Height = 21
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      Text = #1069#1082#1079#1072#1084#1077#1085
      OnChange = cbpredmetChange
    end
    object cbspec: TComboBox
      Left = 0
      Top = 0
      Width = 281
      Height = 21
      Ctl3D = False
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 1
      Text = #1042#1099#1073#1080#1088#1080#1090#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      OnChange = cbspecChange
    end
  end
  object Query1: TQuery
    DatabaseName = '.\dbase'
    Left = 288
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 256
    Top = 48
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 288
    Top = 144
    object N1: TMenuItem
      Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1086#1094#1077#1085#1082#1091
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #1057#1074#1086#1076#1085#1072#1103' '#1101#1082#1079#1072#1084#1077#1085#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
      OnClick = N3Click
    end
  end
  object Query2: TQuery
    DatabaseName = '.\dbase'
    Left = 288
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 256
    Top = 80
  end
  object DataSource3: TDataSource
    DataSet = Query3
    Left = 256
    Top = 112
  end
  object Query3: TQuery
    DatabaseName = '.\dbase'
    SQL.Strings = (
      'select '#39'spec.db'#39'.spec'
      'from '#39'spec.db'#39)
    Left = 288
    Top = 112
  end
  object ExcelOLEObject1: TExcelOLEObject
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 256
    Top = 144
  end
end

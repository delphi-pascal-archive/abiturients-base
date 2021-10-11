object Form4: TForm4
  Left = 234
  Top = 226
  BorderStyle = bsSingle
  Caption = #1069#1082#1079#1072#1084#1077#1085#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
  ClientHeight = 418
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 50
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 640
      Top = 10
      Width = 92
      Height = 31
      Caption = #1054#1090#1095#1077#1090
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object cbspec: TComboBox
      Left = 10
      Top = 10
      Width = 434
      Height = 24
      ItemHeight = 16
      TabOrder = 1
      Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
      OnChange = cbspecChange
    end
    object cbpredmet: TComboBox
      Left = 453
      Top = 10
      Width = 178
      Height = 24
      ItemHeight = 16
      TabOrder = 2
      Text = #1069#1082#1079#1072#1084#1077#1085
      OnChange = cbpredmetChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 954
    Height = 368
    Align = alClient
    Ctl3D = False
    DataSource = DataSource1
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Query1: TQuery
    DatabaseName = '.\dbase'
    Left = 208
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 176
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 176
    Top = 88
  end
  object Query2: TQuery
    DatabaseName = '.\dbase'
    Left = 208
    Top = 88
  end
  object ExcelOLEObject1: TExcelOLEObject
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 176
    Top = 152
  end
  object Query3: TQuery
    DatabaseName = '.\dbase'
    SQL.Strings = (
      'select '#39'spec.db'#39'.spec'
      'from '#39'spec.db'#39)
    Left = 208
    Top = 120
  end
  object DataSource3: TDataSource
    DataSet = Query3
    Left = 176
    Top = 120
  end
end

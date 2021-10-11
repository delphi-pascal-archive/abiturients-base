object Form1: TForm1
  Left = 257
  Top = 130
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1041#1072#1079#1072' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1086#1074
  ClientHeight = 204
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 120
  TextHeight = 16
  object Cbspec: TComboBox
    Left = 8
    Top = 120
    Width = 476
    Height = 24
    Ctl3D = False
    ItemHeight = 16
    ParentCtl3D = False
    TabOrder = 0
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
  end
  object EFam: TEdit
    Left = 8
    Top = 8
    Width = 161
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    Text = #1060#1072#1084#1080#1083#1080#1103
    OnClick = EFamClick
    OnKeyPress = EFamKeyPress
    OnKeyUp = EFamKeyUp
    OnMouseMove = EFamMouseMove
  end
  object EName: TEdit
    Left = 8
    Top = 32
    Width = 161
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    Text = #1048#1084#1103
    OnClick = ENameClick
    OnKeyPress = ENameKeyPress
    OnKeyUp = ENameKeyUp
    OnMouseMove = ENameMouseMove
  end
  object EFname: TEdit
    Left = 8
    Top = 56
    Width = 161
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    Text = #1054#1090#1095#1077#1089#1090#1074#1086
    OnClick = EFnameClick
    OnKeyPress = EFnameKeyPress
    OnKeyUp = EFnameKeyUp
    OnMouseMove = EFnameMouseMove
  end
  object EDFam: TEdit
    Left = 329
    Top = 2
    Width = 149
    Height = 24
    TabOrder = 4
    Visible = False
  end
  object EDFname: TEdit
    Left = 329
    Top = 61
    Width = 149
    Height = 24
    TabOrder = 5
    Visible = False
  end
  object EDname: TEdit
    Left = 329
    Top = 31
    Width = 149
    Height = 24
    TabOrder = 6
    Visible = False
  end
  object ESchool: TEdit
    Left = 8
    Top = 80
    Width = 161
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 7
    Text = #1064#1082#1086#1083#1072
    OnClick = ESchoolClick
    OnKeyPress = ESchoolKeyPress
    OnKeyUp = ESchoolKeyUp
    OnMouseMove = ESchoolMouseMove
  end
  object EDSchool: TEdit
    Left = 329
    Top = 90
    Width = 149
    Height = 24
    TabOrder = 8
    Visible = False
  end
  object cbyearo: TComboBox
    Left = 176
    Top = 80
    Width = 129
    Height = 24
    ItemHeight = 16
    TabOrder = 9
    Text = #1043#1086#1076' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    Items.Strings = (
      '1990'
      '1991'
      '1992'
      '1993'
      '1994'
      '1995'
      '1996'
      '1997'
      '1998'
      '1999'
      '2000'
      '2001'
      '2002'
      '2003'
      '2004'
      '2005'
      '2006'
      '2007'
      '2008')
  end
  object Button1: TButton
    Left = 8
    Top = 150
    Width = 473
    Height = 27
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1073#1080#1090#1091#1088#1080#1077#1085#1090#1072
    TabOrder = 10
    OnClick = Button2Click
    OnMouseMove = Button1MouseMove
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 185
    Width = 489
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Query1: TQuery
    DatabaseName = '.\dbase'
    Left = 472
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 440
    Top = 40
  end
  object Query2: TQuery
    DatabaseName = '.\dbase'
    SQL.Strings = (
      'select '#39'spec.db'#39'.spec'
      'from '#39'spec.db'#39)
    Left = 472
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 440
    Top = 8
  end
  object Query3: TQuery
    DatabaseName = '.\dbase'
    Left = 472
    Top = 72
  end
  object DataSource3: TDataSource
    DataSet = Query3
    Left = 440
    Top = 72
  end
  object Query4: TQuery
    DatabaseName = '.\dbase'
    Left = 472
    Top = 104
  end
  object DataSource4: TDataSource
    DataSet = Query4
    Left = 440
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 8
    object N1: TMenuItem
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
      object N2: TMenuItem
        Caption = #1069#1082#1079#1072#1084#1077#1085#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' "'#1069#1082#1079#1072#1084#1077#1085#1072#1094#1080#1086#1085#1085#1072#1103' '#1074#1077#1076#1086#1084#1086#1089#1090#1100'"'
        OnClick = N3Click
      end
    end
  end
end

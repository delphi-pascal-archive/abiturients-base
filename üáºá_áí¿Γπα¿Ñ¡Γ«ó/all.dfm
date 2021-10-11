object Fall: TFall
  Left = 968
  Top = 108
  BorderStyle = bsSingle
  Caption = 'All'
  ClientHeight = 231
  ClientWidth = 148
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Table1: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'fam.DB'
    Left = 8
    Top = 8
  end
  object Table2: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'name.DB'
    Left = 8
    Top = 40
  end
  object Table3: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'fname.DB'
    Left = 8
    Top = 72
  end
  object Table4: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'predmets.DB'
    Left = 8
    Top = 104
  end
  object Table5: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'spec.DB'
    Left = 8
    Top = 136
  end
  object Table6: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'abitur.DB'
    Left = 80
    Top = 104
  end
  object Table7: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'specpred.db'
    Left = 8
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 40
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 40
    Top = 40
  end
  object DataSource3: TDataSource
    DataSet = Table3
    Left = 40
    Top = 72
  end
  object DataSource4: TDataSource
    DataSet = Table4
    Left = 40
    Top = 104
  end
  object DataSource5: TDataSource
    DataSet = Table5
    Left = 40
    Top = 136
  end
  object DataSource6: TDataSource
    DataSet = Table6
    Left = 40
    Top = 168
  end
  object DataSource7: TDataSource
    DataSet = Table7
    Left = 112
    Top = 104
  end
  object DataSource8: TDataSource
    Left = 40
    Top = 200
  end
  object Table8: TTable
    Active = True
    DatabaseName = '.\dbase'
    TableName = 'school.db'
    Left = 8
    Top = 200
  end
end

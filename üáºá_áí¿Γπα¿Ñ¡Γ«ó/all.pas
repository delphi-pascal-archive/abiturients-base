unit all;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables;

const TEXTCBSPEC='Выберите специальность';
      TECTCBPREDMET='Экзамен';

type
  TFall = class(TForm)
    Table1: TTable;
    Table2: TTable;
    Table3: TTable;
    Table4: TTable;
    Table5: TTable;
    Table6: TTable;
    Table7: TTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    Table8: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fall: TFall;

implementation

{$R *.dfm}

end.

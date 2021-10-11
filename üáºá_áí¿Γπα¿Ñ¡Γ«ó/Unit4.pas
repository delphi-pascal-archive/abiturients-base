unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleServer, ExcelXP, DB, DBTables, Grids, DBGrids,
  ExtCtrls,comobj;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Query2: TQuery;
    Button1: TButton;
    ExcelOLEObject1: TExcelOLEObject;
    cbspec: TComboBox;
    cbpredmet: TComboBox;
    Query3: TQuery;
    DataSource3: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure cbspecChange(Sender: TObject);
    procedure cbpredmetChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses all;
procedure TForm4.FormActivate(Sender: TObject);
begin
cbspec.Text:='Выберите специальность';
Query3.Open;
while not Query3.EOF do
begin
  cbspec.Items.Add(Query3.FieldByName('spec').AsString);
  Query3.Next;
end;
query1.Close;
query2.Close;
cbpredmet.Clear;
end;

procedure TForm4.cbspecChange(Sender: TObject);
begin
button1.Enabled:=false;
query1.Close;
CbPredmet.Clear;
query2.Close;
query2.SQL.Clear;
query2.SQL.Add('select predmet');
query2.SQL.Add('from ''predmets.db'',''specpred.db''');
query2.SQL.Add('where ''specpred.db''.idspec='''+inttostr(CbSpec.ItemIndex)+''' and');
query2.SQL.Add('''specpred.db''.idpredmet=''predmets.db''.idpredmet''');
Query2.Open;
while not Query2.EOF do
begin
  CbPredmet.Items.Add(Query2.FieldByName('predmet').AsString);
  Query2.Next;
end;
cbpredmet.Text:=all.TECTCBPREDMET;
cbpredmet.Enabled:=true;

end;

procedure TForm4.cbpredmetChange(Sender: TObject);
var i:byte;
begin
case cbpredmet.ItemIndex of
0:begin
        query1.Close;
        query1.SQL.Clear;
        query1.SQL.Add('select numbilet,fam,name,fname,school,yearo,mark1');
        query1.SQL.Add('from ''fam.db'',''abitur.db'',''school.db'',''name.db'',''fname.db''');
        query1.SQL.Add('where (''abitur.db''.idfam=''fam.db''.idfam) and');
        query1.SQL.Add('(''abitur.db''.idname=''name.db''.idname) and');
        query1.SQL.Add('(''abitur.db''.idfname=''fname.db''.idfname) and');
        query1.SQL.Add('(''abitur.db''.idschool=''school.db''.idschool) and');
        query1.SQL.Add('(''abitur.db''.Numbilet<>'''') and');
        button1.Enabled:=true;
  end;
1:begin
        query1.Close;
        query1.SQL.Clear;
        query1.SQL.Add('select numbilet2,fam,name,fname,school,yearo,mark2');
        query1.SQL.Add('from ''fam.db'',''abitur.db'',''school.db'',''name.db'',''fname.db''');
        query1.SQL.Add('where (''abitur.db''.idfam=''fam.db''.idfam) and');
        query1.SQL.Add('(''abitur.db''.idname=''name.db''.idname) and');
        query1.SQL.Add('(''abitur.db''.idfname=''fname.db''.idfname) and');
        query1.SQL.Add('(''abitur.db''.idschool=''school.db''.idschool) and');
        query1.SQL.Add('(''abitur.db''.Numbilet2<>'''') and');
        button1.Enabled:=true;
end
end;
query1.SQL.Add('(''abitur.db''.idspec='''+inttostr(CbSpec.ItemIndex)+''')');
query1.open;
if query1.Fields.Fields[0].AsString=''
  then
    begin
     for i:=0 to 6 do
      begin
       dbgrid1.Columns.Items[i].Title.Caption:='Нет данных';
       dbgrid1.Columns.Items[i].Width:=65;
      end;
    end
  else
    begin
     dbgrid1.Columns.Items[0].Width:=70;
     dbgrid1.Columns.Items[1].Width:=65;
     dbgrid1.Columns.Items[2].Width:=55;
     dbgrid1.Columns.Items[3].Width:=70;
     dbgrid1.Columns.Items[4].Width:=100;
     dbgrid1.Columns.Items[5].Width:=80;
     dbgrid1.Columns.Items[0].Title.Caption:='№ билета';
     dbgrid1.Columns.Items[1].Title.Caption:='Фамилия';
     dbgrid1.Columns.Items[2].Title.Caption:='Имя';
     dbgrid1.Columns.Items[3].Title.Caption:='Отчество';
     dbgrid1.Columns.Items[4].Title.Caption:='Школа';
     dbgrid1.Columns.Items[5].Title.Caption:='Год окончания';
     dbgrid1.Columns.Items[6].Title.Caption:='Оценка';
    end;

end;

procedure TForm4.Button1Click(Sender: TObject);
var
ExcelApp : variant;
row :integer;
col:integer;
begin
  dbgrid1.DataSource.DataSet.First;
  ExcelApp :=CreateOleObject('Excel.Application');
     ExcelApp.workbooks.open(ExtractFilePath(ParamStr(0))+'1.xls');
    ExcelApp.Visible := true;
    //ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := 'Экзаменационная ведомость';
    ExcelApp.WorkBooks[1].WorkSheets[1].cells[4,1]:=ExcelApp.WorkBooks[1].WorkSheets[1].cells[4,1].value+
    ' '+cbpredmet.Items.Strings[cbpredmet.itemindex];
    ExcelApp.WorkBooks[1].WorkSheets[1].cells[5,1]:=ExcelApp.WorkBooks[1].WorkSheets[1].cells[5,1].value+
    ' '+cbspec.Items.Strings[cbspec.itemindex];
  for row :=0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
  begin
       for col :=0 to DBGrid1.Columns.Count-1 do
        begin
          ExcelApp.WorkBooks[1].WorkSheets[1].cells[row+11,col+2].value:=dbgrid1.DataSource.DataSet.Fields[col].AsString;
          ExcelApp.WorkBooks[1].WorkSheets[1].cells[row+11,1]:=row+1;
        end;
        DBGrid1.DataSource.DataSet.Next;
        ExcelApp.Range[excelapp.cells[11,1],excelapp.cells[11+DBGrid1.DataSource.DataSet.RecordCount-1,9]].select;
        ExcelApp.Selection.Borders.LineStyle:= xlContinuous;
  end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
button1.Enabled:=false;
end;

end.

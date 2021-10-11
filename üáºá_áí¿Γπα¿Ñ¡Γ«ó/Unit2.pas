unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Menus, ExtCtrls,ComObj,
  OleServer, ExcelXP;

type
  TForm2 = class(TForm)
    cbspec: TComboBox;
    DBGrid1: TDBGrid;
    Query1: TQuery;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    cbpredmet: TComboBox;
    Query2: TQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Query3: TQuery;
    Panel1: TPanel;
    N3: TMenuItem;
    ExcelOLEObject1: TExcelOLEObject;
    procedure cbspecChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure cbpredmetChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  ida:string;

implementation

{$R *.dfm}

uses result,all;
procedure TForm2.cbspecChange(Sender: TObject);
var i:byte;
begin
query1.Close;
query1.SQL.Clear;
query1.SQL.Add('select fam,name,fname,mark1,mark2,''abitur.db''.mark1+''abitur.db''.mark2');
query1.SQL.Add('from ''fam.db'',''abitur.db'',''school.db'',''name.db'',''fname.db''');
query1.SQL.Add('where (''abitur.db''.idfam=''fam.db''.idfam) and');
query1.SQL.Add('(''abitur.db''.idname=''name.db''.idname) and');
query1.SQL.Add('(''abitur.db''.idfname=''fname.db''.idfname) and');
query1.SQL.Add('(''abitur.db''.idschool=''school.db''.idschool) and');
query1.SQL.Add('(''abitur.db''.idspec='''+inttostr(CbSpec.ItemIndex)+''')');
query1.open;
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
if query1.Fields.Fields[0].AsString=''
  then
    begin
     for i:=0 to 5 do
      begin
       dbgrid1.Columns.Items[i].Title.Caption:='Нет данных';
       dbgrid1.Columns.Items[i].Width:=65;
      end;
    end
  else
    begin
     dbgrid1.Columns.Items[0].Width:=70;
     dbgrid1.Columns.Items[1].Width:=60;
     dbgrid1.Columns.Items[2].Width:=80;
     dbgrid1.Columns.Items[3].Width:=100;
     dbgrid1.Columns.Items[4].Width:=80;
     dbgrid1.Columns.Items[5].Width:=80;
     dbgrid1.Columns.Items[0].Title.Caption:='Фамилия';
     dbgrid1.Columns.Items[1].Title.Caption:='Имя';
     dbgrid1.Columns.Items[2].Title.Caption:='Отчество';
     dbgrid1.Columns.Items[3].Title.Caption:=cbpredmet.Items.Strings[0];
     dbgrid1.Columns.Items[4].Title.Caption:=
     cbpredmet.Items.Strings[1];
     dbgrid1.Columns.Items[5].Title.Caption:='Всего баллов';
end;

cbpredmet.Enabled:=true;
end;


procedure TForm2.N1Click(Sender: TObject);
var i:word;
null:boolean;
begin
   null:=false;
   all.Fall.Table6.First;
    for i:=1 to all.fall.Table6.RecordCount do
    begin
     if dbgrid1.DataSource.DataSet.Fields[0].AsString=all.fall.Table6.Fields[0].AsString
      then
        ida:=all.fall.Table6.Fields[0].AsString;
     all.fall.Table6.next;
     end;
  result.Form3.ShowModal;
end;

procedure TForm2.cbpredmetChange(Sender: TObject);
var i:byte;
begin
query1.Close;
query1.SQL.Clear;
query1.SQL.Add('select idabitur,fam,name,fname,school,yearo');
query1.SQL.Add('from ''fam.db'',''abitur.db'',''school.db'',''name.db'',''fname.db''');
query1.SQL.Add('where (''abitur.db''.idfam=''fam.db''.idfam) and');
query1.SQL.Add('(''abitur.db''.idname=''name.db''.idname) and');
query1.SQL.Add('(''abitur.db''.idfname=''fname.db''.idfname) and');
query1.SQL.Add('(''abitur.db''.idschool=''school.db''.idschool) and');
case cbpredmet.ItemIndex of
0:query1.SQL.Add('(''abitur.db''.Numbilet='''') and');
1:query1.SQL.Add('(''abitur.db''.Numbilet2='''') and');
end;
query1.SQL.Add('(''abitur.db''.idspec='''+inttostr(CbSpec.ItemIndex)+''')');
query1.open;
if query1.Fields.Fields[0].AsString=''
  then
    begin
     for i:=0 to 5 do
      begin
       dbgrid1.Columns.Items[i].Title.Caption:='Нет данных';
       dbgrid1.Columns.Items[i].Width:=65;
      end;
    end
  else
    begin
     dbgrid1.Columns.Items[0].Width:=0;
     dbgrid1.Columns.Items[1].Width:=65;
     dbgrid1.Columns.Items[2].Width:=55;
     dbgrid1.Columns.Items[3].Width:=70;
     dbgrid1.Columns.Items[4].Width:=100;
     dbgrid1.Columns.Items[5].Width:=80;
     dbgrid1.Columns.Items[1].Title.Caption:='Фамилия';
     dbgrid1.Columns.Items[2].Title.Caption:='Имя';
     dbgrid1.Columns.Items[3].Title.Caption:='Отчество';
     dbgrid1.Columns.Items[4].Title.Caption:='Школа';
     dbgrid1.Columns.Items[5].Title.Caption:='Год окончания';
    end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
Query3.Open;
while not Query3.EOF do
begin
  cbspec.Items.Add(Query3.FieldByName('spec').AsString);
  Query3.Next;
end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
cbspec.itemindex:=-1;
cbpredmet.itemindex:=-1;
cbpredmet.Enabled:=false;
cbpredmet.Text:=all.TECTCBPREDMET;
cbspec.Text:=all.TEXTCBSPEC;
query1.Close;
query2.Close;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
  if (cbspec.ItemIndex=-1) or (cbpredmet.ItemIndex=-1) or
     (query1.Fields.Fields[0].AsString='')
    then
          n1.Enabled:=false
    else
        n1.Enabled:=true;
  if (cbspec.ItemIndex=-1) or
     (query1.Fields.Fields[0].AsString='')
    then
      n3.Enabled:=false
    else
        n3.Enabled:=true;
  if (cbpredmet.ItemIndex<>-1) and (cbspec.ItemIndex<>-1)
    then
        n3.Enabled:=false;
end;


procedure TForm2.N2Click(Sender: TObject);
var
sline: string;
ExcelApp : variant;
row :integer;
col:integer;
begin
  dbgrid1.DataSource.DataSet.First;
  ExcelApp :=CreateOleObject('Excel.Application');
     ExcelApp.workbooks.open('c:\1.xls');
    ExcelApp.Visible := true;
    //ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := 'Экзаменационная ведомость';
    sline:=ExcelApp.WorkBooks[1].WorkSheets[1].cells[2,1].value;
  sline := '';
  for row :=0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
  begin
    sline := '';
       for col :=1 to DBGrid1.Columns.Count-1 do
        begin
//      sline := sline +' '+ DBGrid1.Fields[col].AsString ;
          ExcelApp.WorkBooks[1].WorkSheets[1].cells[row+11,col+2].value:=dbgrid1.DataSource.DataSet.Fields[col].AsString;
        end;
        DBGrid1.DataSource.DataSet.Next;
  end;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
form2.cbpredmetChange(cbpredmet);
end;

procedure TForm2.N3Click(Sender: TObject);
var
ExcelApp : variant;
row,i :integer;
col:integer;
begin
  i:=1;
  dbgrid1.DataSource.DataSet.First;
  ExcelApp :=CreateOleObject('Excel.Application');
     ExcelApp.workbooks.open('c:\2.xls');
    ExcelApp.Visible := true;
    //ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
    ExcelApp.WorkBooks[1].WorkSheets[1].Name := 'Сводная ведомость';
    ExcelApp.WorkBooks[1].WorkSheets[1].cells[4,1]:=ExcelApp.WorkBooks[1].WorkSheets[1].cells[4,1].value+
    ' '+cbspec.Items.Strings[cbspec.itemindex];
  for row :=0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
  begin
       for col :=0 to DBGrid1.Columns.Count-1 do
        begin
           ExcelApp.WorkBooks[1].WorkSheets[1].cells[row+10,col+2].value:=dbgrid1.DataSource.DataSet.Fields[col].AsString;
           ExcelApp.WorkBooks[1].WorkSheets[1].cells[row+10,1]:=row+1;

        end;
        DBGrid1.DataSource.DataSet.Next;
        ExcelApp.Range[excelapp.cells[10,1],excelapp.cells[10+DBGrid1.DataSource.DataSet.RecordCount-1,9]].select;
        ExcelApp.Selection.Borders.LineStyle:= xlContinuous;
  end;
end;

end.

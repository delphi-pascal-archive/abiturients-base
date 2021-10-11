unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables, Grids, DBGrids, Menus, ComCtrls;

type
  TForm1 = class(TForm)
    Query1: TQuery;
    DataSource1: TDataSource;
    Cbspec: TComboBox;
    Query2: TQuery;
    DataSource2: TDataSource;
    EFam: TEdit;
    EName: TEdit;
    EFname: TEdit;
    EDFam: TEdit;
    EDFname: TEdit;
    EDname: TEdit;
    Query3: TQuery;
    DataSource3: TDataSource;
    Query4: TQuery;
    DataSource4: TDataSource;
    ESchool: TEdit;
    EDSchool: TEdit;
    cbyearo: TComboBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Button1: TButton;
    StatusBar1: TStatusBar;
    N3: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure EFamKeyPress(Sender: TObject; var Key: Char);
    procedure EFamKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ENameKeyPress(Sender: TObject; var Key: Char);
    procedure ENameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EFnameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EFnameKeyPress(Sender: TObject; var Key: Char);
    procedure N2Click(Sender: TObject);
    procedure ESchoolKeyPress(Sender: TObject; var Key: Char);
    procedure ESchoolKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure EFamClick(Sender: TObject);
    procedure ENameClick(Sender: TObject);
    procedure EFnameClick(Sender: TObject);
    procedure ESchoolClick(Sender: TObject);
    procedure EFamMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ENameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EFnameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ESchoolMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:word;

implementation

{$R *.dfm}

uses unit2,all,unit4;
procedure TForm1.FormActivate(Sender: TObject);
begin
Query2.Open;
while not Query2.EOF do
begin
  cbspec.Items.Add(Query2.FieldByName('spec').AsString);
  Query2.Next;
end;
end;

procedure TForm1.EFamKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  'А'..'Я','а'..'я':
    begin
      efam.ClearSelection;
      query4.Close;
      query4.SQL.Clear;
      query4.sql.Add('select fam');
      query4.SQL.Add('from ''fam.db''');
      query4.sql.Add('where ''fam.db''.fam like '''+efam.Text+key+'%''');
      query4.Open;
      //memo1.Lines.Add(query4.SQL.Text);
      edfam.Text:=query4.Fields.Fields[0].AsString;
      a:=length(efam.Text);
      efam.Text:=efam.Text+copy(edfam.Text,a+2,length(edfam.Text)-a+1);
      efam.SelStart:=a;
    end;
  #8:;
    else key:=#0;
end;
  end;

procedure TForm1.EFamKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.SetFocus;
Efam.SetFocus;
Efam.SelStart:=a+1;
Efam.SelLength:=length(Efam.Text);
end;

procedure TForm1.ENameKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  'А'..'Я','а'..'я':
    begin
      EName.ClearSelection;
      query4.Close;
      query4.SQL.Clear;
      query4.sql.Add('select name');
      query4.SQL.Add('from ''name.db''');
      query4.sql.Add('where ''name.db''.name like '''+EName.Text+key+'%''');
      query4.Open;
      //memo1.Lines.Add(query4.SQL.Text);
      EDName.Text:=query4.Fields.Fields[0].AsString;
      a:=length(EName.Text);
      EName.Text:=EName.Text+copy(EDName.Text,a+2,length(EDName.Text)-a+1);
      EName.SelStart:=a;
    end;
  #8:;
    else key:=#0;
end;
end;

procedure TForm1.ENameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.SetFocus;
EName.SetFocus;
EName.SelStart:=a+1;
EName.SelLength:=length(EName.Text);
end;

procedure TForm1.EFnameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.SetFocus;
EFName.SetFocus;
EFName.SelStart:=a+1;
EFName.SelLength:=length(EFName.Text);
end;

procedure TForm1.EFnameKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  'А'..'Я','а'..'я':
    begin
      EFName.ClearSelection;
      query4.Close;
      query4.SQL.Clear;
      query4.sql.Add('select fname');
      query4.SQL.Add('from ''fname.db''');
      query4.sql.Add('where ''fname.db''.fname like '''+EFName.Text+key+'%''');
      query4.Open;
      //memo1.Lines.Add(query4.SQL.Text);
      EDFName.Text:=query4.Fields.Fields[0].AsString;
      a:=length(EFName.Text);
      EFName.Text:=EFName.Text+copy(EDFName.Text,a+2,length(EDFName.Text)-a+1);
      EFName.SelStart:=a;
    end;
  #8:;
    else key:=#0;
end;

end;

procedure TForm1.N2Click(Sender: TObject);
begin
unit2.Form2.ShowModal;
end;

procedure TForm1.ESchoolKeyPress(Sender: TObject; var Key: Char);
begin
case key of
  '0'..'9':
    begin
      ESchool.ClearSelection;
      query4.Close;
      query4.SQL.Clear;
      query4.sql.Add('select school');
      query4.SQL.Add('from ''school.db''');
      query4.sql.Add('where ''school.db''.school like '''+ESchool.Text+key+'%''');
      query4.Open;
      //memo1.Lines.Add(query4.SQL.Text);
      EDSchool.Text:=query4.Fields.Fields[0].AsString;
      a:=length(ESchool.Text);
      ESchool.Text:=ESchool.Text+copy(EDSchool.Text,a+2,length(EDSchool.Text)-a+1);
      ESchool.SelStart:=a;
    end;
  #8:;
  ' ':;
    else key:=#0;
end;

end;

procedure TForm1.ESchoolKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
button1.SetFocus;
ESchool.SetFocus;
ESchool.SelStart:=a+1;
ESchool.SelLength:=length(ESchool.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i:byte;
var fm,nm,fn,sh:boolean;
    fam,nam,fnam,school,id:string;
begin
id:='a'+inttostr(all.Fall.Table6.RecordCount+1);
fm:=false;
nm:=false;
fn:=false;
sh:=false;
if (efam.Text='')or(ename.Text='')or(efname.Text='')or
   (eschool.Text='') or (cbspec.ItemIndex=-1) or
  (cbyearo.ItemIndex=-1)
   then MessageDlg('Заполните все поля', mtError,[mbOk], 0)
   else
    begin
      all.Fall.Table6.Last;
      all.Fall.Table6.Insert;
////////////////////////////////////////////
      all.Fall.table1.First;
      for i:=1 to all.Fall.Table1.RecordCount do
        begin
          if efam.Text=all.Fall.Table1.fields[1].AsString
            then
              begin
                fm:=true;
                fam:=all.Fall.Table1.Fields[0].AsString;
              end;
        end;
        if not(fm) then
          begin
            all.Fall.Table1.Last;
            all.Fall.Table1.insert;
            fam:='f'+inttostr(all.Fall.Table1.RecordCount+1);
            all.Fall.Table1.fields[0].asstring:=fam;
            all.Fall.Table1.fields[1].asstring:=efam.Text;
            all.Fall.table1.Post;
          end;
////////////////////////////////////////////
      all.Fall.table2.First;
      for i:=1 to all.Fall.Table2.RecordCount do
        begin
          if ename.Text=all.Fall.Table2.fields[1].AsString
            then
              begin
                nm:=true;
                nam:=all.Fall.Table2.Fields[0].AsString;
              end;
        end;
        if not(nm) then
          begin
            all.Fall.Table2.Last;
            all.Fall.Table2.insert;
            nam:='n'+inttostr(all.Fall.Table2.RecordCount+1);
            all.Fall.Table2.fields[0].asstring:=nam;
            all.Fall.Table2.fields[1].asstring:=ename.Text;
            all.Fall.table2.Post;
          end;
////////////////////////////////////////////
      all.Fall.table3.First;
      for i:=1 to all.Fall.Table3.RecordCount do
        begin
          if efname.Text=all.Fall.Table3.fields[1].AsString
            then
              begin
                fn:=true;
                fnam:=all.Fall.Table3.Fields[0].AsString;
              end;
        end;
        if not(fn) then
          begin
            all.Fall.Table3.Last;
            all.Fall.Table3.insert;
            fnam:='o'+inttostr(all.Fall.Table3.RecordCount+1);
            all.Fall.Table3.fields[0].asstring:=fnam;
            all.Fall.Table3.fields[1].asstring:=efname.Text;
            all.Fall.table3.Post;
          end;
////////////////////////////////////////////
      all.Fall.table8.First;
      for i:=1 to all.Fall.Table8.RecordCount do
        begin
          if eschool.Text=all.Fall.Table8.fields[1].AsString
            then
              begin
                sh:=true;
                school:=all.Fall.Table8.Fields[0].AsString;
              end;
        end;
        if not(sh) then
          begin
            all.Fall.Table8.Last;
            all.Fall.Table8.insert;
            school:='s'+inttostr(all.Fall.Table8.RecordCount+1);
            all.Fall.Table8.fields[0].asstring:=school;
            all.Fall.Table8.fields[1].asstring:=eschool.Text;
            all.Fall.table8.Post;
          end;
////////////////////////////////////////////
    all.Fall.Table6.Fields[0].AsString:=id;
    all.Fall.Table6.Fields[1].AsInteger:=cbspec.ItemIndex;
    all.Fall.Table6.Fields[2].AsString:=fam;
    all.Fall.Table6.Fields[3].AsString:=nam;
    all.Fall.Table6.Fields[4].AsString:=fnam;
    all.Fall.Table6.Fields[5].AsString:=school;
    all.Fall.Table6.Fields[10].Asinteger:=strtoint(cbyearo.Items.Strings[cbyearo.itemindex]);
    all.Fall.Table6.Post;
    all.Fall.Table6.Refresh;
    end;
  efam.Text:='';
  ename.Text:='';
  efname.Text:='';
  eschool.Text:='';
  cbspec.ItemIndex:=-1;
  cbyearo.ItemIndex:=-1;
  cbspec.Text:=all.TEXTCBSPEC;
end;

procedure TForm1.EFamClick(Sender: TObject);
begin
efam.Text:='';
end;

procedure TForm1.ENameClick(Sender: TObject);
begin
ename.Text:='';
end;

procedure TForm1.EFnameClick(Sender: TObject);
begin
efname.Text:='';
end;

procedure TForm1.ESchoolClick(Sender: TObject);
begin
eschool.Text:='';
end;

procedure TForm1.EFamMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
statusbar1.Panels[0].Text:='Поле ввода фамилии';
end;

procedure TForm1.ENameMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
statusbar1.Panels[0].Text:='Поле ввода имени';
end;

procedure TForm1.EFnameMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
statusbar1.Panels[0].Text:='Поле ввода отчества';
end;

procedure TForm1.ESchoolMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
statusbar1.Panels[0].Text:='Поле ввода школы';
end;

procedure TForm1.Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
statusbar1.Panels[0].Text:='Кнопка добавления абитуриента';
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
statusbar1.Panels[0].Text:='Главная форма';
end;

procedure TForm1.N3Click(Sender: TObject);
begin
form4.ShowModal;
end;

end.

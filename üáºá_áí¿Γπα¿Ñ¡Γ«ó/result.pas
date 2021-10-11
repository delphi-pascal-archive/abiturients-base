unit result;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBTables;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    cbocenka1: TComboBox;
    Cbneiavka: TCheckBox;
    ENumbilet: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Query1: TQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CbneiavkaClick(Sender: TObject);
    procedure ENumbiletClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbocenka1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  ocenka1,ocenka2:byte;

implementation

{$R *.dfm}

uses unit2,all;
procedure TForm3.FormActivate(Sender: TObject);
begin
edit1.Text:=unit2.Form2.cbpredmet.Items.Strings[unit2.Form2.cbpredmet.itemindex];
end;

procedure TForm3.CbneiavkaClick(Sender: TObject);
begin
if Cbneiavka.Checked
  then
    begin
      Enumbilet.Text:='Неявка';
      Enumbilet.Enabled:=false;
      cbocenka1.Enabled:=false;
      cbocenka1.ItemIndex:=4;
    end;
if Cbneiavka.Checked=false
  then
    begin
      Enumbilet.Text:='';
      Enumbilet.Enabled:=true;
      cbocenka1.Enabled:=true;
      cbocenka1.ItemIndex:=-1;
      cbocenka1.text:='Оценка';
    end;
end;

procedure TForm3.ENumbiletClick(Sender: TObject);
begin
ENumbilet.Text:='';
end;

procedure TForm3.Button1Click(Sender: TObject);
var i,j:word;
    dblbilet:boolean;
begin
    dblbilet:=false;
    if (cbocenka1.ItemIndex<0) or
       (enumbilet.Text='')
    then
      MessageDlg('Заполните все поля', mtError,[mbOk], 0)
    else
      begin
        all.Fall.Table6.First;
         for i:=1 to all.fall.Table6.RecordCount do
         begin
          case form2.cbpredmet.ItemIndex of
           0:begin
               if all.fall.Table6.Fields[6].AsString=enumbilet.Text
                 then dblbilet:=true
              end;
           1:begin
               if all.fall.Table6.Fields[7].AsString=enumbilet.Text
                 then dblbilet:=true
              end;
           end;
           if (unit2.ida=all.fall.Table6.Fields[0].AsString)and not(dblbilet)
           then
            begin
              all.Fall.Table6.Edit;
              all.fall.Table6.fields[6+unit2.Form2.cbpredmet.ItemIndex].AsString:=enumbilet.Text;
              all.fall.Table6.fields[8+unit2.Form2.cbpredmet.ItemIndex].AsInteger:=ocenka1;
              all.Fall.Table6.post;
            end;
            all.fall.Table6.next;
      end;
    if dblbilet
      then
          MessageDlg('Такой билет уже есть', mtError,[mbOk], 0)
      else
          begin
             all.Fall.Table6.Refresh;
             form3.Close;
        end;
    end;
end;

procedure TForm3.cbocenka1Change(Sender: TObject);
begin
case cbocenka1.ItemIndex of
  0:ocenka1:=5;
  1:ocenka1:=4;
  2:ocenka1:=3;
  3:ocenka1:=2;
  4:ocenka1:=0;
end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
cbneiavka.Checked:=false;
enumbilet.Text:='№ билета';
cbocenka1.ItemIndex:=-1;
cbocenka1.Text:='Оценка';
form2.Query1.Close;
form2.cbspecChange(form2);
form2.Query1.Open;

end;

procedure TForm3.Button2Click(Sender: TObject);
var i:byte;
begin
    all.Fall.Table6.First;
      for i:=1 to all.fall.Table6.RecordCount do
       begin
         case form2.cbpredmet.ItemIndex of
          0:begin
              if all.fall.Table6.Fields[6].AsString=enumbilet.Text
                then
                   MessageDlg('Такой билет уже есть', mtError,[mbOk], 0);
             end;
          1:begin
              if all.fall.Table6.Fields[7].AsString=enumbilet.Text
                then
                    MessageDlg('Такой билет уже есть', mtError,[mbOk], 0);
              end;
          end;
          end;

end;

end.

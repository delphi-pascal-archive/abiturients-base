program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  all in 'all.pas' {Fall},
  Unit2 in 'Unit2.pas' {Form2},
  result in 'result.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFall, Fall);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.

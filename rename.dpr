program rename;

uses
  Forms,
  ver1_4pas in 'ver1_4pas.pas' {Form1},
  Unit1 in 'Unit1.pas' {AboutBox},
  config in 'config.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

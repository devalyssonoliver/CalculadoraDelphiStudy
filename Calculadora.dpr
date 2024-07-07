program Calculadora;

uses
  System.StartUpCopy,
  FMX.Forms,
  unitCalculadora in 'unitCalculadora.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

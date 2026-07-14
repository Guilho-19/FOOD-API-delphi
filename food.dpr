program food;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uDMNutri in 'uDMNutri.pas' {dmNutri: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmNutri, dmNutri);
  Application.Run;
end.

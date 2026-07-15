unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtAlimento: TEdit;
    btnBuscar: TButton;
    memResultado: TMemo;
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDMNutri;

procedure TForm1.btnBuscarClick(Sender: TObject);
var
  responseJSON: string;
  rootJSON, foodsJSON: TJSONObject;
  foodArray: TJSONArray;
  primeiroAlimento: TJSONObject;
begin
  memResultado.Lines.Clear;

  if Trim(edtAlimento.Text) = '' then
  begin
    Application.MessageBox('Por favor, digite o nome de um alimento!', 'A busca não pode ser nula!', MB_OK + MB_ICONWARNING,)
  end;

  memResultado.Lines.Add('Conectando à FatSecret e gerando token...');
  Application.ProcessMessages;

  try
    if dmNutri.GerarToken then
    begin
      memResultado.Lines.Add('Token gerado com sucesso!');
      memResultado.Lines.Add('Buscando dados para: ' + edtAlimento.Text + '...');
      Application.ProcessMessages;

      responseJSON := dmNutri.ConsultarAlimento(edtAlimento.Text);

      memResultado.Lines.Add('');
      memResultado.Lines.Add('=== RETORNO DA API ===');
      memResultado.Lines.Add('');
      memResultado.Lines.Add(responseJSON);

      rootJSON := TJSONObject.ParseJSONValue(responseJSON) as TJSONObject;

      if Assigned(rootJSON) then
      begin
        try
          if rootJSON.TryGetValue<TJSONObject>('foods', foodsJSON) then
          begin
            if foodsJSON.TryGetValue<TJSONArray>('food', foodArray) then
            begin
              if foodArray.Count > 0 then
              begin
                primeiroALimento := foodArray.Items[0] as TJSONObject;

                //memResultado.Lines.Clear
                memResultado.Lines.Add('');
                memResultado.Lines.Add('=== RESULTADO DA BUSCA ===');
                memResultado.Lines.Add('Alimento: ' + primeiroALimento.GetValue<string>('food_name'));
                memResultado.Lines.Add('Resumo: ' + primeiroAlimento.GetValue<string>('food_description'));
              end
              else
              begin
                memResultado.Lines.Add('Nenhum alimento encontrado com esse nome!');
              end;
            end;
          end;
        finally
          rootJSON.Free;
        end;
      end;
    end
    else
    begin
      memResultado.Lines.Add('Falha ao gerar o token de acesso. Verifique as suas credenciais!');
    end;

  except
    on E: Exception do
    begin
      memResultado.Lines.Add('');
      memResultado.Lines.Add('Ocorreu um erro:');
      memResultado.Lines.Add(E.Message);
    end;
  end;
end;

end.

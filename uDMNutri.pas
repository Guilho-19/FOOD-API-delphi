unit uDMNutri;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON,
  REST.Authenticator.OAuth.WebForm.Win, REST.Authenticator.OAuth;

type
  TdmNutri = class(TDataModule)
    clientAPI: TRESTClient;
    requestAPI: TRESTRequest;
    responseAPI: TRESTResponse;
    OAuth2Authenticator1: TOAuth2Authenticator;
  private
    { Private declarations }
    const
      CLIENT_ID = 'c6b62dd5b2d14119895c74243a55c7de';
      CLIENT_SECRET = '4999cdabd84146b5b35cbde9a984903e';
  public
    { Public declarations }
    function GerarToken: Boolean;
    function ConsultarAlimento(const Alimento: string): string;
  end;

var
  dmNutri: TdmNutri;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmNutri }

function TdmNutri.ConsultarAlimento(const Alimento: string): string;
begin
  clientAPI.Authenticator := OAuth2Authenticator1;
  OAuth2Authenticator1.TokenType := TOAuth2TokenType.ttBEARER;

  clientAPI.BaseURL := 'https://platform.fatsecret.com/rest/server.api';
  requestAPI.Resource := '';
  requestAPI.Method := rmGET;

  requestAPI.Params.Clear;
  requestAPI.Params.AddItem('method', 'foods.search', pkGETorPOST);
  requestAPI.Params.AddItem('search_expression', Alimento, pkGETorPOST);
  requestAPI.Params.AddItem('format', 'json', pkGETorPOST);

  // Funcionalidade premium da FatSecretAPI
  // requestAPI.Params.AddItem('language', 'pt', pkGETorPOST);
  // requestAPI.Params.AddItem('region', 'BR', pkGETorPOST);

  try
    requestAPI.Execute;

    if responseAPI.StatusCode = 200 then
      Result := responseAPI.Content
    else
      raise Exception.Create('Erro HTTP ' + responseAPI.StatusCode.ToString);
  except
    on E: Exception do
      raise Exception.Create('Falha na consulta: ' + E.message);
  end;
end;

function TdmNutri.GerarToken: Boolean;
var
  requestToken: TRESTRequest;
  clientToken: TRESTClient;
  responseToken: TRESTResponse;
  JSONObj: TJSONObject;
begin
  Result := False;

  clientToken := TRESTClient.Create(nil);
  requestToken := TRESTRequest.Create(nil);
  responseToken := TRESTResponse.Create(nil);

  try
    requestToken.Client := clientToken;
    requestToken.Response := responseToken;

    clientToken.BaseURL := 'https://oauth.fatsecret.com/connect/token';
    requestToken.Method := rmPOST;

    requestToken.Params.AddItem('scope', 'basic', pkGETorPOST);
    requestToken.Params.AddItem('grant_type', 'client_credentials', pkGETorPOST);
    requestToken.Params.AddItem('client_id', CLIENT_ID, pkGETorPOST);
    requestToken.Params.AddItem('client_secret', CLIENT_SECRET, pkGETorPOST);

    try
      requestToken.Execute;

      if responseToken.StatusCode = 200 then
      begin
        JSONObj := responseToken.JSONValue as TJSONObject;
        if Assigned(JSONObj) then
        begin
          OAuth2Authenticator1.AccessToken := JSONObj.GetValue<string>('access_token');
          Result := True;
        end;
      end
      else
        raise Exception.Create('Error ao gerar token: '+ responseToken.StatusText);
    except
      on E: Exception do
        raise Exception.Create('Falha de conexão no Token: ' + E.Message);
    end;
  finally
    responseToken.Free;
    requestToken.Free;
    clientToken.Free;
  end;
end;

end.

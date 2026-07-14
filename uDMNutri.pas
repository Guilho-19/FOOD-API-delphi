unit uDMNutri;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TdmNutri = class(TDataModule)
    clientAPI: TRESTClient;
    resquestAPI: TRESTRequest;
    responseAPI: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmNutri: TdmNutri;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

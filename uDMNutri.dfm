object dmNutri: TdmNutri
  Height = 480
  Width = 640
  object clientAPI: TRESTClient
    Authenticator = OAuth2Authenticator1
    Params = <>
    SynchronizedEvents = False
    Left = 32
    Top = 24
  end
  object requestAPI: TRESTRequest
    Client = clientAPI
    Params = <>
    Response = responseAPI
    SynchronizedEvents = False
    Left = 32
    Top = 88
  end
  object responseAPI: TRESTResponse
    Left = 32
    Top = 152
  end
  object OAuth2Authenticator1: TOAuth2Authenticator
    Left = 32
    Top = 224
  end
end

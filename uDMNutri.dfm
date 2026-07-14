object dmNutri: TdmNutri
  Height = 480
  Width = 640
  object clientAPI: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 32
    Top = 24
  end
  object resquestAPI: TRESTRequest
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
end

object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 340
  Width = 280
  object Conexao: TSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=21'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=19.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'DSProxyPort=8888')
    Left = 32
    Top = 24
    UniqueId = '{56102300-94FF-4CB5-823C-894FAA4E1F8F}'
  end
  object DSPConexao: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = Conexao
    Left = 120
    Top = 24
  end
  object ConexaoMSS: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=21'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=19.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 32
    Top = 96
    UniqueId = '{EFCFA444-067D-4572-9728-C4021DE0C3C4}'
  end
  object DSPConexaoMSS: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = ConexaoMSS
    Left = 120
    Top = 96
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItens'
    RemoteServer = DSPConexao
    Left = 32
    Top = 168
  end
end

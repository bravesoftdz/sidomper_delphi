object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 164
  Width = 266
  object Conexao: TSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=19.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    BeforeConnect = ConexaoBeforeConnect
    Left = 24
    Top = 24
    UniqueId = '{C942E4A1-2703-49CB-8B9A-65E1990FF05D}'
  end
  object DSPConexao: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = Conexao
    Left = 104
    Top = 24
  end
end

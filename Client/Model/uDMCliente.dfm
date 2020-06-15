inherited DMCliente: TDMCliente
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 271
  Width = 388
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspClienteCons'
    RemoteServer = DM.DSPConexao
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaCli_Id: TAutoIncField
      FieldName = 'Cli_Id'
      Origin = 'Cli_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSConsultaCli_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSConsultaCli_Nome: TWideStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaCli_Dcto: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'Cli_Dcto'
      Origin = 'Cli_Dcto'
      Required = True
      OnGetText = CDSConsultaCli_DctoGetText
      Size = 25
    end
    object CDSConsultaCli_Telefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'Cli_Telefone'
      Origin = 'Cli_Telefone'
      Size = 100
    end
    object CDSConsultaCli_Ativo: TBooleanField
      FieldName = 'Cli_Ativo'
      Origin = 'Cli_Ativo'
      Required = True
    end
    object CDSConsultaCAtivo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CAtivo'
      Size = 3
    end
    object CDSConsultaCli_Fantasia: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'Cli_Fantasia'
      Origin = 'Cli_Fantasia'
      Size = 100
    end
    object CDSConsultaRev_Nome: TWideStringField
      DisplayLabel = 'Revenda'
      FieldName = 'Rev_Nome'
      Origin = 'Rev_Nome'
      Size = 100
    end
    object CDSConsultaCli_Enquadramento: TStringField
      DisplayLabel = 'Enquadramento'
      FieldName = 'Cli_Enquadramento'
      Origin = 'Cli_Enquadramento'
      ReadOnly = True
      Size = 18
    end
    object CDSConsultaUsu_Nome: TWideStringField
      DisplayLabel = 'Consultor'
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      Size = 100
    end
    object CDSConsultaCli_Versao: TStringField
      DisplayLabel = 'Vers'#227'o Atual'
      FieldName = 'Cli_Versao'
      Origin = 'Cli_Versao'
      Size = 25
    end
    object CDSConsultaCli_Fone1: TStringField
      FieldName = 'Cli_Fone1'
      Origin = 'Cli_Fone1'
    end
    object CDSConsultaCli_Fone2: TStringField
      FieldName = 'Cli_Fone2'
      Origin = 'Cli_Fone2'
    end
    object CDSConsultaCli_Celular: TStringField
      FieldName = 'Cli_Celular'
      Origin = 'Cli_Celular'
    end
    object CDSConsultaCli_FoneOutro: TStringField
      FieldName = 'Cli_FoneOutro'
      Origin = 'Cli_FoneOutro'
    end
    object CDSConsultaC_Telefones: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_Telefones'
      Size = 500
    end
    object CDSConsultaC_Marcar: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'C_Marcar'
    end
    object CDSConsultaCli_Perfil: TStringField
      Alignment = taCenter
      DisplayLabel = 'Perfil'
      FieldName = 'Cli_Perfil'
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspClienteCad'
    AfterOpen = CDSCadastroAfterOpen
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroCli_Id: TAutoIncField
      FieldName = 'Cli_Id'
    end
    object CDSCadastroCli_Ativo: TBooleanField
      FieldName = 'Cli_Ativo'
      Required = True
    end
    object CDSCadastroCli_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cli_Codigo'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSCadastroCli_Contato: TWideStringField
      FieldName = 'Cli_Contato'
      Size = 200
    end
    object CDSCadastroCli_Dcto: TStringField
      FieldName = 'Cli_Dcto'
      Required = True
      OnSetText = CDSCadastroCli_DctoSetText
      Size = 25
    end
    object CDSCadastroCli_Endereco: TWideStringField
      FieldName = 'Cli_Endereco'
      Size = 200
    end
    object CDSCadastroCli_Enquadramento: TStringField
      FieldName = 'Cli_Enquadramento'
      Required = True
      FixedChar = True
      Size = 2
    end
    object CDSCadastroCli_Fantasia: TWideStringField
      FieldName = 'Cli_Fantasia'
      Size = 100
    end
    object CDSCadastroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSCadastroCli_Restricao: TBooleanField
      FieldName = 'Cli_Restricao'
      Required = True
    end
    object CDSCadastroCli_Revenda: TIntegerField
      FieldName = 'Cli_Revenda'
      Required = True
    end
    object CDSCadastroCli_Telefone: TStringField
      FieldName = 'Cli_Telefone'
      Size = 100
    end
    object CDSCadastroCli_Usuario: TIntegerField
      FieldName = 'Cli_Usuario'
    end
    object CDSCadastroCli_Versao: TStringField
      FieldName = 'Cli_Versao'
      Size = 25
    end
    object CDSCadastroRev_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Rev_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroCli_Logradouro: TStringField
      FieldName = 'Cli_Logradouro'
      Size = 80
    end
    object CDSCadastroCli_Bairro: TStringField
      FieldName = 'Cli_Bairro'
      Size = 50
    end
    object CDSCadastroCli_CEP: TStringField
      FieldName = 'Cli_CEP'
      EditMask = '##.###-###'
      Size = 15
    end
    object CDSCadastroCli_Cidade: TIntegerField
      FieldName = 'Cli_Cidade'
    end
    object CDSCadastroCid_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cid_Codigo'
      DisplayFormat = '0000000'
    end
    object CDSCadastroCid_Nome: TStringField
      FieldName = 'Cid_Nome'
      Size = 60
    end
    object CDSCadastroCid_UF: TStringField
      FieldName = 'Cid_UF'
      FixedChar = True
      Size = 2
    end
    object CDSCadastroCli_Fone1: TStringField
      FieldName = 'Cli_Fone1'
      EditMask = '(##)####-####'
    end
    object CDSCadastroCli_Fone2: TStringField
      FieldName = 'Cli_Fone2'
      EditMask = '(##)####-####'
    end
    object CDSCadastroCli_Celular: TStringField
      FieldName = 'Cli_Celular'
      EditMask = '(##)#####-####'
    end
    object CDSCadastroCli_FoneOutro: TStringField
      FieldName = 'Cli_FoneOutro'
      Size = 60
    end
    object CDSCadastroCli_ContatoFinanceiro: TStringField
      FieldName = 'Cli_ContatoFinanceiro'
      Size = 60
    end
    object CDSCadastroCli_ContatoFinanceiroFone: TStringField
      FieldName = 'Cli_ContatoFinanceiroFone'
      EditMask = '(##)####-####'
    end
    object CDSCadastroCli_ContatoCompraVenda: TStringField
      FieldName = 'Cli_ContatoCompraVenda'
      Size = 60
    end
    object CDSCadastroCli_ContatoCompraVendaFone: TStringField
      FieldName = 'Cli_ContatoCompraVendaFone'
      EditMask = '(##)####-####'
      Size = 60
    end
    object CDSCadastroCli_IE: TStringField
      FieldName = 'Cli_IE'
      Size = 25
    end
    object CDSCadastroCli_RepreLegal: TStringField
      FieldName = 'Cli_RepreLegal'
      Size = 60
    end
    object CDSCadastroCli_RepreLegalCPF: TStringField
      FieldName = 'Cli_RepreLegalCPF'
      EditMask = '###.###.###-##'
    end
    object CDSCadastroCli_EmpresaVinculada: TIntegerField
      FieldName = 'Cli_EmpresaVinculada'
    end
    object CDSCadastroCli_Latitude: TStringField
      FieldName = 'Cli_Latitude'
      Size = 100
    end
    object CDSCadastroCli_Longitude: TStringField
      FieldName = 'Cli_Longitude'
      Size = 100
    end
    object CDSCadastroCli_Perfil: TStringField
      FieldName = 'Cli_Perfil'
    end
  end
  object Rel: TppReport
    AutoStop = False
    DataPipeline = DBConsulta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 80
    Top = 144
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'DBConsulta'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 12700
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 15610
        mmTop = 12700
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 23283
        mmWidth = 283634
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 71967
        mmTop = 0
        mmWidth = 133086
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3968
        mmLeft = 0
        mmTop = 4763
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 248709
        mmTop = 0
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 210609
        mmTop = 12700
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 13494
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'CNPJ/CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 12700
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Consultor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 210609
        mmTop = 19315
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Revenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 102923
        mmTop = 19315
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Cli_Codigo'
        DataPipeline = DBConsulta
        DisplayFormat = '000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Cli_Nome'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 15610
        mmTop = 0
        mmWidth = 86254
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'C_Telefones'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 210609
        mmTop = 0
        mmWidth = 70115
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Cli_Fantasia'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 103188
        mmTop = 0
        mmWidth = 61913
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'Cli_Dcto'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 168011
        mmTop = 0
        mmWidth = 40217
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'Usu_Nome'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 210609
        mmTop = 5556
        mmWidth = 70115
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'Rev_Nome'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 103188
        mmTop = 5556
        mmWidth = 105040
        BandType = 4
        LayerName = Foreground
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Style = psDot
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 10848
        mmWidth = 283634
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 0
        mmWidth = 283634
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 4498
        mmWidth = 11113
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'Cli_Id'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 13758
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object cdsHistorico: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 80
    object cdsHistoricoTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object cdsHistoricoMes: TStringField
      FieldName = 'Mes'
      Size = 15
    end
    object cdsHistoricoTotalHoras: TFloatField
      FieldName = 'TotalHoras'
    end
    object cdsHistoricoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object cdsHistoricoOpcao: TStringField
      FieldName = 'Opcao'
    end
    object cdsHistoricoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object cdsHistoricoQtde: TFloatField
      FieldName = 'Qtde'
    end
  end
  object dbHistorico: TppDBPipeline
    DataSource = dsHistorico
    UserName = 'dbHistorico'
    Left = 256
    Top = 80
    object dbHistoricoppField1: TppField
      FieldAlias = 'Tipo'
      FieldName = 'Tipo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbHistoricoppField2: TppField
      FieldAlias = 'Mes'
      FieldName = 'Mes'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbHistoricoppField3: TppField
      FieldAlias = 'Qtde'
      FieldName = 'Qtde'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbHistoricoppField4: TppField
      FieldAlias = 'TotalHoras'
      FieldName = 'TotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbHistoricoppField5: TppField
      FieldAlias = 'Valor'
      FieldName = 'Valor'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbHistoricoppField6: TppField
      FieldAlias = 'Opcao'
      FieldName = 'Opcao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbHistoricoppField7: TppField
      FieldAlias = 'Descricao'
      FieldName = 'Descricao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object RelHistorico: TppReport
    AutoStop = False
    DataPipeline = dbHistorico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 304
    Top = 80
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbHistorico'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 83873
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 16140
        mmLeft = 0
        mmTop = 11906
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Hist'#243'rico do Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5821
        mmLeft = 79904
        mmTop = 0
        mmWidth = 43656
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 5027
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 168805
        mmTop = 0
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 47890
        mmTop = 77523
        mmWidth = 21167
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Total Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 79904
        mmTop = 77523
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 77523
        mmWidth = 10583
        BandType = 0
        LayerName = Foreground1
      end
      object HistTotalHoras: TppDBText
        UserName = 'HistTotalHoras'
        DataField = 'TotalHoras'
        DataPipeline = dbHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        DataPipelineName = 'dbHistorico'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 73554
        mmWidth = 17198
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'M'#234's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 77523
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 79904
        mmWidth = 197380
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 22754
        mmWidth = 16933
        BandType = 0
        LayerName = Foreground1
      end
      object lblCliente: TppLabel
        UserName = 'lblCliente'
        Caption = 'lblCliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 22754
        mmWidth = 21167
        BandType = 0
        LayerName = Foreground1
      end
      object ppMemoCliente: TppMemo
        UserName = 'MemoCliente'
        Caption = 'MemoCliente'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        RemoveEmptyLines = False
        Transparent = True
        mmHeight = 47096
        mmLeft = 23548
        mmTop = 28046
        mmWidth = 173832
        BandType = 0
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Revenda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17992
        mmWidth = 16933
        BandType = 0
        LayerName = Foreground1
      end
      object lblConsultor: TppLabel
        UserName = 'lblConsultor'
        Caption = 'lblConsultor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 13758
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Consultor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 13758
        mmWidth = 21167
        BandType = 0
        LayerName = Foreground1
      end
      object lblRevenda: TppLabel
        UserName = 'lblRevenda'
        Caption = 'lblRevenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23548
        mmTop = 17992
        mmWidth = 21167
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'Qtde'
        DataPipeline = dbHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbHistorico'
        mmHeight = 4233
        mmLeft = 49477
        mmTop = 265
        mmWidth = 19579
        BandType = 4
        LayerName = Foreground1
      end
      object HistValor: TppDBText
        UserName = 'HistValor'
        DataField = 'Valor'
        DataPipeline = dbHistorico
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbHistorico'
        mmHeight = 4498
        mmLeft = 112977
        mmTop = 265
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground1
      end
      object lblHistTotalHoras: TppLabel
        UserName = 'lblHistTotalHoras'
        Caption = 'lblHistTotalHoras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 81492
        mmTop = 265
        mmWidth = 21696
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'Descricao'
        DataPipeline = dbHistorico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbHistorico'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 265
        mmWidth = 41804
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'Tipo'
      DataPipeline = dbHistorico
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbHistorico'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 7144
          mmLeft = 0
          mmTop = 529
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'Opcao'
          DataPipeline = dbHistorico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbHistorico'
          mmHeight = 4498
          mmLeft = 1323
          mmTop = 2117
          mmWidth = 54240
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object dsHistorico: TDataSource
    DataSet = cdsHistorico
    Left = 200
    Top = 80
  end
  object CDSContato: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CDSContatoBeforePost
    Left = 272
    Top = 24
    object CDSContatoCont_Id: TIntegerField
      FieldName = 'Cont_Id'
    end
    object CDSContatoCont_Cliente: TIntegerField
      FieldName = 'Cont_Cliente'
    end
    object CDSContatoCont_Orcamento: TIntegerField
      FieldName = 'Cont_Orcamento'
    end
    object CDSContatoCont_Nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Cont_Nome'
      Size = 100
    end
    object CDSContatoCont_Fone1: TStringField
      DisplayLabel = 'Fone1'
      FieldName = 'Cont_Fone1'
      EditMask = '(##)####-####'
      Size = 25
    end
    object CDSContatoCont_Fone2: TStringField
      DisplayLabel = 'Fone2'
      FieldName = 'Cont_Fone2'
      EditMask = '(##)####-####'
      Size = 25
    end
    object CDSContatoCont_Depto: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'Cont_Depto'
      Size = 60
    end
    object CDSContatoCont_Email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'Cont_Email'
      Size = 100
    end
  end
end

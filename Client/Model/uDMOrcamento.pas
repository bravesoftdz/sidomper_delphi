unit uDMOrcamento;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppVar, ppCtrls, ppPrnabl, ppClass, ppBands,
  ppCache, ppDesignLayer, ppParameter, ppProd, ppReport, ppStrtch, ppMemo,
  ppSubRpt, ppEndUsr, ppRichTx, Vcl.Imaging.jpeg, uExtensoValor, ppRegion,
  ppChrt, Vcl.Graphics, System.Generics.Collections, Vcl.Dialogs;

type
  TDMOrcamento = class(TDMBase)
    CDSConsultaOrc_Data: TDateField;
    CDSConsultaOrc_Id: TAutoIncField;
    CDSConsultaOrc_Numero: TIntegerField;
    CDSConsultaPros_Nome: TStringField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSCadastroOrc_Data: TDateField;
    CDSCadastroOrc_Id: TAutoIncField;
    CDSCadastroOrc_Numero: TIntegerField;
    CDSCadastroOrc_Observacao: TMemoField;
    CDSCadastroOrc_ObservacaoEmail: TMemoField;
    CDSCadastroOrc_Prospect: TIntegerField;
    CDSCadastroOrc_Usuario: TIntegerField;
    CDSCadastroPros_Codigo: TIntegerField;
    CDSCadastroPros_Nome: TStringField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSItens: TClientDataSet;
    CDSItensOrcIte_Descricao: TStringField;
    CDSItensOrcIte_Id: TAutoIncField;
    CDSItensOrcIte_Orcamento: TIntegerField;
    CDSItensOrcIte_Produto: TIntegerField;
    CDSItensOrcIte_Status: TIntegerField;
    CDSItensOrcIte_Tipo: TIntegerField;
    CDSItensOrcIte_ValorDescImpl: TCurrencyField;
    CDSItensOrcIte_ValorDescMensal: TCurrencyField;
    CDSItensOrcIte_ValorLicencaImpl: TCurrencyField;
    CDSItensOrcIte_ValorLicencaMensal: TCurrencyField;
    CDSItensProd_Codigo: TIntegerField;
    CDSItensProd_Nome: TWideStringField;
    CDSItensSta_Codigo: TIntegerField;
    CDSItensSta_Nome: TWideStringField;
    CDSItensTip_Codigo: TIntegerField;
    CDSItensTip_Nome: TWideStringField;
    CDSItensModulo: TClientDataSet;
    CDSItensModuloOrcIteMod_Id: TAutoIncField;
    CDSItensModuloOrcIteMod_Descricao: TStringField;
    CDSItensModuloMod_Codigo: TIntegerField;
    CDSItensModuloMod_Nome: TWideStringField;
    CDSItensModuloOrcIteMod_Modulo: TIntegerField;
    CDSItensModuloOrcIteMod_OrcamentoItem: TIntegerField;
    CDSOcorrencia: TClientDataSet;
    CDSOcorrenciaOrcOco_Data: TDateField;
    CDSOcorrenciaOrcOco_Descricao: TStringField;
    CDSOcorrenciaOrcOco_Id: TAutoIncField;
    CDSOcorrenciaOrcOco_Orcamento: TIntegerField;
    CDSOcorrenciaOrcOco_Usuario: TIntegerField;
    CDSOcorrenciaUsu_Codigo: TIntegerField;
    CDSOcorrenciaUsu_Nome: TWideStringField;
    CDSVenctos: TClientDataSet;
    CDSVenctosOrcVect_Data: TDateField;
    CDSVenctosOrcVect_Descricao: TStringField;
    CDSVenctosOrcVect_Id: TAutoIncField;
    CDSVenctosOrcVect_Orcamento: TIntegerField;
    CDSVenctosOrcVect_Parcela: TIntegerField;
    CDSVenctosOrcVect_Valor: TCurrencyField;
    CDSItensTotalLiquido: TAggregateField;
    CDSVenctosTotalParcelas: TAggregateField;
    CDSVenctosParcela: TAggregateField;
    CDSItensTotalDescontoLicenca: TAggregateField;
    CDSItensTotalImpl: TAggregateField;
    CDSCadastroOrc_Cliente: TIntegerField;
    CDSCadastroOrc_Situacao: TIntegerField;
    CDSCadastroCli_Codigo: TIntegerField;
    CDSCadastroCli_Nome: TWideStringField;
    CDSCadastroCSituacao: TStringField;
    CDSCadastroOrc_FormaPagto: TIntegerField;
    CDSCadastroFpg_Codigo: TIntegerField;
    CDSCadastroFpg_Nome: TStringField;
    CDSConsultaOrc_Situacao: TIntegerField;
    CDSConsultaCli_Nome: TWideStringField;
    CDSConsultaCSituacao: TStringField;
    CDSImpressao: TClientDataSet;
    CDSImpressaoOrc_Id: TAutoIncField;
    CDSImpressaoOrc_Numero: TIntegerField;
    CDSImpressaoOrc_Data: TDateField;
    CDSImpressaoOrc_IdUsuario: TIntegerField;
    CDSImpressaoOrc_IdProspect: TIntegerField;
    CDSImpressaoOrc_Observacao: TMemoField;
    CDSImpressaoOrc_ObservacaoEmail: TMemoField;
    CDSImpressaoOrc_IdCliente: TIntegerField;
    CDSImpressaoOrc_Situacao: TIntegerField;
    CDSImpressaoOrc_IdFormaPagto: TIntegerField;
    CDSImpressaoUsu_Codigo: TIntegerField;
    CDSImpressaoUsu_Nome: TWideStringField;
    CDSImpressaoCli_Codigo: TIntegerField;
    CDSImpressaoOrcIte_Id: TAutoIncField;
    CDSImpressaoOrcIte_Orcamento: TIntegerField;
    CDSImpressaoOrc_IdProduto: TIntegerField;
    CDSImpressaoOrcIte_Descricao: TStringField;
    CDSImpressaoOrcIte_ValorLicencaImpl: TCurrencyField;
    CDSImpressaoOrcIte_ValorDescImpl: TCurrencyField;
    CDSImpressaoOrcIte_ValorLicencaMensal: TCurrencyField;
    CDSImpressaoOrcIte_ValorDescMensal: TCurrencyField;
    CDSImpressaoOrc_IdTipo: TIntegerField;
    CDSImpressaoOrc_IdStatus: TIntegerField;
    CDSImpressaoProd_Codigo: TIntegerField;
    CDSImpressaoProd_Nome: TWideStringField;
    CDSImpressaoSta_Codigo: TIntegerField;
    CDSImpressaoSta_Nome: TWideStringField;
    dsImpressao: TDataSource;
    dbImpressao: TppDBPipeline;
    CDSImpressaoSituacaoDescricao: TStringField;
    RelImpressao: TppReport;
    ppParameterList1: TppParameterList;
    CDSImpressaoOcorrencia: TClientDataSet;
    dbImpressaoOcorr: TppDBPipeline;
    dsImpressaoOcorr: TDataSource;
    CDSImpressaoOcorrenciaOrcOco_Data: TDateField;
    CDSImpressaoOcorrenciaOrcOco_Descricao: TStringField;
    CDSImpressaoOcorrenciaOrcOco_Id: TAutoIncField;
    CDSImpressaoOcorrenciaOrcOco_Orcamento: TIntegerField;
    CDSImpressaoOcorrenciaOrcOco_Usuario: TIntegerField;
    CDSImpressaoOcorrenciaUsu_Codigo: TIntegerField;
    CDSImpressaoOcorrenciaUsu_Nome: TWideStringField;
    CDSImpressaoQOrcamentoOcorrenciaImp: TDataSetField;
    CDSImpressaoVenctos: TClientDataSet;
    CDSImpressaoVenctosOrcVect_Data: TDateField;
    CDSImpressaoVenctosOrcVect_Descricao: TStringField;
    CDSImpressaoVenctosOrcVect_Id: TAutoIncField;
    CDSImpressaoVenctosOrcVect_Orcamento: TIntegerField;
    CDSImpressaoVenctosOrcVect_Parcela: TIntegerField;
    CDSImpressaoVenctosOrcVect_Valor: TCurrencyField;
    dsImpressaoVenctos: TDataSource;
    dbImpressaoVenctos: TppDBPipeline;
    CDSImpressaoTotalItem: TCurrencyField;
    CDSImpressaoQOrcamentoVenctImp: TDataSetField;
    CDSImpressaoModulo: TClientDataSet;
    dsImpressaoModulo: TDataSource;
    dbImpressaoModulo: TppDBPipeline;
    DesImpressao: TppDesigner;
    CDSCadastroOrc_RazaoSocial: TStringField;
    CDSCadastroOrc_Fantasia: TStringField;
    CDSCadastroOrc_Endereco: TStringField;
    CDSCadastroOrc_Telefone: TStringField;
    CDSCadastroOrc_Contato: TStringField;
    CDSCadastroOrc_Dcto: TStringField;
    CDSEmail: TClientDataSet;
    CDSEmailId: TIntegerField;
    CDSEmailIdOrcamento: TIntegerField;
    CDSEmailEmail: TStringField;
    CDSImpressaoOrc_RazaoSocial: TStringField;
    CDSImpressaoOrc_Fantasia: TStringField;
    CDSImpressaoOrc_Contato: TStringField;
    CDSImpressaoOrc_Dcto: TStringField;
    CDSImpressaoOrc_Endereco: TStringField;
    CDSImpressaoOrc_Telefone: TStringField;
    CDSImpressaoQOrcamentoItemModuloImp: TDataSetField;
    CDSConsultaOrc_RazaoSocial: TStringField;
    CDSConsultaCli_Codigo: TIntegerField;
    CDSImpressaoTotalMensal: TFloatField;
    RepOrcamento: TppReport;
    ppParameterList2: TppParameterList;
    CDSImpressaoCidade_Data: TStringField;
    CDSImpressaoValorExtenso: TStringField;
    CDSImpressaoTotalOrcamento: TAggregateField;
    CDSImpressaoNumero_Ano: TStringField;
    CDSCadastroOrc_Tipo: TIntegerField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    cdsRelatorios: TClientDataSet;
    cdsRelatoriosData: TDateField;
    cdsRelatoriosRazaoSocial: TStringField;
    cdsRelatoriosSituacao: TStringField;
    cdsRelatoriosTipCodigo: TIntegerField;
    cdsRelatoriosTipNome: TStringField;
    cdsRelatoriosUsuCodigo: TIntegerField;
    cdsRelatoriosUsuNome: TStringField;
    cdsRelatoriosValorTotal: TCurrencyField;
    cdsRelatoriosValorMensal: TCurrencyField;
    dsRelatorios: TDataSource;
    dbRelatorios: TppDBPipeline;
    Relatorio1: TppReport;
    ppParameterList3: TppParameterList;
    ppDesignLayers9: TppDesignLayers;
    ppDesignLayer9: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand9: TppDetailBand;
    ppLabel55: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand9: TppSummaryBand;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLine17: TppLine;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppLabel73: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel74: TppLabel;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppLine18: TppLine;
    ppLabel75: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    cdsRelatoriosTotalGeral: TCurrencyField;
    ppLabel76: TppLabel;
    cdsRelatorio01: TClientDataSet;
    cdsRelatorio01Orc_Data: TDateField;
    cdsRelatorio01Orc_RazaoSocial: TStringField;
    cdsRelatorio01Situacao: TStringField;
    cdsRelatorio01Tip_Codigo: TIntegerField;
    cdsRelatorio01Tip_Nome: TWideStringField;
    cdsRelatorio01Usu_Codigo: TIntegerField;
    cdsRelatorio01Usu_Nome: TWideStringField;
    cdsRelatorio01Total_Orc: TCurrencyField;
    cdsRelatorio01Total_Mensal: TCurrencyField;
    cdsRelatorio01TotalGeral: TFloatField;
    cdsGraficoTipo: TClientDataSet;
    cdsGraficoTipoTip_Codigo: TIntegerField;
    cdsGraficoTipoTip_Nome: TWideStringField;
    cdsGraficoTipoQtde: TIntegerField;
    Relatorio2: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel79: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable7: TppSystemVariable;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLine19: TppLine;
    DetalheUsuario: TppDetailBand;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppUsuarioSituacao: TppDBText;
    ppSummaryBand11: TppSummaryBand;
    ppLabel86: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLabel87: TppLabel;
    ppGroup4: TppGroup;
    HeaderUsuario: TppGroupHeaderBand;
    ppLabel90: TppLabel;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    FooterUsuario: TppGroupFooterBand;
    ppLine20: TppLine;
    ppLabel91: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDesignLayers10: TppDesignLayers;
    ppDesignLayer10: TppDesignLayer;
    ppParameterList4: TppParameterList;
    cdsGraficoSituacao: TClientDataSet;
    cdsGraficoSituacaoSituacao: TStringField;
    cdsGraficoSituacaoQtde: TIntegerField;
    CDSConsultaOrc_EmailEnviado: TBooleanField;
    CDSCadastroOrc_SubTipo: TIntegerField;
    CDSCadastroOrc_EmailEnviado: TBooleanField;
    CDSCadastroOrc_DataSituacao: TDateField;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppDBText56: TppDBText;
    cdsRelatoriosDataSituacao: TDateField;
    cdsRelatorio01Orc_DataSituacao: TDateField;
    ppDBText57: TppDBText;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    tcGraficoTipo: TppTeeChart;
    tcGraficoUsuario: TppTeeChart;
    cdsGraficoUsuarioQtde: TClientDataSet;
    cdsGraficoUsuarioQtdeUsu_Codigo: TIntegerField;
    cdsGraficoUsuarioQtdeUsu_Nome: TWideStringField;
    cdsGraficoUsuarioQtdeQtde: TIntegerField;
    tcGraficoUsuarioQtde: TppTeeChart;
    CDSImpressaoNumeroRegistro: TIntegerField;
    tcGraficoUsuarioSituacao: TppTeeChart;
    cdsRelatorio03: TClientDataSet;
    cdsRelatorio03Orc_Id: TAutoIncField;
    cdsRelatorio03Orc_Data: TDateField;
    cdsRelatorio03Orc_Situacao: TIntegerField;
    cdsRelatorio03Orc_RazaoSocial: TStringField;
    cdsRelatorio03Usu_Codigo: TIntegerField;
    cdsRelatorio03Usu_Nome: TWideStringField;
    cdsRelatorio03Tip_Codigo: TIntegerField;
    cdsRelatorio03Tip_Nome: TWideStringField;
    cdsRelatorio03OrcNAp_Descricao: TStringField;
    cdsRelatorio03Total_Orc: TCurrencyField;
    cdsRelatorio03Total_Mensal: TCurrencyField;
    dsRelatorio3: TDataSource;
    dbRelatorio03: TppDBPipeline;
    Relatorio3: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel106: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLine23: TppLine;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText71: TppDBText;
    ppSummaryBand14: TppSummaryBand;
    ppLabel116: TppLabel;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppLabel117: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLabel120: TppLabel;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine24: TppLine;
    ppLabel121: TppLabel;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDesignLayers12: TppDesignLayers;
    ppDesignLayer12: TppDesignLayer;
    ppParameterList5: TppParameterList;
    ppDBRichText9: TppDBRichText;
    cdsRelatorio03TotalGeral: TFloatField;
    cdsRelatorio03Orc_DataSituacao: TDateField;
    cdsGraficoNaoAprovado: TClientDataSet;
    cdsGraficoNaoAprovadoTip_Codigo: TIntegerField;
    cdsGraficoNaoAprovadoTip_Nome: TWideStringField;
    cdsGraficoNaoAprovadoQtde: TIntegerField;
    tcGraficoNAprovado: TppTeeChart;
    CDSCadastroOrc_Logradouro: TStringField;
    CDSCadastroOrc_Bairro: TStringField;
    CDSCadastroOrc_CEP: TStringField;
    CDSCadastroOrc_Cidade: TIntegerField;
    CDSCadastroOrc_Fone1: TStringField;
    CDSCadastroOrc_Fone2: TStringField;
    CDSCadastroOrc_Celular: TStringField;
    CDSCadastroOrc_FoneOutro: TStringField;
    CDSCadastroOrc_ContatoFinanceiro: TStringField;
    CDSCadastroOrc_ContatoFinanceiroFone: TStringField;
    CDSCadastroOrc_ContatoCompraVenda: TStringField;
    CDSCadastroOrc_ContatoCompraVendaFone: TStringField;
    CDSCadastroOrc_IE: TStringField;
    CDSCadastroOrc_RepreLegal: TStringField;
    CDSCadastroCid_Codigo: TIntegerField;
    CDSCadastroCid_Nome: TStringField;
    CDSCadastroCid_UF: TStringField;
    CDSCadastroOrc_RepreLegalCPF: TStringField;
    CDSImpressaoOrc_Fone1: TStringField;
    CDSImpressaoOrc_Fone2: TStringField;
    CDSImpressaoOrc_Celular: TStringField;
    CDSImpressaoOrc_FoneOutro: TStringField;
    CDSImpressaoOrc_ContatoFinanceiro: TStringField;
    CDSImpressaoOrc_ContatoFinanceiroFone: TStringField;
    CDSImpressaoOrc_ContatoCompraVenda: TStringField;
    CDSImpressaoOrc_ContatoCompraVendaFone: TStringField;
    CDSImpressaoOrc_IE: TStringField;
    CDSImpressaoOrc_RepreLegal: TStringField;
    CDSImpressaoOrc_RepreLegalCPF: TStringField;
    CDSImpressaoCid_Codigo: TIntegerField;
    CDSImpressaoCid_Nome: TStringField;
    CDSImpressaoCid_UF: TStringField;
    CDSImpressaoOrc_Logradouro: TStringField;
    CDSImpressaoOrc_Bairro: TStringField;
    CDSImpressaoOrc_CEP: TStringField;
    CDSImpressaoC_Endereco: TStringField;
    CDSImpressaoC_Telefone: TStringField;
    CDSCadastroOrc_Enquadramento: TStringField;
    CDSContato: TClientDataSet;
    CDSContatoCont_Id: TIntegerField;
    CDSContatoCont_Cliente: TIntegerField;
    CDSContatoCont_Orcamento: TIntegerField;
    CDSContatoCont_Nome: TStringField;
    CDSContatoCont_Fone1: TStringField;
    CDSContatoCont_Fone2: TStringField;
    CDSContatoCont_Depto: TStringField;
    CDSContatoCont_Email: TStringField;
    ppTitleBand3: TppTitleBand;
    plbl32: TppLabel;
    ppImage2: TppImage;
    ppDBText2: TppDBText;
    plbl33: TppLabel;
    ppDBText3: TppDBText;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    plbl34: TppLabel;
    ppDBText22: TppDBText;
    plbl36: TppLabel;
    ppDBText23: TppDBText;
    plbl37: TppLabel;
    ppDBText24: TppDBText;
    plbl38: TppLabel;
    ppSubReport5: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppRichText4: TppRichText;
    ppImage1: TppImage;
    ppSubReport6: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppImage9: TppImage;
    ppRichText5: TppRichText;
    plbl39: TppLabel;
    ppRichText6: TppRichText;
    ppSubReport7: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    plbl40: TppLabel;
    plbl41: TppLabel;
    plbl42: TppLabel;
    plbl43: TppLabel;
    plbl44: TppLabel;
    plbl45: TppLabel;
    ppImage10: TppImage;
    ppSubReport8: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand9: TppTitleBand;
    ppDetailBand10: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    plbl46: TppLabel;
    ppImage11: TppImage;
    ppSubReport9: TppSubReport;
    ppChildReport14: TppChildReport;
    ppTitleBand11: TppTitleBand;
    ppLine4: TppLine;
    ppShape2: TppShape;
    plbl47: TppLabel;
    plbl48: TppLabel;
    plbl49: TppLabel;
    plbl50: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    DetalhadoRegValorMensal: TppRegion;
    plbl51: TppLabel;
    plbl52: TppLabel;
    plbl53: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBRichText2: TppDBRichText;
    ppDBText33: TppDBText;
    ppSummaryBand12: TppSummaryBand;
    plbl54: TppLabel;
    ppLine7: TppLine;
    plbl55: TppLabel;
    plbl56: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBMemo2: TppDBMemo;
    ppSubReport11: TppSubReport;
    ppChildReport15: TppChildReport;
    ppDetailBand16: TppDetailBand;
    ppSummaryBand13: TppSummaryBand;
    ppSubReport12: TppSubReport;
    ppChildReport18: TppChildReport;
    ppDetailBand19: TppDetailBand;
    ppSummaryBand16: TppSummaryBand;
    plbl57: TppLabel;
    ppSubReport13: TppSubReport;
    ppChildReport19: TppChildReport;
    ppTitleBand15: TppTitleBand;
    plbl58: TppLabel;
    plbl59: TppLabel;
    plbl60: TppLabel;
    plbl61: TppLabel;
    ppLine10: TppLine;
    ppDetailBand20: TppDetailBand;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppSummaryBand17: TppSummaryBand;
    ppLine11: TppLine;
    plbl62: TppLabel;
    ppLine12: TppLine;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppDBRichText6: TppDBRichText;
    ppRegion3: TppRegion;
    plbl63: TppLabel;
    ppLine13: TppLine;
    ppImage12: TppImage;
    ppSubReport20: TppSubReport;
    ppChildReport20: TppChildReport;
    ppDetailBand21: TppDetailBand;
    ppSumaryPagina7: TppSummaryBand;
    ppImage14: TppImage;
    plbl64: TppLabel;
    plbl65: TppLabel;
    ppLine14: TppLine;
    plbl66: TppLabel;
    plbl67: TppLabel;
    ppSubReport21: TppSubReport;
    ppChildReport21: TppChildReport;
    ppDetailBand22: TppDetailBand;
    ppDBText53: TppDBText;
    ppDBText59: TppDBText;
    ppDBRichText7: TppDBRichText;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppDesignLayers7: TppDesignLayers;
    ppDesignLayer7: TppDesignLayer;
    ppDesignLayers8: TppDesignLayers;
    ppDesignLayer8: TppDesignLayer;
    ppDesignLayers11: TppDesignLayers;
    ppDesignLayer11: TppDesignLayer;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport24: TppSubReport;
    ppChildReport22: TppChildReport;
    ppTitleBand16: TppTitleBand;
    plbl68: TppLabel;
    ppDetailBand23: TppDetailBand;
    ppDBText61: TppDBText;
    ppDBRichText8: TppDBRichText;
    ppSummaryBand22: TppSummaryBand;
    ppDesignLayers17: TppDesignLayers;
    ppDesignLayer17: TppDesignLayer;
    ppDesignLayers18: TppDesignLayers;
    ppDesignLayer18: TppDesignLayer;
    ppLine16: TppLine;
    ppDesignLayers19: TppDesignLayers;
    ppDesignLayer19: TppDesignLayer;
    ppDesignLayers20: TppDesignLayers;
    ppDesignLayer20: TppDesignLayer;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDesignLayers21: TppDesignLayers;
    ppDesignLayer21: TppDesignLayer;
    ppDesignLayers22: TppDesignLayers;
    ppDesignLayer22: TppDesignLayer;
    ppDBMemo3: TppDBMemo;
    plbl70: TppLabel;
    ppImage3: TppImage;
    ppLine22: TppLine;
    ppDBText60: TppDBText;
    plbl71: TppLabel;
    ppDBText64: TppDBText;
    plbl75: TppLabel;
    ppDBText74: TppDBText;
    plbl76: TppLabel;
    plblOrcamento02: TppLabel;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    ppDesignLayers23: TppDesignLayers;
    ppDesignLayer23: TppDesignLayer;
    ppDetailBand24: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine21: TppLine;
    plbl72: TppLabel;
    plbl73: TppLabel;
    plbl74: TppLabel;
    ppDesignLayers24: TppDesignLayers;
    ppDesignLayer24: TppDesignLayer;
    RelImpressaoSimples: TppReport;
    ppParameterList6: TppParameterList;
    ppTitleBand17: TppTitleBand;
    ppSystemVariable2: TppSystemVariable;
    ppImage17: TppImage;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppDBText80: TppDBText;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl4: TppLabel;
    plbl5: TppLabel;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppShape6: TppShape;
    plbl6: TppLabel;
    plbl7: TppLabel;
    plbl8: TppLabel;
    plbl9: TppLabel;
    plbl10: TppLabel;
    mmOrcamento1: TppMemo;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand29: TppDetailBand;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    RegMensalidadeSimples: TppRegion;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    plbl11: TppLabel;
    plbl12: TppLabel;
    plbl13: TppLabel;
    ppDBText90: TppDBText;
    ppDBRichText10: TppDBRichText;
    ppDBText91: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine27: TppLine;
    plbl14: TppLabel;
    plbl15: TppLabel;
    plbl16: TppLabel;
    ppSummaryBand25: TppSummaryBand;
    ppLine28: TppLine;
    plbl17: TppLabel;
    plbl18: TppLabel;
    plbl19: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppSubReport25: TppSubReport;
    ppChildReport25: TppChildReport;
    ppTitleBand18: TppTitleBand;
    plbl20: TppLabel;
    ppLine29: TppLine;
    plbl21: TppLabel;
    plbl22: TppLabel;
    plbl23: TppLabel;
    ppDetailBand30: TppDetailBand;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppSummaryBand26: TppSummaryBand;
    ppLine30: TppLine;
    plbl24: TppLabel;
    ppSubReport26: TppSubReport;
    ppChildReport26: TppChildReport;
    ppTitleBand19: TppTitleBand;
    ppLine31: TppLine;
    plbl25: TppLabel;
    plbl26: TppLabel;
    plbl27: TppLabel;
    plbl28: TppLabel;
    ppLine32: TppLine;
    ppDetailBand31: TppDetailBand;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBRichText11: TppDBRichText;
    ppSummaryBand27: TppSummaryBand;
    ppDesignLayers30: TppDesignLayers;
    ppDesignLayer30: TppDesignLayer;
    ppDBRichText12: TppDBRichText;
    ppDesignLayers31: TppDesignLayers;
    ppDesignLayer31: TppDesignLayer;
    ppDBCalc16: TppDBCalc;
    ppRegion4: TppRegion;
    plbl29: TppLabel;
    ppLine33: TppLine;
    plbl30: TppLabel;
    ppLine34: TppLine;
    ppGroup6: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppSubReport27: TppSubReport;
    ppChildReport27: TppChildReport;
    ppTitleBand20: TppTitleBand;
    plbl31: TppLabel;
    ppDetailBand32: TppDetailBand;
    ppDBText97: TppDBText;
    ppDBRichText13: TppDBRichText;
    ppSummaryBand28: TppSummaryBand;
    ppDesignLayers32: TppDesignLayers;
    ppDesignLayer32: TppDesignLayer;
    ppDesignLayers33: TppDesignLayers;
    ppDesignLayer33: TppDesignLayer;
    CDSImpressaoC_Email: TStringField;
    ppTitleBand1: TppTitleBand;
    ppLabel2: TppLabel;
    ppImage4: TppImage;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppRichText1: TppRichText;
    ppImage5: TppImage;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppImage6: TppImage;
    ppRichText2: TppRichText;
    ppLabel8: TppLabel;
    ppRichText3: TppRichText;
    ppSubReport10: TppSubReport;
    ppChildReport9: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppImage7: TppImage;
    ppSubReport14: TppSubReport;
    ppChildReport10: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppDetailBand13: TppDetailBand;
    ppSummaryBand15: TppSummaryBand;
    ppLabel15: TppLabel;
    ppImage8: TppImage;
    ppSubReport15: TppSubReport;
    ppChildReport11: TppChildReport;
    ppTitleBand12: TppTitleBand;
    ppLine1: TppLine;
    ppShape1: TppShape;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppRegion1: TppRegion;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBRichText1: TppDBRichText;
    ppDBText17: TppDBText;
    ppSummaryBand18: TppSummaryBand;
    ppLabel23: TppLabel;
    ppLine2: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppSubReport16: TppSubReport;
    ppChildReport12: TppChildReport;
    ppDetailBand15: TppDetailBand;
    ppSummaryBand19: TppSummaryBand;
    ppSubReport17: TppSubReport;
    ppChildReport13: TppChildReport;
    ppDetailBand17: TppDetailBand;
    ppSummaryBand20: TppSummaryBand;
    ppLabel26: TppLabel;
    ppSubReport18: TppSubReport;
    ppChildReport16: TppChildReport;
    ppTitleBand13: TppTitleBand;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine3: TppLine;
    ppDetailBand18: TppDetailBand;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppSummaryBand21: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel31: TppLabel;
    ppLine6: TppLine;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDBRichText3: TppDBRichText;
    ppRegion2: TppRegion;
    ppLabel32: TppLabel;
    ppLine8: TppLine;
    ppImage13: TppImage;
    ppSubReport19: TppSubReport;
    ppChildReport17: TppChildReport;
    ppDetailBand25: TppDetailBand;
    ppSummaryBand23: TppSummaryBand;
    ppImage15: TppImage;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLine9: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppSubReport22: TppSubReport;
    ppChildReport23: TppChildReport;
    ppDetailBand26: TppDetailBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBRichText4: TppDBRichText;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppDesignLayers13: TppDesignLayers;
    ppDesignLayer13: TppDesignLayer;
    mmExtenso: TppMemo;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSubReport23: TppSubReport;
    ppChildReport24: TppChildReport;
    ppTitleBand14: TppTitleBand;
    ppLabel37: TppLabel;
    ppDetailBand27: TppDetailBand;
    ppDBText58: TppDBText;
    ppDBRichText5: TppDBRichText;
    ppSummaryBand24: TppSummaryBand;
    ppDesignLayers14: TppDesignLayers;
    ppDesignLayer14: TppDesignLayer;
    ppDesignLayers15: TppDesignLayers;
    ppDesignLayer15: TppDesignLayer;
    ppLine15: TppLine;
    ppDesignLayers16: TppDesignLayers;
    ppDesignLayer16: TppDesignLayer;
    ppDesignLayers25: TppDesignLayers;
    ppDesignLayer25: TppDesignLayer;
    ppDBText70: TppDBText;
    ppDBText75: TppDBText;
    ppDesignLayers26: TppDesignLayers;
    ppDesignLayer26: TppDesignLayer;
    ppDesignLayers27: TppDesignLayers;
    ppDesignLayer27: TppDesignLayer;
    ppDBMemo4: TppDBMemo;
    ppLabel38: TppLabel;
    ppImage16: TppImage;
    ppLine25: TppLine;
    ppDBText76: TppDBText;
    ppLabel39: TppLabel;
    ppDBText77: TppDBText;
    ppLabel40: TppLabel;
    ppDBText78: TppDBText;
    ppLabel41: TppLabel;
    plblOrcamento01: TppLabel;
    ppLabel43: TppLabel;
    ppDBText79: TppDBText;
    ppDesignLayers28: TppDesignLayers;
    ppDesignLayer28: TppDesignLayer;
    ppDetailBand28: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine26: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDesignLayers29: TppDesignLayers;
    ppDesignLayer29: TppDesignLayer;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroOrc_DataSetText(Sender: TField; const Text: string);
    procedure CDSItensBeforePost(DataSet: TDataSet);
    procedure CDSItensModuloBeforePost(DataSet: TDataSet);
    procedure CDSOcorrenciaOrcOco_DataSetText(Sender: TField;
      const Text: string);
    procedure CDSOcorrenciaBeforePost(DataSet: TDataSet);
    procedure CDSOcorrenciaNewRecord(DataSet: TDataSet);
    procedure CDSVenctosOrcVect_DataSetText(Sender: TField; const Text: string);
    procedure CDSVenctosBeforePost(DataSet: TDataSet);
    procedure CDSVenctosNewRecord(DataSet: TDataSet);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroCalcFields(DataSet: TDataSet);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CDSImpressaoCalcFields(DataSet: TDataSet);
    procedure CDSEmailNewRecord(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure CDSImpressaoOcorrenciaAfterOpen(DataSet: TDataSet);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand15BeforePrint(Sender: TObject);
    procedure cdsRelatorio01CalcFields(DataSet: TDataSet);
    procedure CDSConsultaOrc_EmailEnviadoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure CDSImpressaoBeforeOpen(DataSet: TDataSet);
    procedure HeaderUsuarioBeforePrint(Sender: TObject);
    procedure DetalheUsuarioBeforePrint(Sender: TObject);
    procedure FooterUsuarioBeforePrint(Sender: TObject);
    procedure cdsRelatorio03CalcFields(DataSet: TDataSet);
    procedure CDSContatoBeforePost(DataSet: TDataSet);
    procedure ppSummaryBand18BeforePrint(Sender: TObject);
  private
    { Private declarations }
    FIdItem: Integer;
    FIdItemModulo: Integer;
    FIdOcorrencia: Integer;
    FIdVencto: Integer;
    FExtenso: TExtensoValor;
    FNumeroItem: Integer;
    FIdContato: Integer;
    FListaSituacao: TList<string>;
    FTotalItem: Currency;
    FEmail: string;
  public
    { Public declarations }
    procedure GerarPDF(ANomeArquivo, ATipoRel: string);
    procedure ImpressaoTela(ATipoRel: string);

    function RetornarSituacao(Codigo: Integer): string;
    procedure Relatorio01();
    procedure Relatorio02();
    procedure Relatorio03();
    function RetornarCor(AIndice: Integer): TColor;
    procedure ImpressaoEmail(AEmail: string);
    procedure ImpressaoRelatorioSimplificado(AEmail: string);

    property TotalItem: Currency read FTotalItem write FTotalItem;
    property Extenso: TExtensoValor read FExtenso write FExtenso;
    property Email: string read FEmail write FEmail;
  end;

var
  DMOrcamento: TDMOrcamento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper;

{$R *.dfm}

procedure TDMOrcamento.CDSCadastroCalcFields(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroCSituacao.AsString := RetornarSituacao(CDSCadastroOrc_Situacao.AsInteger);
end;

procedure TDMOrcamento.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroOrc_Situacao.AsInteger := 1;
end;

procedure TDMOrcamento.CDSCadastroOrc_DataSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMOrcamento.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
    CDSConsultaCSituacao.AsString := RetornarSituacao(CDSConsultaOrc_Situacao.AsInteger);
end;

procedure TDMOrcamento.CDSConsultaOrc_EmailEnviadoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if Sender.Value = True then
    Text := 'Sim'
  else
    Text := 'N�o';
end;

procedure TDMOrcamento.CDSContatoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not TFuncoes.ValidaEMail(CDSContatoCont_Email.AsString) then
    raise Exception.Create('Email Inv�lido!');

  if CDSContato.State = dsInsert then
  begin
    CDSContatoCont_Id.AsInteger := FIdContato;
    Dec(FIdContato);
  end;
end;

procedure TDMOrcamento.CDSEmailNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSEmailId.AsInteger := 0;
end;

procedure TDMOrcamento.CDSImpressaoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  FNumeroItem := 1;
end;

procedure TDMOrcamento.CDSImpressaoCalcFields(DataSet: TDataSet);
var
  cValor: Currency;
  sNumero: string;
  sAno: string;
  sNumeroAno: string;
  sEndereco: string;
  sTelefones: string;
  sContato: string;
begin
  inherited;
  CDSImpressaoSituacaoDescricao.Text := RetornarSituacao(CDSImpressaoOrc_Situacao.AsInteger);


  if CDSImpressao.State = dsInternalCalc then
  begin
    CDSImpressaoTotalMensal.AsFloat := CDSImpressaoOrcIte_ValorLicencaMensal.AsFloat -
                                       CDSImpressaoOrcIte_ValorDescMensal.AsFloat;

    CDSImpressaoCidade_Data.AsString := 'Vacaria, ' + FormatDateTime('dd " de "mmmm " de " yyyy', CDSImpressaoOrc_Data.AsDateTime);

    try
      cValor := CDSImpressaoTotalOrcamento.AsCurrency; // CDSImpressaoTotalItem.AsCurrency;
      cValor := FTotalItem;// CDSImpressaoTotalOrcamento.AsCurrency; // CDSImpressaoTotalItem.AsCurrency;
    except
      cValor := 0;
    end;

    if cValor > 0 then
      CDSImpressaoValorExtenso.AsString := FExtenso.ValorExtenso(cValor);

    CDSImpressaoNumeroRegistro.AsInteger := FNumeroItem;
    Inc(FNumeroItem);

    sContato := CDSImpressaoOrc_ContatoCompraVenda.AsString;
    if sContato <> '' then
      sContato := sContato + ' - ' + CDSImpressaoOrc_ContatoCompraVendaFone.AsString;

    sEndereco := CDSImpressaoOrc_Logradouro.AsString + ', ' +
                 CDSImpressaoOrc_Bairro.AsString + #10 +
                 CDSImpressaoCid_Nome.AsString + ' - ' +  CDSImpressaoCid_UF.AsString  + #10 +
                 CDSImpressaoOrc_CEP.AsString + #10 +
                 sContato;
//    sTelefones := CDSImpressaoOrc_Fone1.AsString + ' - ' + CDSImpressaoOrc_Fone2.AsString + ' - ' + CDSImpressaoOrc_Celular.AsString + ' - ' + CDSImpressaoOrc_FoneOutro.AsString;
    sTelefones := CDSImpressaoOrc_Fone1.AsString;

    CDSImpressaoC_Endereco.AsString := sEndereco;
    CDSImpressaoC_Telefone.AsString := sTelefones;

    CDSImpressaoC_Email.AsString := 'IRNAI';

  end;

  sNumero := FormatFloat('000000', CDSImpressaoOrc_Numero.AsFloat);
  sAno := FormatDateTime('yyyy', CDSImpressaoOrc_Data.AsDateTime);

  sNumeroAno := sNumero + '/' + sAno;
  CDSImpressaoNumero_Ano.AsString := sNumeroAno;


end;

procedure TDMOrcamento.CDSImpressaoOcorrenciaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ppSumaryPagina7.Visible := not (CDSImpressaoOcorrencia.IsEmpty);
end;

procedure TDMOrcamento.CDSItensBeforePost(DataSet: TDataSet);
begin
  inherited;
//  if CDSItensOrcIte_Produto.AsInteger = 0 then
//    raise Exception.Create('Informe o Produto!');

  if CDSItensOrcIte_ValorLicencaImpl.AsCurrency < 0 then
    raise Exception.Create('Valor Licen�a Impl. Negativo!');

  if CDSItensOrcIte_ValorDescImpl.AsCurrency < 0 then
    raise Exception.Create('Valor Desc. Impl. Negativo!');

  if CDSItensOrcIte_ValorLicencaMensal.AsCurrency < 0 then
    raise Exception.Create('Valor Licen�a Mensal Negativo!');

  if CDSItensOrcIte_ValorDescMensal.AsCurrency < 0 then
    raise Exception.Create('Valor Desc. Mensal Negativo!');

  if CDSItens.State = dsInsert then
  begin
    Dec(FIdItem);
    CDSItensOrcIte_Id.AsInteger := FIdItem;
    CDSItensOrcIte_Orcamento.AsInteger := -1;
  end;

end;

procedure TDMOrcamento.CDSItensModuloBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSItensModulo.State = dsInsert then
  begin
    Dec(FIdItemModulo);
    CDSItensModuloOrcIteMod_Id.AsInteger := FIdItemModulo;
    CDSItensModuloOrcIteMod_OrcamentoItem.AsInteger := CDSItensOrcIte_Id.AsInteger;
  end;
end;

procedure TDMOrcamento.CDSOcorrenciaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if cdsOcorrencia.State = dsInsert then
  begin
    Dec(FIdOcorrencia);
    cdsOcorrenciaOrcOco_Id.AsInteger := FIdOcorrencia;
  end;
end;

procedure TDMOrcamento.CDSOcorrenciaNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSOcorrenciaOrcOco_Data.AsDateTime := Date;
end;

procedure TDMOrcamento.CDSOcorrenciaOrcOco_DataSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMOrcamento.cdsRelatorio01CalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsRelatorio01TotalGeral.AsCurrency := cdsRelatorio01Total_Orc.AsCurrency +
                                         cdsRelatorio01Total_Mensal.AsCurrency;
end;

procedure TDMOrcamento.cdsRelatorio03CalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsRelatorio03TotalGeral.AsCurrency := cdsRelatorio03Total_Orc.AsCurrency +
                                         cdsRelatorio03Total_Mensal.AsCurrency;
end;

procedure TDMOrcamento.CDSVenctosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSVenctos.State = dsInsert then
  begin
    Dec(FIdVencto);
    CDSVenctosOrcVect_Id.AsInteger := FIdVencto;
    CDSVenctosOrcVect_Orcamento.AsInteger := 0;
  end;
end;

procedure TDMOrcamento.CDSVenctosNewRecord(DataSet: TDataSet);
begin
  inherited;
  try
    CDSVenctosOrcVect_Parcela.AsInteger := StrToIntDef(CDSVenctosParcela.Value, 0) + 1;
  except
    CDSVenctosOrcVect_Parcela.AsInteger := 1;
  end;
end;

procedure TDMOrcamento.CDSVenctosOrcVect_DataSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMOrcamento.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao2;
  end;
  FIdItem := 0;
  FIdItemModulo := 0;
  FIdOcorrencia := 0;
  FIdVencto := 0;
  FIdContato := -1;

  CDSEmail.CreateDataSet;
  cdsRelatorios.CreateDataSet;

  FExtenso := TExtensoValor.Create;
  CDSContato.CreateDataSet;

end;

procedure TDMOrcamento.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FExtenso);
end;

procedure TDMOrcamento.DetalheUsuarioBeforePrint(Sender: TObject);
begin
  inherited;
  FListaSituacao.Add(ppUsuarioSituacao.Text);
end;

procedure TDMOrcamento.FooterUsuarioBeforePrint(Sender: TObject);
var
  i: Integer;
  SituacaoOld: string;
  iContador: Integer;
  iCor: Integer;
begin
  inherited;
  tcGraficoUsuarioSituacao.Chart.Series[0].Clear;
  FListaSituacao.Sort;

  iCor := 0;
  for I := 0 to FListaSituacao.Count -1 do
  begin
    if I = 0 then
    begin
      SituacaoOld := FListaSituacao[i];
      iContador := 0;
    end;

    if SituacaoOld = FListaSituacao[i] then
      Inc(iContador)
    else begin
      tcGraficoUsuarioSituacao.Chart.Series[0].Add(iContador, SituacaoOld, RetornarCor(iCor));
      SituacaoOld := FListaSituacao[i];
      iContador := 1;
      Inc(iCor);
    end;

    SituacaoOld := FListaSituacao[i];
  end;

  tcGraficoUsuarioSituacao.Chart.Series[0].Add(iContador, SituacaoOld, RetornarCor(iCor));

  FreeAndNil(FListaSituacao);
end;

procedure TDMOrcamento.GerarPDF(ANomeArquivo, ATipoRel: string);
begin
  if ATipoRel = 'DETA' then
  begin
    RelImpressao.ShowPrintDialog := False;
    RelImpressao.AllowPrintToFile := True;
    RelImpressao.TextFileName := ANomeArquivo;
    RelImpressao.DeviceType := 'PDF';
  end
  else begin
    RelImpressaoSimples.ShowPrintDialog := False;
    RelImpressaoSimples.AllowPrintToFile := True;
    RelImpressaoSimples.TextFileName := ANomeArquivo;
    RelImpressaoSimples.DeviceType := 'PDF';
  end;

  RepOrcamento.ShowPrintDialog := False;
  RepOrcamento.AllowPrintToFile := True;
  RepOrcamento.TextFileName := ANomeArquivo;
  RepOrcamento.DeviceType := 'PDF';
end;

procedure TDMOrcamento.HeaderUsuarioBeforePrint(Sender: TObject);
begin
  inherited;
  FListaSituacao := TList<string>.Create;
end;

procedure TDMOrcamento.ImpressaoEmail(AEmail: string);
begin
  try
//    plblOrcamento01.Caption := AEmail;
  except
    // nada
  end;

  try
    plblOrcamento02.Caption := AEmail;
  except
    // nada
  end;

end;

procedure TDMOrcamento.ImpressaoRelatorioSimplificado(AEmail: string);
var
  sFones: string;
  sIE: string;
begin
  sFones := '';

  if Trim(CDSImpressaoOrc_Fone1.AsString) <> '' then
    sFones := CDSImpressaoOrc_Fone1.AsString;

  if Trim(CDSImpressaoOrc_Fone2.AsString) <> '' then
    sFones := sFones + ' - ' + CDSImpressaoOrc_Fone2.AsString;

  if Trim(CDSImpressaoOrc_Celular.AsString) <> '' then
    sFones := sFones + ' - ' + CDSImpressaoOrc_Celular.AsString;

  if Trim(CDSImpressaoOrc_FoneOutro.AsString) <> '' then
    sFones := sFones + ' - ' + CDSImpressaoOrc_FoneOutro.AsString;

  sIE := '';
  if CDSImpressaoOrc_IE.AsString <> '' then
    sIE := ' - Insc. Estatual: ' + CDSImpressaoOrc_IE.AsString;

  if CDSImpressaoOrc_Fantasia.AsString <> '' then
    mmOrcamento1.Lines.Add(CDSImpressaoOrc_Fantasia.AsString);

  if CDSImpressaoOrc_Logradouro.AsString <> '' then
    mmOrcamento1.Lines.Add(CDSImpressaoOrc_Logradouro.AsString);

  if CDSImpressaoOrc_Bairro.AsString <> '' then
    mmOrcamento1.Lines.Add(CDSImpressaoOrc_Bairro.AsString);

  if CDSImpressaoCid_Nome.AsString <> '' then
    mmOrcamento1.Lines.Add(CDSImpressaoCid_Nome.AsString + ' - ' + CDSImpressaoCid_UF.AsString);

  if CDSImpressaoOrc_CEP.AsString <> '' then
    mmOrcamento1.Lines.Add(CDSImpressaoOrc_CEP.AsString);

  if CDSImpressaoOrc_Dcto.AsString <> '' then
    mmOrcamento1.Lines.Add('CPNJ/CPF: ' + CDSImpressaoOrc_Dcto.AsString + sIE);



//  if CDSImpressaoOrc_ContatoFinanceiro.AsString <> '' then
//    mmOrcamento1.Lines.Add(CDSImpressaoOrc_ContatoFinanceiro.AsString + ' - ' + CDSImpressaoOrc_ContatoFinanceiroFone.AsString);

  if CDSImpressaoOrc_ContatoCompraVenda.AsString <> '' then
    mmOrcamento1.Lines.Add(CDSImpressaoOrc_ContatoCompraVenda.AsString + ' ' + CDSImpressaoOrc_ContatoCompraVendaFone.AsString);
//    mmOrcamento1.Lines.Add(CDSImpressaoOrc_ContatoCompraVenda.AsString + ' - ' + CDSImpressaoOrc_ContatoCompraVendaFone.AsString);

  if sFones <> '' then
    mmOrcamento1.Lines.Add(sFones);

//  if CDSImpressaoOrc_RepreLegal.AsString <> '' then
//    mmOrcamento1.Lines.Add(CDSImpressaoOrc_RepreLegal.AsString + ' - ' + CDSImpressaoOrc_RepreLegalCPF.AsString);

  mmOrcamento1.Lines.Add(AEmail);
  mmOrcamento1.Lines.Add('Repr. Legal: ' + CDSImpressaoOrc_RepreLegal.AsString);
  mmOrcamento1.Lines.Add('CPF: ' + CDSImpressaoOrc_RepreLegalCPF.AsString);
end;

procedure TDMOrcamento.ImpressaoTela(ATipoRel: string);
begin
  if ATipoRel = 'DETA' then
  begin
    RelImpressao.ShowPrintDialog := True;
    RelImpressao.AllowPrintToArchive := False;
    RelImpressao.TextFileName := '';
    RelImpressao.DeviceType := 'Screen';
  end
  else begin
    RelImpressaoSimples.ShowPrintDialog := True;
    RelImpressaoSimples.AllowPrintToArchive := False;
    RelImpressaoSimples.TextFileName := '';
    RelImpressaoSimples.DeviceType := 'Screen';
  end;

  RepOrcamento.ShowPrintDialog := True;
  RepOrcamento.AllowPrintToArchive := False;
  RepOrcamento.TextFileName := '';
  RepOrcamento.DeviceType := 'Screen';
end;

procedure TDMOrcamento.ppDetailBand15BeforePrint(Sender: TObject);
begin
  inherited;
  DetalhadoRegValorMensal.Visible := (CDSImpressaoOrcIte_ValorLicencaMensal.AsCurrency > 0);
end;

procedure TDMOrcamento.ppDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  RegMensalidadeSimples.Visible := (CDSImpressaoOrcIte_ValorLicencaMensal.AsCurrency > 0);
end;

procedure TDMOrcamento.ppSummaryBand18BeforePrint(Sender: TObject);
begin
  inherited;
  mmExtenso.Text :=  FExtenso.ValorExtenso(ppDBCalc3.Value);
end;

procedure TDMOrcamento.Relatorio01;
var
  i: Integer;
begin
  cdsRelatorio01.IndexFieldNames := 'Tip_Nome; Orc_Data';
  cdsGraficoTipo.IndexFieldNames := 'Qtde';
  cdsGraficoTipo.First;
  tcGraficoTipo.Chart.Series[0].Clear;
  i := 0;
  while not cdsGraficoTipo.Eof do
  begin
    tcGraficoTipo.Chart.Series[0].Add(cdsGraficoTipoQtde.AsInteger, cdsGraficoTipoTip_Nome.AsString, RetornarCor(i));
    Inc(i);
    cdsGraficoTipo.Next;
  end;

  Relatorio1.Print;
end;

procedure TDMOrcamento.Relatorio02;
var
  i: Integer;
begin
  i := 0;
  cdsRelatorio01.IndexFieldNames := 'Usu_Nome; Orc_Data';
  cdsGraficoSituacao.IndexFieldNames := 'Qtde';
  cdsGraficoSituacao.First;
  tcGraficoUsuario.Chart.Series[0].Clear;
  while not cdsGraficoSituacao.Eof do
  begin
    tcGraficoUsuario.Chart.Series[0].Add(cdsGraficoSituacaoQtde.AsInteger, cdsGraficoSituacaoSituacao.AsString, RetornarCor(i));
    Inc(i);
    cdsGraficoSituacao.Next;
  end;

  cdsGraficoUsuarioQtde.First;
  cdsGraficoUsuarioQtde.IndexFieldNames := 'Qtde';
  tcGraficoUsuarioQtde.Chart.Series[0].Clear;
  i := 0;
  while not cdsGraficoUsuarioQtde.Eof do
  begin
    tcGraficoUsuarioQtde.Chart.Series[0].Add(cdsGraficoUsuarioQtdeQtde.AsInteger, cdsGraficoUsuarioQtdeUsu_Nome.AsString, RetornarCor(i));
    Inc(i);
    cdsGraficoUsuarioQtde.Next;
  end;

  Relatorio2.Print;
end;

procedure TDMOrcamento.Relatorio03;
var
  i: Integer;
begin
  cdsRelatorio03.IndexFieldNames := 'Tip_Nome; Orc_Data';
  cdsGraficoNaoAprovado.IndexFieldNames := 'Qtde';
  cdsGraficoNaoAprovado.First;
  tcGraficoNAprovado.Chart.Series[0].Clear;
  i := 0;
  while not cdsGraficoNaoAprovado.Eof do
  begin
    tcGraficoNAprovado.Chart.Series[0].Add(cdsGraficoNaoAprovadoQtde.AsInteger, cdsGraficoNaoAprovadoTip_Nome.AsString, RetornarCor(i));
    Inc(i);
    cdsGraficoNaoAprovado.Next;
  end;

  Relatorio3.Print;
end;

function TDMOrcamento.RetornarCor(AIndice: Integer): TColor;
begin
  case AIndice of
    0: Result := clOlive;
    1: Result := clGreen;
    2: Result := clRed;
    3: Result := clMaroon;
    4: Result := clYellow;
    5: Result := clBlack;
    6: Result := clNavy;
    7: Result := clOlive;
    8: Result := clTeal;
    9: Result := clGray;
  else
    Result := clPurple;
  end;
end;

function TDMOrcamento.RetornarSituacao(Codigo: Integer): string;
begin
  case Codigo of
    1: Result := 'Em An�lise';
    2: Result := 'Aprovado';
    3: Result := 'N�o Aprovado';
    4: Result := 'Faturado';
  end;
end;

end.

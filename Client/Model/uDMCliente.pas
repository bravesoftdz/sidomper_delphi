unit uDMCliente;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, System.Variants, System.MaskUtils,
  ppParameter, ppDesignLayer, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, System.Generics.Collections, uChamadoOcorrenciaVO,
  ppStrtch, ppMemo;

type
  TDMCliente = class(TDMBase)
    CDSConsultaCli_Id: TAutoIncField;
    CDSConsultaCli_Codigo: TIntegerField;
    CDSConsultaCli_Nome: TWideStringField;
    CDSConsultaCli_Dcto: TStringField;
    CDSConsultaCli_Telefone: TStringField;
    CDSCadastroCli_Id: TAutoIncField;
    CDSCadastroCli_Ativo: TBooleanField;
    CDSCadastroCli_Codigo: TIntegerField;
    CDSCadastroCli_Contato: TWideStringField;
    CDSCadastroCli_Dcto: TStringField;
    CDSCadastroCli_Endereco: TWideStringField;
    CDSCadastroCli_Enquadramento: TStringField;
    CDSCadastroCli_Fantasia: TWideStringField;
    CDSCadastroCli_Nome: TWideStringField;
    CDSCadastroCli_Restricao: TBooleanField;
    CDSCadastroCli_Revenda: TIntegerField;
    CDSCadastroCli_Telefone: TStringField;
    CDSCadastroCli_Usuario: TIntegerField;
    CDSCadastroRev_Codigo: TIntegerField;
    CDSCadastroRev_Nome: TWideStringField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroUsu_Nome: TWideStringField;
    Rel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSConsultaCli_Ativo: TBooleanField;
    CDSConsultaCAtivo: TStringField;
    CDSConsultaCli_Fantasia: TWideStringField;
    CDSConsultaRev_Nome: TWideStringField;
    CDSConsultaCli_Enquadramento: TStringField;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine3: TppLine;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSCadastroCli_Versao: TStringField;
    CDSConsultaCli_Versao: TStringField;
    cdsHistorico: TClientDataSet;
    cdsHistoricoTipo: TIntegerField;
    cdsHistoricoMes: TStringField;
    cdsHistoricoTotalHoras: TFloatField;
    cdsHistoricoValor: TCurrencyField;
    cdsHistoricoOpcao: TStringField;
    dbHistorico: TppDBPipeline;
    RelHistorico: TppReport;
    dsHistorico: TDataSource;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel10: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppShape1: TppShape;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText10: TppDBText;
    HistTotalHoras: TppDBText;
    HistValor: TppDBText;
    lblHistTotalHoras: TppLabel;
    cdsHistoricoDescricao: TStringField;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppShape2: TppShape;
    lblCliente: TppLabel;
    ppMemoCliente: TppMemo;
    ppLabel16: TppLabel;
    lblConsultor: TppLabel;
    ppLabel18: TppLabel;
    lblRevenda: TppLabel;
    cdsHistoricoQtde: TFloatField;
    CDSCadastroCli_Logradouro: TStringField;
    CDSCadastroCli_Bairro: TStringField;
    CDSCadastroCli_CEP: TStringField;
    CDSCadastroCli_Cidade: TIntegerField;
    CDSCadastroCid_Codigo: TIntegerField;
    CDSCadastroCid_Nome: TStringField;
    CDSCadastroCid_UF: TStringField;
    CDSCadastroCli_Fone1: TStringField;
    CDSCadastroCli_Fone2: TStringField;
    CDSCadastroCli_Celular: TStringField;
    CDSCadastroCli_FoneOutro: TStringField;
    CDSCadastroCli_ContatoFinanceiro: TStringField;
    CDSCadastroCli_ContatoFinanceiroFone: TStringField;
    CDSCadastroCli_ContatoCompraVenda: TStringField;
    CDSCadastroCli_ContatoCompraVendaFone: TStringField;
    CDSCadastroCli_IE: TStringField;
    CDSCadastroCli_RepreLegal: TStringField;
    CDSCadastroCli_RepreLegalCPF: TStringField;
    CDSConsultaCli_Fone1: TStringField;
    CDSConsultaCli_Fone2: TStringField;
    CDSConsultaCli_Celular: TStringField;
    CDSConsultaCli_FoneOutro: TStringField;
    CDSConsultaC_Telefones: TStringField;
    CDSContato: TClientDataSet;
    CDSContatoCont_Id: TIntegerField;
    CDSContatoCont_Cliente: TIntegerField;
    CDSContatoCont_Orcamento: TIntegerField;
    CDSContatoCont_Nome: TStringField;
    CDSContatoCont_Fone1: TStringField;
    CDSContatoCont_Fone2: TStringField;
    CDSContatoCont_Depto: TStringField;
    CDSContatoCont_Email: TStringField;
    CDSConsultaC_Marcar: TBooleanField;
    CDSCadastroCli_EmpresaVinculada: TIntegerField;
    CDSCadastroCli_Latitude: TStringField;
    CDSCadastroCli_Longitude: TStringField;
    CDSCadastroCli_Perfil: TStringField;
    CDSConsultaCli_Perfil: TStringField;
    procedure CDSConsultaCli_DctoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroCli_DctoSetText(Sender: TField; const Text: string);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CDSCadastroAfterOpen(DataSet: TDataSet);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure CDSContatoBeforePost(DataSet: TDataSet);
  private
    FCodigoDisplayFormat: string;
    FIdContato: Integer;
    function GetCodigoDisplayFormat: string;
    { Private declarations }
  public
    { Public declarations }
    property CodigoDisplayFormat: string read GetCodigoDisplayFormat write FCodigoDisplayFormat;
  end;

var
  DMCliente: TDMCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uClassValidacao, uFuncoesSIDomper, uEnumerador;

{$R *.dfm}

procedure TDMCliente.CDSCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FCodigoDisplayFormat := IntToStr(CDSCadastroCli_Codigo.AsInteger);
end;

procedure TDMCliente.CDSCadastroCli_DctoSetText(Sender: TField;
  const Text: string);
var
  sTexto: string;
begin
  inherited;
  if Text <> '' then
  begin
    sTexto := TFuncoes.SomenteNumeros(Text);

    if Length(sTexto) > 11 then
      TValidacao.ValidaCNPJ(sTexto)
    else
      TValidacao.ValidaCPF(sTexto);
  end;
  Sender.Value := Text;
end;

procedure TDMCliente.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroCli_Ativo.AsBoolean := True;
  CDSCadastroCli_Enquadramento.AsString := '01';
  CDSCadastroCli_Restricao.AsBoolean := False;
end;

procedure TDMCliente.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMCliente.CDSConsultaCalcFields(DataSet: TDataSet);
var
  sFones: string;
begin
  inherited;

  if CDSConsulta.State = dsInternalCalc then
  begin
    try
    if CDSConsultaCli_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'N�o';

    sFones := CDSConsultaCli_Fone1.AsString;

    if CDSConsultaCli_Fone2.AsString <> '' then
      sFones := sFones + ' - ' + CDSConsultaCli_Fone2.AsString;

//    if CDSConsultaCli_Celular.AsString <> '' then
//      sFones := sFones + ' - ' + CDSConsultaCli_Celular.AsString;
//
//    if CDSConsultaCli_FoneOutro.AsString <> '' then
//      sFones := sFones + ' - ' + CDSConsultaCli_FoneOutro.AsString;

    CDSConsultaC_Telefones.AsString := sFones;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message + ' codigo :' + CDSConsultaCli_Codigo.AsString);
      end;

    end;
  end;
end;

procedure TDMCliente.CDSConsultaCli_DctoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if Sender.Value = null then
    Exit;
  Text := Sender.Value;
end;

procedure TDMCliente.CDSContatoBeforePost(DataSet: TDataSet);
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

procedure TDMCliente.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;

  CDSConsultaCli_Codigo.DisplayFormat := CDisplayFormatCliente;
  CDSCadastroCli_Codigo.DisplayFormat := CDisplayFormatCliente;

  CDSCadastroRev_Codigo.DisplayFormat := CDisplayFormatCodigo;
  CDSCadastroUsu_Codigo.DisplayFormat := CDisplayFormatCodigo;

  cdsHistorico.CreateDataSet;
  CDSContato.CreateDataSet;

  FIdContato := -1;

end;

function TDMCliente.GetCodigoDisplayFormat: string;
begin
  Result := FormatFloat(CDisplayFormatCliente, StrTofloatDef(FCodigoDisplayFormat, 0));
end;

procedure TDMCliente.ppDetailBand2BeforePrint(Sender: TObject);
var
  Horas: Double;
begin
  Horas := StrToFloatDef(HistTotalHoras.Text, 0);
  inherited;
  lblHistTotalHoras.Caption := TFuncoes.DecimalToHora(Horas);
end;

end.

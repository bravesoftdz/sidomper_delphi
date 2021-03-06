unit uParametrosController;

interface

uses
  System.SysUtils, uDMParametros, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  Data.DBXJSON, uParametroVO, uConverter, System.Generics.Collections, Vcl.Dialogs,
  Data.DBXJSONReflect, System.Classes;

type
  TParametrosController = class
  private
    FModel: TDMParametros;
    FOperacao: TOperacao;
    procedure Post;
    procedure AtualizarParametro(ACodigo, APrograma: Integer; AValor: string);
  public
    function CodigoAtual: Integer;
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    function LocalizarParametro(ACodigo, APrograma: Integer): string;
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, ACodigo: Integer);
    procedure TitulosQuadros;
    procedure OrcamentoGravarDataUltimoEmail();

    function BuscarCaminhoImportacaoXML: string;
    function BuscarVersaoAtual(): string;
    function StatusChamadoAtendimento: string;
    function StatusAbertura: string;
    function StatusAberturaAtividade: string;
    function StatusAtendimentoAtividade: string;
    function BuscarFechamentoAgendamento: string;
    function OrcamentoBuscarDataUltimoEmail(): string;
    function OrcamentoBuscarEmailOrcamentoAprovado(): string;
    function CaminhoAplicativoImportarLicencas(): string;
    function CaminhoAnexos(): string;
    function CaminhoXMLClientes(): string;
    function RevendaPadrao(): Integer;
    function ValidarSIDomperClient(ADataHora: string): Boolean;
    procedure Exportar();

    property Model: TDMParametros read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TRevendaController }

uses uFuncoesSIDomper;

function TParametrosController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroPar_Codigo.AsInteger;
end;

procedure TParametrosController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CParametrosPrograma, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.AtualizarParametro(ACodigo, APrograma: Integer;
  AValor: string);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.ParametrosAtualizarParametro(ACodigo, APrograma, AValor);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.BuscarCaminhoImportacaoXML: string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.BuscarCaminhoImportacaoXML();
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.BuscarFechamentoAgendamento: string;
begin
  LocalizarCodigo(36);
  Result := FModel.CDSCadastroPar_Valor.AsString;
end;

function TParametrosController.BuscarVersaoAtual: string;
begin
  LocalizarCodigo(11);
  Result := FModel.CDSCadastroPar_Valor.AsString;
end;

function TParametrosController.CaminhoAnexos: string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.parametrosCaminhoAnexos();
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.CaminhoAplicativoImportarLicencas: string;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio. ParametrosCaminhoAplicativoImportarLicencas();
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.CaminhoXMLClientes: string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.ParametrosCaminhoXMLClientes();
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TParametrosController.Create;
begin
  inherited Create;
  FModel := TDMParametros.Create(nil);
end;

destructor TParametrosController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TParametrosController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CParametrosPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CParametrosPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.Exportar;
var
  Negocio: TServerMethods1Client;
  model: TParametroVO;
  listaParametro: TObjectList<TParametroVO>;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    listaParametro := TConverte.JSONToObject<TListaParametros>(Negocio.ListarParametros());
    for model in listaParametro do
    begin
      dm.cdsParametro.Append;
      dm.cdsParametroCodigo.AsInteger := model.Codigo;
      dm.cdsParametroPrograma.AsInteger := model.Programa;
      dm.cdsParametroValor.AsString := model.Valor;
      dm.cdsParametro.Post;
    end;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(listaParametro);
  end;
end;

procedure TParametrosController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CParametrosPrograma, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CParametrosPrograma, AIdUsuario);
    FModel.Rel.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CParametrosPrograma, ACodigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CParametrosPrograma, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.LocalizarParametro(ACodigo,
  APrograma: Integer): string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.LocalizarParametro(ACodigo, APrograma);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CParametrosPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroPar_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.OrcamentoBuscarDataUltimoEmail: string;
begin
  Result := LocalizarParametro(38, 0);
end;

function TParametrosController.OrcamentoBuscarEmailOrcamentoAprovado: string;
begin
  Result := LocalizarParametro(39, 0);
end;

procedure TParametrosController.OrcamentoGravarDataUltimoEmail;
var
  sData: string;
begin
  sData := FormatDateTime('dd/mm/yyyy', Now);
  AtualizarParametro(38, 0, QuotedStr(sData));
end;

procedure TParametrosController.Pesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo);
end;

procedure TParametrosController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TParametrosController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CParametrosPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CParametrosPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.RevendaPadrao: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToIntDef(Negocio.ParametrosRevendaPadrao(dm.IdUsuario).ToString(),0);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TParametrosController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if FModel.CDSCadastroPar_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o C�digo!');

  if Trim(FModel.CDSCadastroPar_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  if Trim(FModel.CDSCadastroPar_Valor.AsString) = '' then
    raise Exception.Create('Informe o Valor dos Par�metros!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();
      FModel.CDSCadastro.ApplyUpdates(0);
      Negocio.Salvar(CParametrosPrograma, AIdUsuario);
      dm.Desconectar;
    except
      on E: Exception do
      begin
        TFuncoes.MensagemErroBanco(E.Message);
        Abort;
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;

  FOperacao := opNavegar;
end;

function TParametrosController.StatusAbertura: string;
begin
  Result := LocalizarParametro(9, 1);
end;

function TParametrosController.StatusAberturaAtividade: string;
begin
  Result := LocalizarParametro(31, 111);
end;

function TParametrosController.StatusAtendimentoAtividade: string;
begin
  Result := LocalizarParametro(32, 111);
end;

function TParametrosController.StatusChamadoAtendimento: string;
begin
  Result := LocalizarParametro(10, 1);
end;

procedure TParametrosController.TitulosQuadros;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSParametrosTitulosChamados.Close;
    Negocio.BuscarTitulosQuadrosChamados();
    FModel.CDSParametrosTitulosChamados.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TParametrosController.ValidarSIDomperClient(
  ADataHora: string): Boolean;
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
// TESTE
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.ValidarSIDomperClient(ADataHora);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

end.

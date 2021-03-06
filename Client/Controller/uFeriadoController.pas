unit uFeriadoController;

interface

uses
  System.SysUtils, uDMFeriado, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper,
  Data.DBXJSON, Data.DBXJSONReflect, uConverter, uGenericProperty;

type
  TFeriadoController = class
  private
    FModel: TDMFeriado;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure FiltrarPrograma(AObservacaoPrograma: TEnumPrograma; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure LocalizarPadrao(APrograma: TEnumPrograma);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    function Salvar(AIdUsuario: Integer): Integer;
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, Codigo: Integer);
    function CodigoAtual: Integer;

    property Model: TDMFeriado read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TObservacaoController }

uses uObservacaoVO;

procedure TFeriadoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TFeriadoController.CodigoAtual: Integer;
begin
  Result := 0;
end;

constructor TFeriadoController.Create;
begin
  inherited Create;
  FModel := TDMFeriado.Create(nil);
end;

destructor TFeriadoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TFeriadoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado :=  Negocio.Editar(CFeriado, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CFeriado, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CFeriado, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CFeriado, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.FiltrarPrograma(AObservacaoPrograma: TEnumPrograma;
  ACampo, ATexto, AAtivo: string; AContem: Boolean);
//var
//  Negocio: TServerModule2Client;
//  iEnum: Integer;
begin
//  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
//  try
//    iEnum := Integer(AObservacaoPrograma);
//
//    FModel.CDSConsulta.Close;
//    Negocio.FiltrarObservacaoPrograma(ACampo, ATexto, AAtivo, iEnum, AContem);
//    FModel.CDSConsulta.Open;
//  finally
//    FreeAndNil(Negocio);
//  end;
end;

procedure TFeriadoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CFeriado, AIdUsuario);
    dm.Desconectar;
//    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CFeriado, ACodigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CFeriado, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.LocalizarPadrao(APrograma: TEnumPrograma);
var
  Negocio: TServerModule2Client;
  iEnum: Integer;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(APrograma);

    FModel.CDSCadastro.Close;
    Negocio.ObservacaoPadrao(iEnum);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CFeriado, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    //FModel.CDSCadastroCid_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFeriadoController.Pesquisar(AId, Codigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(Codigo);
end;

procedure TFeriadoController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TFeriadoController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoCodigo(CFeriado).ToString);
    Result := iCodigo;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TFeriadoController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoId(CFeriado).ToString);
    Result := iCodigo;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TFeriadoController.Salvar(AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      if (FModel.CDSCadastroFer_Data.AsFloat = 0) or (FModel.CDSCadastroFer_Data.AsString = '') then
        raise Exception.Create('Informe a Data!');

      if Trim(FModel.CDSCadastroFer_Descricao.AsString) = '' then
        raise Exception.Create('Informe a Descri��o!');

      Post;
      FModel.CDSCadastro.ApplyUpdates(0);
      Negocio.Salvar(CFeriado, AIdUsuario);
      FOperacao := opNavegar;
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

end.

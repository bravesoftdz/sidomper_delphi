unit uSolicitacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMSolicitacao,
  uSolicitacaoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, Vcl.OleCtnrs,
  uFraCliente, uFraUsuario, uFraModulo, uFraProduto, uFraTipo, uFraAnalista,
  uFraStatus, uFraDesenv, uFraOperador, uEnumerador, uEnviarEmail, Vcl.Menus,
  uFraColaborador, uSolicitacaoTempoVO, uSolicitacaoTempoManual, uConverter,
  uFiltroSolicitacao, uDMRelSolicitacao, uFraVersao, uConferenciaTempo, uParametrosController, uDepartamentoController,
  uPermissaoSolicitacaoVO, uCategoriaController, uCategoria, uFraCategoria;

type
  TfrmSolicitacao = class(TfrmBaseCadastro)
    PageControl1: TPageControl;
    tsAbertura: TTabSheet;
    tsAnalista: TTabSheet;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    edtCodCliente: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    edtCodModulo: TDBEdit;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    edtCodAbertura: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    edtCodProduto: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    edtNomeArquivo: TDBEdit;
    Label14: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    btnCliente: TSpeedButton;
    btnModulo: TSpeedButton;
    Panel8: TPanel;
    tsOcorrenciaGeral: TTabSheet;
    Panel9: TPanel;
    tsStatus: TTabSheet;
    Panel10: TPanel;
    dlgAbrirArquivo: TOpenDialog;
    dlgSalvarArquivo: TSaveDialog;
    btnAnexar: TSpeedButton;
    btnVisualizar: TSpeedButton;
    dsCronograma: TDataSource;
    tsOcorrenciaTecnica: TTabSheet;
    Panel11: TPanel;
    dsOcorrenciaGeral: TDataSource;
    dsOcorrenciaTecnica: TDataSource;
    btnNovoTecnico: TBitBtn;
    btnExcluirTecnico: TBitBtn;
    btnCancelarTecnico: TBitBtn;
    tsFiltroCliente: TTabSheet;
    Panel12: TPanel;
    Label39: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    tsFiltroUsuario: TTabSheet;
    Panel13: TPanel;
    FraCliente: TFraCliente;
    tsFiltroModulo: TTabSheet;
    Panel14: TPanel;
    FraModulo: TFraModulo;
    tsFiltroAnalista: TTabSheet;
    Panel16: TPanel;
    tsFiltroTipo: TTabSheet;
    Panel17: TPanel;
    tsFiltroStatus: TTabSheet;
    Panel18: TPanel;
    FraTipo: TFraTipo;
    tsFiltroDesenv: TTabSheet;
    Panel19: TPanel;
    tsFiltroOperador: TTabSheet;
    Panel20: TPanel;
    FraStatus: TFraStatus;
    FraDesenvolvedor: TFraDesenvolvedor;
    FraOperador: TFraOperador;
    FraUsuario: TFraColaborador;
    Label40: TLabel;
    dsStatus: TDataSource;
    dbStatus: TDBGrid;
    Label41: TLabel;
    cbbNivel: TComboBox;
    lblMensagem: TLabel;
    edtCodStatus: TDBEdit;
    Label22: TLabel;
    DBEdit4: TDBEdit;
    pgcAnalista: TPageControl;
    tsAnalistaPrincipal: TTabSheet;
    Panel15: TPanel;
    Label15: TLabel;
    btnAnalista: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btnDesenv: TSpeedButton;
    edtCodAnalista: TDBEdit;
    edtNomeAnalista: TDBEdit;
    edtTempoPrevisto: TDBEdit;
    edtPrevisaoEntrega: TDBEdit;
    edtCodDesenv: TDBEdit;
    edtNomeDesenvolvedor: TDBEdit;
    tsCronograma: TTabSheet;
    Panel21: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtCodOperAnalista: TDBEdit;
    DBEdit6: TDBEdit;
    edtDataPrevCrono: TDBEdit;
    edtHoraIniCrono: TDBEdit;
    edtHoraFim: TDBEdit;
    btnOperAnalista: TSpeedButton;
    dbCronograma: TDBGrid;
    btnNovoCrono: TBitBtn;
    btnExcluirCrono: TBitBtn;
    btnCancelarCrono: TBitBtn;
    edtIdOperadorAnalista: TEdit;
    btnSalvarTecnico: TBitBtn;
    btnSalvarCronograma: TBitBtn;
    btnEditarTecnico: TBitBtn;
    btnEditarCrono: TBitBtn;
    btnDetalhes: TBitBtn;
    btnDetalhes2: TBitBtn;
    Label42: TLabel;
    DBEdit2: TDBEdit;
    btnBuscarCliente: TBitBtn;
    btnEditarAnalista: TBitBtn;
    btnSalvarAnalista: TBitBtn;
    btnCancelarAnalista: TBitBtn;
    pmConsulta: TPopupMenu;
    EnviarEmail1: TMenuItem;
    btnListarAnexo2: TBitBtn;
    btnAnexo: TBitBtn;
    tsColaborador: TTabSheet;
    Label43: TLabel;
    edtCodTipoAbertura: TDBEdit;
    DBEdit19: TDBEdit;
    btnTipoAbertura: TSpeedButton;
    Label44: TLabel;
    edtCodTipoAnalise: TDBEdit;
    edtNomeTipoAnalise: TDBEdit;
    btnTipoAnalise: TSpeedButton;
    tsDescricaoAbertura: TTabSheet;
    Panel22: TPanel;
    Panel25: TPanel;
    Panel24: TPanel;
    btnNegrito2: TBitBtn;
    Label12: TLabel;
    dbmDescricaoAbertura: TDBMemo;
    PageControl3: TPageControl;
    tsEdicaoTecnica: TTabSheet;
    tsPesquisaTecnica: TTabSheet;
    Panel23: TPanel;
    Label33: TLabel;
    edtCodOperTecnico: TDBEdit;
    DBEdit22: TDBEdit;
    Edit2: TEdit;
    edtHoraTecnica: TDBEdit;
    Label37: TLabel;
    Label36: TLabel;
    edtDataTecnica: TDBEdit;
    Label38: TLabel;
    Label34: TLabel;
    edtAnexoTecnico: TDBEdit;
    btnAnexarTecnico: TSpeedButton;
    btnVisualizarTecnico: TSpeedButton;
    Panel26: TPanel;
    dbTecnica: TDBGrid;
    Panel27: TPanel;
    btnFormatarTecnico: TBitBtn;
    Panel28: TPanel;
    btnNovoGeral: TBitBtn;
    btnEditarGeral: TBitBtn;
    btnSalvarGeral: TBitBtn;
    btnExcluirGeral: TBitBtn;
    btnCancelarGeral: TBitBtn;
    PageControl4: TPageControl;
    tsEdicaoGeral: TTabSheet;
    tsPesquisaGeral: TTabSheet;
    Panel29: TPanel;
    btnVisualizarOcor: TSpeedButton;
    btnAnexarOcor: TSpeedButton;
    edtAnexoOcorrencia: TDBEdit;
    Label32: TLabel;
    dbmDescricaoGeral: TDBMemo;
    Label31: TLabel;
    edtDataGeral: TDBEdit;
    Label28: TLabel;
    HoraGeral: TDBEdit;
    Label29: TLabel;
    btnTipoGeral: TSpeedButton;
    DBEdit23: TDBEdit;
    edtCodTipoGeral: TDBEdit;
    Label30: TLabel;
    DBEdit15: TDBEdit;
    Edit1: TEdit;
    edtCodOperGeral: TDBEdit;
    Label27: TLabel;
    Panel30: TPanel;
    dbGeral: TDBGrid;
    EditorTecnico2: TDBRichEdit;
    EditorAnalista2: TDBRichEdit;
    Panel31: TPanel;
    Panel32: TPanel;
    FraColaborador: TFraColaborador;
    Label16: TLabel;
    btnModulo2: TSpeedButton;
    edtCodModulo2: TDBEdit;
    edtNomeModulo2: TDBEdit;
    Label21: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label20: TLabel;
    edtVersao: TDBEdit;
    edtNomeVersao: TDBEdit;
    btnVersao: TSpeedButton;
    pmTempo: TMenuItem;
    GroupBox2: TGroupBox;
    Label35: TLabel;
    cbbModelo: TComboBox;
    chkMostrarTempo: TCheckBox;
    tsVersao: TTabSheet;
    Panel33: TPanel;
    FraVersao: TFraVersao;
    FraAnalista: TFraAnalista;
    pmConferenciaTempo: TMenuItem;
    lbl1: TLabel;
    edtIdFiltro: TEdit;
    lblSolicitacaoTecnica: TLabel;
    tsOcorrenciaRegra: TTabSheet;
    Panel34: TPanel;
    PageControl5: TPageControl;
    tsEdicaoRegra: TTabSheet;
    tsPesquisaRegra: TTabSheet;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    btnNovoRegra: TBitBtn;
    btnEditarRegra: TBitBtn;
    btnSalvarRegra: TBitBtn;
    btnExcluirRegra: TBitBtn;
    btnCancelarRegra: TBitBtn;
    dbRegras: TDBGrid;
    dsOcorrenciaRegra: TDataSource;
    Label45: TLabel;
    edtCodOperRegra: TDBEdit;
    DBEdit12: TDBEdit;
    edtDataRegra: TDBEdit;
    edtHoraRegra: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    Edit3: TEdit;
    Label48: TLabel;
    dbmDescricaoRegra: TDBMemo;
    Label49: TLabel;
    edtAnexoOcorrenciaRegra: TDBEdit;
    btnAnexarRegra: TSpeedButton;
    btnVisualizarOcorrenciaRegra: TSpeedButton;
    Label50: TLabel;
    edtCodCategoria: TDBEdit;
    edtNomeCategoria: TDBEdit;
    btnCategoria: TSpeedButton;
    tsCategoria: TTabSheet;
    Panel38: TPanel;
    FraCategoria: TFraCategoria;
    edtTituloAnal: TDBEdit;
    Label51: TLabel;
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharEdicaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodModuloExit(Sender: TObject);
    procedure btnModuloClick(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodAberturaExit(Sender: TObject);
    procedure btnAnalistaClick(Sender: TObject);
    procedure edtCodAnalistaExit(Sender: TObject);
    procedure edtCodDesenvExit(Sender: TObject);
    procedure btnDesenvClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAnexarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure edtCodOperAnalistaExit(Sender: TObject);
    procedure btnOperAnalistaClick(Sender: TObject);
    procedure dsCronogramaStateChange(Sender: TObject);
    procedure dbGeralDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsOcorrenciaGeralStateChange(Sender: TObject);
    procedure dbmDescricaoGeralEnter(Sender: TObject);
    procedure dbmDescricaoGeralExit(Sender: TObject);
    procedure dbGeralKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarGeralClick(Sender: TObject);
    procedure btnExcluirGeralClick(Sender: TObject);
    procedure edtCodTipoGeralExit(Sender: TObject);
    procedure btnTipoGeralClick(Sender: TObject);
    procedure btnAnexarOcorClick(Sender: TObject);
    procedure btnVisualizarOcorClick(Sender: TObject);
    procedure btnAnexarTecnicoClick(Sender: TObject);
    procedure btnCancelarCronoClick(Sender: TObject);
    procedure btnVisualizarTecnicoClick(Sender: TObject);
    procedure btnExcluirTecnicoClick(Sender: TObject);
    procedure btnCancelarTecnicoClick(Sender: TObject);
    procedure btnExcluirCronoClick(Sender: TObject);
    procedure btnNovoTecnicoClick(Sender: TObject);
    procedure dsOcorrenciaTecnicaStateChange(Sender: TObject);
    procedure dbTecnicaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbTecnicaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoGeralClick(Sender: TObject);
    procedure btnFecharFiltroClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoCronoClick(Sender: TObject);
    procedure btnSalvarCronogramaClick(Sender: TObject);
    procedure btnSalvarGeralClick(Sender: TObject);
    procedure btnSalvarTecnicoClick(Sender: TObject);
    procedure dbStatusDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbStatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tsAnalistaShow(Sender: TObject);
    procedure tsOcorrenciaGeralShow(Sender: TObject);
    procedure cbbCamposChange(Sender: TObject);
    procedure dbCronogramaDrawColumnCell(Sender: TObject; const Rect: TRect;
        DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtAnexoOcorrenciaKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure edtAnexoTecnicoKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure edtHoraFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tsFiltroShow(Sender: TObject);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarGeralClick(Sender: TObject);
    procedure btnEditarTecnicoClick(Sender: TObject);
    procedure btnEditarCronoClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure btnDetalhesClick(Sender: TObject);
    procedure btnDetalhes2Click(Sender: TObject);
    procedure pgcAnalistaChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure btnEditarAnalistaClick(Sender: TObject);
    procedure btnSalvarAnalistaClick(Sender: TObject);
    procedure btnCancelarAnalistaClick(Sender: TObject);
    procedure EnviarEmail1Click(Sender: TObject);
    procedure btnListarAnexo2Click(Sender: TObject);
    procedure btnAnexoClick(Sender: TObject);
    procedure FraStatusbtnProcClick(Sender: TObject);
    procedure FraTipobtnProcClick(Sender: TObject);
    procedure FraTipoedtCodigoEnter(Sender: TObject);
    procedure FraStatusedtCodigoEnter(Sender: TObject);
    procedure edtCodTipoAberturaExit(Sender: TObject);
    procedure edtCodTipoAnaliseExit(Sender: TObject);
    procedure btnTipoAberturaClick(Sender: TObject);
    procedure btnTipoAnaliseClick(Sender: TObject);
    procedure edtCodTipoAberturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNegrito2Click(Sender: TObject);
    procedure EditorAberturaChange(Sender: TObject);
    procedure btnFormatarTecnicoClick(Sender: TObject);
    procedure dbTecnicaCellClick(Column: TColumn);
    procedure EditorTecnico2Enter(Sender: TObject);
    procedure EditorTecnico2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditorTecnico2Exit(Sender: TObject);
    procedure EditorAnalista2Enter(Sender: TObject);
    procedure EditorAnalista2Exit(Sender: TObject);
    procedure EditorAnalista2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbmDescricaoGeralKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodModulo2Exit(Sender: TObject);
    procedure btnModulo2Click(Sender: TObject);
    procedure edtVersaoExit(Sender: TObject);
    procedure btnVersaoClick(Sender: TObject);
    procedure edtVersaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmTempoClick(Sender: TObject);
    procedure pmConferenciaTempoClick(Sender: TObject);
    procedure edtIdFiltroExit(Sender: TObject);
    procedure cbbModeloClick(Sender: TObject);
    procedure dbmDescricaoRegraEnter(Sender: TObject);
    procedure dbmDescricaoRegraExit(Sender: TObject);
    procedure dbmDescricaoRegraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAnexarRegraClick(Sender: TObject);
    procedure btnVisualizarOcorrenciaRegraClick(Sender: TObject);
    procedure dbRegrasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbRegrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoRegraClick(Sender: TObject);
    procedure btnEditarRegraClick(Sender: TObject);
    procedure btnSalvarRegraClick(Sender: TObject);
    procedure btnExcluirRegraClick(Sender: TObject);
    procedure btnCancelarRegraClick(Sender: TObject);
    procedure edtAnexoOcorrenciaRegraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsOcorrenciaRegraStateChange(Sender: TObject);
    procedure edtCodCategoriaExit(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FController: TSolicitacaoController;
    FQuadro: Boolean;
    FOcorrenciaGeral: Boolean;
    FOcorrenciaTecnica: Boolean;
    FOcorrenciaRegra: Boolean;
    FAnalise: Boolean;
    FEditar: Boolean;
    FCaminhoAnexo: string;

    procedure Localizar(ATexto: string);
    procedure BuscarModulo(AId, ACodigo: Integer);
    procedure BuscarProduto(AId, ACodigo: Integer);
    procedure BuscarCliente(AId, ACodigo: Integer);
    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure BuscarAnalista(AId, ACodigo: Integer);
    procedure BuscarTipo(AId, ACodigo: Integer);
    procedure BuscarDesenvolvedorTipo(AId, ACodigo: Integer);
    procedure BuscarStatus(AId, ACodigo: Integer);
    procedure BuscarOperadorAnalista(AId, ACodigo: Integer);
    procedure BuscarOperadorGeral(AId, ACodigo: Integer);
    procedure BuscarTipoGeral(AId, ACodigo: Integer);
    procedure BuscarOperadorTecnico(AId, ACodigo: Integer);
    procedure BuscarTipoAbertura(AId, ACodigo: Integer);
    procedure BuscarCategoria(AId, ACodigo: Integer);
    function CancelarOcorrenciaGeral: Boolean;
    procedure NovoGeral;
    procedure ExcluirGeral;
    procedure ExcluirRegra;
    procedure BuscarVersao(AId: Integer);
    function CancelarOcorrenciaTecnico: Boolean;
    function CancelarOcorrenciaRegra: Boolean;

    procedure NovoTecnico;
    procedure NovaRegra;
    procedure ExcluirTecnico;

    procedure MensagemData;
    procedure TeclasAtalho(var Key: Word; var Shift: TShiftState);

    function CancelarCronograma: Boolean;
    procedure NovoCronograma;
    procedure ExcluirCronograma;
    procedure OcorrenciaTecnica;
    procedure OcorrenciaRegra;

    procedure EditarCronograma;
    procedure EditarOcorrenciaGeral;
    procedure EditarOcorrenciaTecnica;
    procedure EditarRegra;

    procedure PageControlsPadrao;
    procedure SalvarCronograma;
    function SalvarCronogramaItem: Boolean;

    function SalvarOcorrenciaGeral: Boolean;
    function SalvarOcorrenciaGeralItem: Boolean;
    function SalvarOcorrenciaTecnicaItem: Boolean;
    function SalvarOcorrenciaRegraItem: Boolean;

    function SalvarTecnico: Boolean;
    function SalvarRegra: Boolean;
    procedure UsuarioGeral;

    function EntrarTelaStatus: Boolean;
    function SalvarOcorrenciaGeralQuadro: Boolean;
    procedure Iniciar(APesquisar: boolean);
    procedure EntrarSolicitacaoQuadro;
    procedure NovaSolicitacaoQuadro;
    procedure NovaSolicitacaoOcorrencia;
    function AutorizacaoParaAlterarOcorrenciaGeral(AId: Integer): Boolean;
    function AutorizacaoParaExcluirOcorrenciaGeral(AId: Integer): Boolean;
    function AutorizacaoParaAlterarOcorrenciaTecnica(AId: Integer): Boolean;
    function AutorizacaoParaExcluirOcorrenciaTecnica(AId: Integer): Boolean;
    function AutorizacaoParaAlterarOcorrenciaRegra(AId: Integer): Boolean;
    function AutorizacaoParaExcluirOcorrenciaRegra(AId: Integer): Boolean;

    procedure ControleBotaoSalvar;
    procedure EnvioEmail(AIdSolicitacao, AIdStatus: Integer);
    procedure HabilitarBotoesAbas;

    procedure EditarAnalista;
    function SalvarAnalista: Boolean;
    function CancelarAnalista: Boolean;

    procedure ListarAnexos(AIdSolicitacao: Integer);
    procedure BuscarObservacao(ATipo: Integer);
    procedure ChamarModulo;
    procedure HabilitaOcorrenciaGeral(AHabilitar: Boolean);
    procedure HabilitaOcorrenciaTecnica(AHabilitar: Boolean);
    procedure HabilitaOcorrenciaRegra(AHabilitar: Boolean);
    procedure PermissaoEdicaoOcorrenciaGeral;
    procedure PermissaoEdicaoOcorrenciaTecnica;
    procedure LiberarAnalista;
    procedure FinalizarTempo(AIdUsuario: Integer);
    function FiltroRelatorio: TFiltroSolicitacao;
    procedure CaminhoAnexo;
    procedure MostrarAnexo();
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False; AQuadro: Boolean = False); overload;
    constructor create(AIdSolicitacao: Integer; AQuadro: Boolean = False;
      AOcorrenciaGeral: Boolean = False; AOcorrenciaTecnica: Boolean = False; AAnalise: Boolean = False;
      AEditar: Boolean = False; AOcorrenciaRegra: Boolean = False); overload;
  end;

var
  frmSolicitacao: TfrmSolicitacao;

implementation

{$R *.dfm}

uses uGrade, uDM, uImagens, uClienteModuloController, uModulo,
  uModuloController, uProduto, uProdutoController, uClienteController, uCliente,
  uUsuarioController, uUsuario, uTipoController, uTipo, uStatusController,
  uStatus, uPosicaoBotao, uStatusTroca, uUsuarioSenha,
  uSolicitacaoDetalhes, uEmailSolicitacao, uEmailBase, uContaEmailController,
  uFormProcesso, uListaAnexos, uFormatacaoMemo, uFormatarTexto,
  uSolicitacaoDetalhes2, uVersaoController, uVersao, uObservacao,
  uObsevacaoController;

function TfrmSolicitacao.AutorizacaoParaAlterarOcorrenciaGeral(AId: Integer): Boolean;
var
  Usuario: TUsuarioController;
begin
  Usuario := TUsuarioController.Create;
  try
    Result := Usuario.UsuarioADM(dm.IdUsuario);

    if Result = False then
      Result := (FController.Model.CDSOcorrenciaGeralConsultaSOcor_UsuarioOperacional.AsInteger = dm.IdUsuario);

    if Result = False then
    begin
      if Usuario.PermissaoSolicitacaoOcorrenciaGeralAlterar(dm.IdUsuario, AId) = False then
        raise Exception.Create('Somente o mesmo usu�rio que lan�ou ou Administrador poder� Editar!')
      else
        Result := True;
    end;
  finally
    FreeAndNil(Usuario);
  end;
end;

function TfrmSolicitacao.AutorizacaoParaAlterarOcorrenciaRegra(
  AId: Integer): Boolean;
var
  Usuario: TUsuarioController;
begin
  Usuario := TUsuarioController.Create;
  try
    Result := Usuario.UsuarioADM(dm.IdUsuario);

    if Result = False then
      Result := (FController.Model.CDSOcorrenciaRegraConsultaSOcor_UsuarioOperacional.AsInteger = dm.IdUsuario);

    if Result = False then
    begin
      if Usuario.PermissaoSolicitacaoOcorrenciaRegraAlterar(dm.IdUsuario, AId) = False then
        raise Exception.Create('Somente o mesmo usu�rio que lan�ou ou Administrador poder� Editar!')
      else
        Result := True;
    end;
  finally
    FreeAndNil(Usuario);
  end;
end;

function TfrmSolicitacao.AutorizacaoParaAlterarOcorrenciaTecnica(AId: Integer): Boolean;
var
  Usuario: TUsuarioController;
begin
  Usuario := TUsuarioController.Create;
  try
    Result := Usuario.UsuarioADM(dm.IdUsuario);

    if Result = False then
      Result := (FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_UsuarioOperacional.AsInteger = dm.IdUsuario);

    if Result = False then
    begin
      if Usuario.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(dm.IdUsuario, AId) = False then
        raise Exception.Create('Somente o mesmo usu�rio que lan�ou ou Administrador poder� Editar!')
      else
        Result := True;
    end;
  finally
    FreeAndNil(Usuario);
  end;
end;

function TfrmSolicitacao.AutorizacaoParaExcluirOcorrenciaGeral(AId: Integer): Boolean;
var
  Usuario: TUsuarioController;
begin
  Result := True;
  Usuario := TUsuarioController.Create;
  try
    if Usuario.PermissaoSolicitacaoOcorrenciaGeralExcluir(dm.IdUsuario, AId) = False then
      Result := TFuncoes.TelaSenha('Lib_Solicitacao_Ocorr_Geral_Exc', AId);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TfrmSolicitacao.AutorizacaoParaExcluirOcorrenciaRegra(
  AId: Integer): Boolean;
var
  Usuario: TUsuarioController;
begin
  Result := True;
  Usuario := TUsuarioController.Create;
  try
    if Usuario.PermissaoSolicitacaoOcorrenciaRegraExcluir(dm.IdUsuario, AId) = False then
      Result := TFuncoes.TelaSenha('Lib_Solicitacao_Ocorr_Regra_Exc', AId);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TfrmSolicitacao.AutorizacaoParaExcluirOcorrenciaTecnica(AId: Integer): Boolean;
var
  Usuario: TUsuarioController;
begin
  Result := True;
  Usuario := TUsuarioController.Create;
  try
    if Usuario.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(dm.IdUsuario, AId) = False then
      Result := TFuncoes.TelaSenha('Lib_Solicitacao_Ocorr_Tecnica_Exc', AId);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmSolicitacao.btnFormatarTecnicoClick(Sender: TObject);
var
  form: TfrmFormatarTexto;
begin
  form := TfrmFormatarTexto.Create(EditorTecnico2);
  if form.ShowModal = mrOk then
  begin
    FController.ModoEdicaoInsercaoOcorrenciaTecnica;
//    EditorTecnico.PasteFromClipboard;
    EditorTecnico2.PasteFromClipboard;
//    FController.ModoEdicaoInsercaoOcorrenciaTecnica();
  end;
  FreeAndNil(form);
end;

procedure TfrmSolicitacao.btnNegrito2Click(Sender: TObject);
var
  form: TfrmFormatarTexto;
begin
  FController.ModoEdicaoInsercao();
  form := TfrmFormatarTexto.Create(EditorAnalista2);

  if form.ShowModal = mrOk then
    EditorAnalista2.PasteFromClipboard;

  FreeAndNil(form);
end;

procedure TfrmSolicitacao.btnAnalistaClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarAnalista(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnAnexarClick(Sender: TObject);
begin
  inherited;
  dlgAbrirArquivo.InitialDir := FCaminhoAnexo;
  if dlgAbrirArquivo.Execute then
  begin
    if Trim(dlgAbrirArquivo.FileName) = '' then
      raise Exception.Create('Informe o Nome do Arquivo.');

    FController.ModoEdicaoInsercao;
    FController.Model.CDSCadastroSol_Anexo.AsString := dlgAbrirArquivo.FileName;
  end;
end;

procedure TfrmSolicitacao.btnAnexarOcorClick(Sender: TObject);
begin
  inherited;
  if not (dsOcorrenciaGeral.State in [dsEdit, dsInsert]) then
    Exit;

  dlgAbrirArquivo.InitialDir := FCaminhoAnexo;
  if dlgAbrirArquivo.Execute then
  begin
    if Trim(dlgAbrirArquivo.FileName) = '' then
      raise Exception.Create('Informe o Nome do Arquivo.');

    FController.ModoEdicaoInsercaoOcorrencia;
    FController.Model.CDSOcorrenciaGeralConsultaSOcor_Anexo.AsString := dlgAbrirArquivo.FileName;
    if edtAnexoOcorrencia.Enabled then
      edtAnexoOcorrencia.SetFocus;
  end;
end;

procedure TfrmSolicitacao.btnAnexarRegraClick(Sender: TObject);
begin
  inherited;
  if not (dsOcorrenciaRegra.State in [dsEdit, dsInsert]) then
    Exit;

  dlgAbrirArquivo.InitialDir := FCaminhoAnexo;
  if dlgAbrirArquivo.Execute then
  begin
    if Trim(dlgAbrirArquivo.FileName) = '' then
      raise Exception.Create('Informe o Nome do Arquivo.');

    FController.ModoEdicaoInsercaoOcorrenciaRegra;
    FController.Model.CDSOcorrenciaRegraConsultaSOcor_Anexo.AsString := dlgAbrirArquivo.FileName;
    if edtAnexoOcorrenciaRegra.Enabled then
      edtAnexoOcorrenciaRegra.SetFocus;
  end;
end;

procedure TfrmSolicitacao.btnAnexarTecnicoClick(Sender: TObject);
begin
  inherited;
  if not (dsOcorrenciaTecnica.State in [dsEdit, dsInsert]) then
    Exit;

  dlgAbrirArquivo.InitialDir := FCaminhoAnexo;
  if dlgAbrirArquivo.Execute then
  begin
    if Trim(dlgAbrirArquivo.FileName) = '' then
      raise Exception.Create('Informe o Nome do Arquivo.');

    FController.ModoEdicaoInsercaoOcorrenciaTecnica;
    FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_Anexo.AsString := dlgAbrirArquivo.FileName;
    if edtAnexoTecnico.Enabled then
      edtAnexoTecnico.SetFocus;
  end;
end;

procedure TfrmSolicitacao.btnAnexoClick(Sender: TObject);
begin
  inherited;
  ListarAnexos(FController.Model.CDSConsultaSol_Id.AsInteger);
end;

procedure TfrmSolicitacao.btnBuscarClienteClick(Sender: TObject);
begin
  inherited;
  if not (TFuncoes.FormularioEstaCriado(TfrmCliente)) then
    TFuncoes.CriarFormulario(TfrmCliente.create(DM.IdUsuario));
end;

procedure TfrmSolicitacao.btnCancelarGeralClick(Sender: TObject);
begin
  inherited;
  FController.CancelarOcorrenciaGeral;
  btnSalvar.Enabled := True;
end;

procedure TfrmSolicitacao.btnCancelarRegraClick(Sender: TObject);
begin
  inherited;
  FController.CancelarOcorrenciaRegra;
  btnSalvar.Enabled := True;
end;

procedure TfrmSolicitacao.btnCancelarTecnicoClick(Sender: TObject);
begin
  inherited;
  FController.CancelarOcorrenciaTecnica;
  btnSalvar.Enabled := True;
end;

procedure TfrmSolicitacao.btnCategoriaClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmCategoria.create(true));
  if dm.IdSelecionado > 0 then
    BuscarCategoria(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnClienteClick(Sender: TObject);
begin
  inherited;
  if edtCodAbertura.Text = '' then
    raise Exception.Create('Informe o Usu�rio de Abertura.');

  TFuncoes.CriarFormularioModal(TfrmCliente.create(FController.Model.CDSCadastroSol_UsuarioAbertura.AsInteger ,true));
  if dm.IdSelecionado > 0 then
    BuscarCliente(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnDesenvClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarDesenvolvedorTipo(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnDetalhes2Click(Sender: TObject);
var
  Formulario: TfrmSolicitacaoDetalhes2;
  Id: Integer;
begin
  inherited;
  if FController.Model.CDSConsulta.IsEmpty then
    raise Exception.Create('Informe a Solicita��o!');

  FController.LocalizarId(FController.Model.CDSConsultaSol_Id.AsInteger);

  Id := FController.Model.CDSConsultaSol_Id.AsInteger;
  FController.LocalizarId(Id);

  Formulario := TfrmSolicitacaoDetalhes2.Create(Id, TEnumSolicitacao.solTodos);
//  Formulario := TfrmSolicitacaoDetalhes2.Create(Id);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmSolicitacao.btnDetalhesClick(Sender: TObject);
var
  Formulario: TfrmSolicitacaoDetalhes2;
begin
  inherited;
  Formulario := TfrmSolicitacaoDetalhes2.Create(FController.Model.CDSCadastroSol_Id.AsInteger, TEnumSolicitacao.solTodos);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmSolicitacao.btnEditarAnalistaClick(Sender: TObject);
begin
  inherited;
  FController.ModoEdicaoInsercao;

//  btnEditarAnalista.Enabled := False;
//  btnSalvarAnalista.Enabled := True;
//  btnCancelarAnalista.Enabled := True;
//
//  btnSalvar.Enabled := False;
end;

procedure TfrmSolicitacao.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);

  inherited;
  if (FQuadro) and (FAnalise) then
    FController.ModoEdicaoInsercao;
  try
    PageControlsPadrao;
//    PageControl1.ActivePageIndex := 0;
    if edtNome.Enabled then
      edtNome.SetFocus;

    HabilitarBotoesAbas();
    PermissaoEdicaoOcorrenciaGeral;
    PermissaoEdicaoOcorrenciaTecnica;
    LiberarAnalista;
  except
    // nada
  end;
end;

procedure TfrmSolicitacao.btnEditarCronoClick(Sender: TObject);
begin
  inherited;
  if dsCronograma.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Editar!');

  dsCronograma.DataSet.Edit;
  if edtCodOperAnalista.Enabled then
    edtCodOperAnalista.SetFocus;
end;

procedure TfrmSolicitacao.btnEditarGeralClick(Sender: TObject);
begin
  inherited;
  if dsOcorrenciaGeral.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Editar!');

  if AutorizacaoParaAlterarOcorrenciaGeral(dsOcorrenciaGeral.DataSet.FieldByName('SOcor_Id').AsInteger) then
  begin
    HabilitaOcorrenciaGeral(True);
    tsEdicaoGeral.Show;
    dsOcorrenciaGeral.DataSet.Edit;
    if edtDataGeral.Enabled then
      edtDataGeral.SetFocus;
  end
  else
    HabilitaOcorrenciaGeral(False);
end;

procedure TfrmSolicitacao.btnEditarRegraClick(Sender: TObject);
begin
  inherited;
  if dsOcorrenciaRegra.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Editar!');

  if AutorizacaoParaAlterarOcorrenciaRegra(dsOcorrenciaRegra.DataSet.FieldByName('SOcor_Id').AsInteger) then
  begin
    HabilitaOcorrenciaRegra(True);
    tsEdicaoRegra.Show;
    dsOcorrenciaRegra.DataSet.Edit;
    if edtDataRegra.Enabled then
      edtDataRegra.SetFocus;
  end
  else
    HabilitaOcorrenciaRegra(False);
end;

procedure TfrmSolicitacao.btnEditarTecnicoClick(Sender: TObject);
begin
  inherited;
  if dsOcorrenciaTecnica.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Editar!');

  if AutorizacaoParaAlterarOcorrenciaTecnica(dsOcorrenciaTecnica.DataSet.FieldByName('SOcor_Id').AsInteger) then
  begin
    HabilitaOcorrenciaTecnica(True);
    tsEdicaoTecnica.Show;
    dsOcorrenciaTecnica.DataSet.Edit;
    if edtDataTecnica.Enabled then
      edtDataTecnica.SetFocus;
  end
  else
    HabilitaOcorrenciaTecnica(False);
end;

procedure TfrmSolicitacao.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmSolicitacao.btnExcluirGeralClick(Sender: TObject);
begin
  if dsOcorrenciaGeral.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Excluir!');

  inherited;
  if AutorizacaoParaExcluirOcorrenciaGeral(dsOcorrenciaGeral.DataSet.FieldByName('SOcor_Id').AsInteger) then
  begin
    if TFuncoes.Confirmar('Excluir Registro?') then
    begin
      FController.ExcluirOcorrenciaGeral;
      FController.ModoEdicaoInsercao;
    end;
  end;
end;

procedure TfrmSolicitacao.btnExcluirRegraClick(Sender: TObject);
begin
  if dsOcorrenciaRegra.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Excluir!');

  inherited;
  if AutorizacaoParaExcluirOcorrenciaRegra(dsOcorrenciaRegra.DataSet.FieldByName('SOcor_Id').AsInteger) then
  begin
    if TFuncoes.Confirmar('Excluir Registro?') then
    begin
      FController.ExcluirOcorrenciaRegra;
      FController.ModoEdicaoInsercao;
    end;
  end;
end;

procedure TfrmSolicitacao.btnExcluirTecnicoClick(Sender: TObject);
begin
  if dsOcorrenciaTecnica.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Excluir!');

  inherited;
  if AutorizacaoParaExcluirOcorrenciaTecnica(dsOcorrenciaTecnica.DataSet.FieldByName('SOcor_Id').AsInteger) then
  begin
    if TFuncoes.Confirmar('Excluir Registro?') then
    begin
      FController.ExcluirOcorrenciaTecnica;
      FController.ModoEdicaoInsercao;
    end;
  end;
end;

procedure TfrmSolicitacao.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmSolicitacao.btnFecharFiltroClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
end;

procedure TfrmSolicitacao.btnFiltroClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  inherited;
  PageControl1.TabIndex := 0;
end;

procedure TfrmSolicitacao.btnImprimirClick(Sender: TObject);
var
  sModelo: string;
  obj: TSolicitacaoController;
  Filtro: TFiltroSolicitacao;
begin
  FController.Imprimir(dm.IdUsuario);

  obj := TSolicitacaoController.Create;
  try
    Filtro := FiltroRelatorio();

    sModelo := Copy(cbbModelo.Text, 1,2);

    case StrToInt(sModelo) of
      1: FController.Relatorios(1, dm.IdUsuario, Filtro, chkMostrarTempo.Checked);
      2: FController.Relatorios(2, dm.IdUsuario, Filtro, chkMostrarTempo.Checked);
      3: FController.Relatorios(3, dm.IdUsuario, Filtro, chkMostrarTempo.Checked);
    end;
  finally
    TConverte.DestroiObj<TSolicitacaoController>(obj);
    TConverte.DestroiObj<TFiltroSolicitacao>(Filtro);
  end;

  inherited;
end;

procedure TfrmSolicitacao.btnListarAnexo2Click(Sender: TObject);
begin
  inherited;
  ListarAnexos(FController.Model.CDSCadastroSol_Id.AsInteger);
end;

procedure TfrmSolicitacao.btnModulo2Click(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmModulo.create(FController.Model.CDSCadastroSol_Cliente.AsInteger, true));
  if dm.IdSelecionado > 0 then
    BuscarModulo(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnModuloClick(Sender: TObject);
begin
  inherited;
  ChamarModulo();
end;

procedure TfrmSolicitacao.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  PageControlsPadrao;
//  EditorTecnico.Clear;
  try
    NovaSolicitacaoQuadro();
    HabilitarBotoesAbas();
    if edtNome.Enabled then
      edtNome.SetFocus;
  except
    // nada
  end;
end;

procedure TfrmSolicitacao.btnNovoGeralClick(Sender: TObject);
begin
  inherited;
  NovoGeral;
end;

procedure TfrmSolicitacao.btnNovoRegraClick(Sender: TObject);
begin
  inherited;
  NovaRegra();
end;

procedure TfrmSolicitacao.btnNovoTecnicoClick(Sender: TObject);
begin
  inherited;
  NovoTecnico;
end;

procedure TfrmSolicitacao.btnOperAnalistaClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarOperadorAnalista(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnSalvarAnalistaClick(Sender: TObject);
var
  Resultado: Boolean;
begin
  inherited;
//  btnEditarAnalista.Enabled := true;
  btnSalvarAnalista.Enabled := False;
  btnCancelarAnalista.Enabled := False;
  btnSalvar.Enabled := True;

  if FQuadro then
    btnSalvarClick(Self);
end;

procedure TfrmSolicitacao.btnSalvarClick(Sender: TObject);
var
  bInclusao: Boolean;
  bResultado: Boolean;
begin
  if not (dsCad.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  FController.Model.CDSCadastroSol_UsuarioAtendeAtual.AsInteger := dm.IdUsuario;

  if dsCronograma.State in [dsEdit, dsInsert] then
    raise Exception.Create('Cronograma est� em Modo de Edi��o, Salve ou Cancele!');

  if dsOcorrenciaGeral.State in [dsEdit, dsInsert] then
    raise Exception.Create('Ocorr�ncia Geral est� em Modo de Edi��o, Salve ou Cancele!');

  if dsOcorrenciaTecnica.State in [dsEdit, dsInsert] then
    raise Exception.Create('Ocorr�ncia T�cnica est� em Modo de Edi��o, Salve ou Cancele!');

  if (FQuadro = True) and (FAnalise = True) then
  begin
    if (tsAnalista.TabVisible) and (FController.Model.CDSCadastroSol_VersaoId.AsInteger = 0) then
      raise Exception.Create('Informe a Vers�o na Aba Analista!');
  end;

  bInclusao := (FController.Model.CDSCadastro.State = dsInsert);

  if (FAnalise) then
    EntrarTelaStatus();

  FController.Salvar(dm.IdUsuario);

  if (bInclusao) and (FQuadro = False) then
    EnvioEmail(FController.Model.CDSCadastroSol_Id.AsInteger,
               FController.Model.CDSCadastroSol_Status.AsInteger);

  if (FQuadro) and (bInclusao = False) then
  begin
    EnvioEmail(FController.Model.CDSCadastroSol_Id.AsInteger,
               FController.Model.CDSCadastroSol_Status.AsInteger);
  end;

  if FQuadro then
  begin
    Self.Close;
    Exit;
  end;

  if (SalvarOcorrenciaGeralQuadro = False) then
  begin
    if bInclusao then
      FController.FiltrarCodigo(FController.CodigoAtual())
    else
      FController.FiltrarCodigo(FController.Model.CDSCadastroSol_Id.AsInteger);

    inherited;
  end;
  btnSalvar.Enabled := False;
end;

procedure TfrmSolicitacao.btnTipoAberturaClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prSolicitacao, true));
  if dm.IdSelecionado > 0 then
    BuscarTipoAbertura(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnTipoAnaliseClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prSolicitacao, true));
  if dm.IdSelecionado > 0 then
    BuscarTipoAbertura(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnTipoGeralClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prSolicitacao, true));
  if dm.IdSelecionado > 0 then
    BuscarTipoGeral(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.btnVersaoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmVersao.create(true));
  if dm.IdSelecionado > 0 then
    BuscarVersao(dm.IdSelecionado);
end;

procedure TfrmSolicitacao.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  TFuncoes.VisualizarArquivo(edtNomeArquivo.Text);
end;

procedure TfrmSolicitacao.btnVisualizarOcorClick(Sender: TObject);
begin
  inherited;
  TFuncoes.VisualizarArquivo(edtAnexoOcorrencia.Text);
end;

procedure TfrmSolicitacao.btnVisualizarTecnicoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.VisualizarArquivo(edtAnexoTecnico.Text);
end;

procedure TfrmSolicitacao.BuscarAnalista(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        if edtCodAnalista.Enabled then
          edtCodAnalista.SetFocus;
      end;
    end;
  finally
    if dsCad.DataSet.State in [dsEdit, dsInsert] then
    begin
      FController.ModoEdicaoInsercao();
      FController.Model.CDSCadastroSol_Analista.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
      FController.Model.CDSCadastroAnal_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
      FController.Model.CDSCadastroAnal_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;
    end;

    FreeAndNil(obj);
  end;
  edtCodAnalista.Modified := False;
end;

procedure TfrmSolicitacao.BuscarCategoria(AId, ACodigo: Integer);
var
  obj: TCategoriaController;
begin
  obj := TCategoriaController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodCategoria.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroSol_Categoria.AsString := obj.Model.CDSCadastroCat_Id.AsString;
    FController.Model.CDSCadastroCat_Codigo.AsString := obj.Model.CDSCadastroCat_Codigo.AsString;
    FController.Model.CDSCadastroCat_Nome.AsString := obj.Model.CDSCadastroCat_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodCategoria.Modified := False;
end;

procedure TfrmSolicitacao.BuscarCliente(AId, ACodigo: Integer);
var
  obj: TClienteController;
begin
  if edtCodAbertura.Text = '' then
  begin
    FController.Model.CDSCadastroSol_Cliente.Clear;
    FController.Model.CDSCadastroCli_Codigo.Clear;
    FController.Model.CDSCadastroCli_Nome.Clear;

    raise Exception.Create('Informe o Usu�rio de Abertura.');
  end;

  obj := TClienteController.Create;
  try
    try
      obj.APesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        if edtCodCliente.Enabled then
          edtCodCliente.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroSol_Cliente.AsString := obj.Model.CDSCadastroCli_Id.AsString;
    FController.Model.CDSCadastroCli_Codigo.AsString := obj.Model.CDSCadastroCli_Codigo.AsString;
    FController.Model.CDSCadastroCli_Nome.AsString := obj.Model.CDSCadastroCli_Nome.AsString;
    FController.Model.CDSCadastroSol_Versao.AsString := obj.Model.CDSCadastroCli_Versao.AsString;

    FreeAndNil(obj);
  end;
  edtCodCliente.Modified := False;

  if edtCodCliente.Text <> '' then
  begin
    if edtCodModulo.Text = '' then
      ChamarModulo();
  end;
end;

procedure TfrmSolicitacao.BuscarDesenvolvedorTipo(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodDesenv.SetFocus;
      end;
    end;
  finally
    if dsCad.DataSet.State in [dsEdit, dsInsert] then
    begin
      FController.ModoEdicaoInsercao();
      FController.Model.CDSCadastroSol_Desenvolvedor.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
      FController.Model.CDSCadastroDesenv_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
      FController.Model.CDSCadastroDesenv_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;
    end;

    FreeAndNil(obj);
  end;
  edtCodDesenv.Modified := False;
end;

procedure TfrmSolicitacao.BuscarModulo(AId, ACodigo: Integer);
var
  obj: TModuloController;
  ClienteModulo: TClienteModuloController;
begin
  obj := TModuloController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, FController.Model.CDSCadastroSol_Cliente.AsInteger);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodModulo.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroSol_Modulo.AsString := obj.Model.CDSCadastroMod_Id.AsString;
    FController.Model.CDSCadastroMod_Codigo.AsString := obj.Model.CDSCadastroMod_Codigo.AsString;
    FController.Model.CDSCadastroMod_Nome.AsString := obj.Model.CDSCadastroMod_Nome.AsString;

    FreeAndNil(obj);
  end;

  // buscar produto
  if StrToIntDef(edtCodModulo.Text, 0) > 0 then
  begin
    ClienteModulo := TClienteModuloController.Create;
    try
      ClienteModulo.LocalizarModuloProduto(FController.Model.CDSCadastroSol_Cliente.AsInteger,
        FController.Model.CDSCadastroSol_Modulo.AsInteger);

      FController.Model.CDSCadastroSol_Produto.AsString := ClienteModulo.Model.CDSCadastroCliMod_Produto.AsString;
      FController.Model.CDSCadastroProd_Codigo.AsString := ClienteModulo.Model.CDSCadastroProd_Codigo.AsString;
      FController.Model.CDSCadastroProd_Nome.AsString := ClienteModulo.Model.CDSCadastroProd_Nome.AsString;
    finally
      FreeAndNil(ClienteModulo);
    end;
  end
  else begin
    FController.Model.CDSCadastroSol_Produto.Clear;
    FController.Model.CDSCadastroProd_Codigo.Clear;
    FController.Model.CDSCadastroProd_Nome.Clear;
  end;

  edtCodModulo.Modified := False;
  edtCodModulo2.Modified := False;
end;

procedure TfrmSolicitacao.BuscarObservacao(ATipo: Integer);
var
  obs: TObservacaoController;
  sDescricao: string;
begin
{===============================================================================
  ATipo = 1-Descri�o Abertura
          2-Analista
          3-Ocorr�ncia Geral
          4-Ocorr�ncia T�cnica
===============================================================================}

  if (ATipo = 1) and (dbmDescricaoAbertura.Enabled = False) then
    Exit;

  if (ATipo = 2) and (EditorAnalista2.Enabled = False) then
    Exit;

  if (ATipo = 3) and (dbmDescricaoGeral.Enabled = False) then
    Exit;

  if (ATipo = 4) and (EditorTecnico2.Enabled = False) then
    Exit;

  if (ATipo = 5) and (dbmDescricaoRegra.Enabled = False) then
    Exit;

  TFuncoes.CriarFormularioModal(TfrmObservacao.create(true, prSolicitacao));
  if dm.IdSelecionado > 0 then
  begin

    obs := TObservacaoController.Create;
    try
      obs.LocalizarId(dm.IdSelecionado);
      case ATipo of
        1:
        begin
          FController.ModoEdicaoInsercao;
          FController.Model.CDSCadastroSol_Descricao.AsString :=
          FController.Model.CDSCadastroSol_Descricao.AsString + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
        end;
        2:
        begin
          FController.ModoEdicaoInsercao;
          sDescricao := EditorAnalista2.Text;
          sDescricao := sDescricao + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
          FController.Model.CDSCadastroSol_DescricaoLiberacao.AsString := sDescricao;
        end;
        3:
        begin
          if FController.Model.CDSOcorrenciaGeralConsulta.State in [dsEdit, dsInsert] then
          begin
            sDescricao := dbmDescricaoGeral.Text;
            sDescricao := sDescricao + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
            FController.Model.CDSOcorrenciaGeralConsultaSOcor_Descricao.AsString := sDescricao;
          end;
        end;
        4:
        begin
          if FController.Model.CDSOcorrenciaTecnicaConsulta.State in [dsEdit, dsInsert] then
          begin
            sDescricao := EditorTecnico2.Text;
            sDescricao := sDescricao + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
            FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_Descricao.AsString := sDescricao;
          end;
        end;
        5:
        begin
          if FController.Model.CDSOcorrenciaRegraConsulta.State in [dsEdit, dsInsert] then
          begin
            sDescricao := dbmDescricaoRegra.Text;
            sDescricao := sDescricao + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
            FController.Model.CDSOcorrenciaRegraConsultaSOcor_Descricao.AsString := sDescricao;
          end;
        end;
      end;
    finally
      FreeAndNil(obs);
    end;
  end;
end;

procedure TfrmSolicitacao.BuscarOperadorAnalista(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  if not (dsCronograma.State in [dsEdit, dsInsert]) then
    Exit;

  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodOperAnalista.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercaoCronograma();
    FController.Model.CDSCronogramaConsultaSCro_UsuarioOperacional.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSCronogramaConsultaUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSCronogramaConsultaUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodOperAnalista.Modified := False;
end;

procedure TfrmSolicitacao.BuscarOperadorGeral(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodOperGeral.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercaoOcorrencia();
    FController.Model.CDSOcorrenciaGeralConsultaSOcor_UsuarioOperacional.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSOcorrenciaGeralConsultaUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSOcorrenciaGeralConsultaUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodOperGeral.Modified := False;
end;

procedure TfrmSolicitacao.BuscarOperadorTecnico(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodOperTecnico.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercaoOcorrenciaTecnica();
    FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_UsuarioOperacional.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSOcorrenciaTecnicaConsultaUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSOcorrenciaTecnicaConsultaUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodOperTecnico.Modified := False;
end;

procedure TfrmSolicitacao.BuscarProduto(AId, ACodigo: Integer);
var
  obj: TProdutoController;
begin
  obj := TProdutoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodProduto.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao;
    FController.Model.CDSCadastroSol_Produto.AsString := obj.Model.CDSCadastroProd_Id.AsString;
    FController.Model.CDSCadastroProd_Codigo.AsString := obj.Model.CDSCadastroProd_Codigo.AsString;
    FController.Model.CDSCadastroProd_Nome.AsString := obj.Model.CDSCadastroProd_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodProduto.Modified := False;
end;

procedure TfrmSolicitacao.BuscarStatus(AId, ACodigo: Integer);
var
  obj: TStatusController;
begin
  obj := TStatusController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prSolicitacao);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodStatus.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroSol_Status.AsString := obj.Model.CDSCadastroSta_Id.AsString;
    FController.Model.CDSCadastroSta_Codigo.AsString := obj.Model.CDSCadastroSta_Codigo.AsString;
    FController.Model.CDSCadastroSta_Nome.AsString := obj.Model.CDSCadastroSta_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodStatus.Modified := False;
end;

procedure TfrmSolicitacao.BuscarTipo(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prSolicitacao);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
//        edtCodTipo.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroSol_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSCadastroTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSCadastroTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;

    FreeAndNil(obj);
  end;
//  edtCodTipo.Modified := False;
end;

procedure TfrmSolicitacao.BuscarTipoAbertura(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prSolicitacao);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        if tsAbertura.Showing then
          edtCodTipoAbertura.SetFocus
        else
          edtCodTipoAnalise.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroSol_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSCadastroTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSCadastroTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodTipoAbertura.Modified := False;
  edtCodTipoAnalise.Modified := False;
end;

procedure TfrmSolicitacao.BuscarTipoGeral(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prSolicitacao);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipoGeral.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercaoOcorrencia();
    FController.Model.CDSOcorrenciaGeralConsultaSOcor_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSOcorrenciaGeralConsultaTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSOcorrenciaGeralConsultaTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;

    if FController.Model.CDSOcorrenciaGeralConsultaSOcor_UsuarioOperacional.AsInteger = 0 then
      UsuarioGeral;

    FreeAndNil(obj);
  end;
  edtCodTipoGeral.Modified := False;
end;


procedure TfrmSolicitacao.BuscarUsuario(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroSol_UsuarioAbertura.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSCadastroUAb_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSCadastroUAb_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodAbertura.Modified := False;
end;

procedure TfrmSolicitacao.BuscarVersao(AId: Integer);
var
  obj: TVersaoController;
begin
  obj := TVersaoController.Create;
  try
    try
      obj.LocalizarId(AId);
    except
      On E: Exception do
      begin
        if AId > 0 then
        begin
          ShowMessage(E.Message);
          if edtVersao.Enabled then
            edtVersao.SetFocus;
          end;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao;
    FController.Model.CDSCadastroSol_VersaoId.AsString := obj.Model.CDSCadastroVer_Id.AsString;
    FController.Model.CDSCadastroVer_Versao.AsString := obj.Model.CDSCadastroVer_Versao.AsString;

    if obj.Model.CDSCadastroVer_DataLiberacao.AsDateTime > 0 then
      FController.Model.CDSCadastroSol_PrevisaoEntrega.AsDateTime := obj.Model.CDSCadastroVer_DataLiberacao.AsDateTime;

    FreeAndNil(obj);
  end;
  edtVersao.Modified := False;
end;

procedure TfrmSolicitacao.CaminhoAnexo;
var
  parametros: TParametrosController;
begin
  parametros := TParametrosController.Create;
  try
    FCaminhoAnexo := parametros.CaminhoAnexos();
  finally
    FreeAndNil(parametros);
  end;
end;

function  TfrmSolicitacao.CancelarAnalista: Boolean;
begin
  Result := False;
  if (tsAnalista.Showing) and (tsAnalistaPrincipal.Showing) then
  begin
    if btnCancelarAnalista.Enabled then
    begin
      btnCancelarAnalistaClick(Self);
      Result := True;
    end;
  end;
end;

function TfrmSolicitacao.CancelarCronograma: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsCronograma.Showing) then
  begin
    if dsCronograma.State in [dsEdit, dsInsert] then
    begin
      if btnCancelarCrono.Enabled then
      begin
        btnCancelarCronoClick(Self);
        Result := True;
      end;
    end;
  end;
end;

function TfrmSolicitacao.CancelarOcorrenciaGeral: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsOcorrenciaGeral.Showing) then
  begin
    if dsOcorrenciaGeral.State in [dsEdit, dsInsert] then
    begin
      if btnCancelarGeral.Enabled then
      begin
        btnCancelarGeralClick(Self);
        Result := True;
      end;
    end;
  end;
end;

function TfrmSolicitacao.CancelarOcorrenciaRegra: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsOcorrenciaRegra.Showing) then
  begin
    if dsOcorrenciaRegra.State in [dsEdit, dsInsert] then
    begin
      if btnCancelarRegra.Enabled then
      begin
        btnCancelarRegraClick(Self);
        Result := True;
      end;
    end;
  end;
end;

function TfrmSolicitacao.CancelarOcorrenciaTecnico: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsOcorrenciaTecnica.Showing) then
  begin
    if dsOcorrenciaTecnica.State in [dsEdit, dsInsert] then
    begin
      if btnCancelarTecnico.Enabled then
      begin
        btnCancelarTecnicoClick(Self);
        Result := True;
      end;
    end;
  end;
end;

procedure TfrmSolicitacao.cbbCamposChange(Sender: TObject);
begin
  inherited;
  MensagemData;
end;

procedure TfrmSolicitacao.cbbModeloClick(Sender: TObject);
begin
  inherited;
  chkMostrarTempo.Visible := (Copy(cbbModelo.Text,1,2) = '01');
end;

procedure TfrmSolicitacao.ChamarModulo;
begin
  TFuncoes.CriarFormularioModal(TfrmModulo.create(FController.Model.CDSCadastroSol_Cliente.AsInteger, true));
  if dm.IdSelecionado > 0 then
    BuscarModulo(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacao.ControleBotaoSalvar;
begin
  btnSalvar.Enabled := (btnExcluirTecnico.Enabled = true) and
                       (btnExcluirCrono.Enabled = True) and
                       (btnExcluirGeral.Enabled = True) and
                       (btnExcluirRegra.Enabled = True) and
                       (FController.Model.CDSCadastro.State in [dsEdit, dsInsert]);
end;

constructor TfrmSolicitacao.create(AIdSolicitacao: Integer; AQuadro: Boolean = False;
  AOcorrenciaGeral: Boolean = False; AOcorrenciaTecnica: Boolean = False;
  AAnalise: Boolean = False; AEditar: Boolean = False; AOcorrenciaRegra: Boolean = False);
begin
  inherited create(nil);
  Iniciar(Pesquisa);
  FController.FiltrarCodigo(AIdSolicitacao);

  lblSolicitacaoTecnica.Caption := 'ID Sol.: ' + FormatFloat('000000', FController.Model.CDSConsultaSol_Id.AsInteger) + ' - ' + FController.Model.CDSConsultaCli_Nome.AsString;

  FQuadro := AQuadro;
  FOcorrenciaGeral := AOcorrenciaGeral;
  FOcorrenciaTecnica := AOcorrenciaTecnica;
  FOcorrenciaRegra := AOcorrenciaRegra;
  FAnalise := AAnalise;
  FEditar := AEditar;

  if AEditar = False then
    NovaSolicitacaoOcorrencia();

end;

procedure TfrmSolicitacao.HabilitaOcorrenciaGeral(AHabilitar: Boolean);
begin
  edtDataGeral.Enabled := AHabilitar;
  HoraGeral.Enabled := AHabilitar;
  edtAnexoOcorrencia.Enabled := AHabilitar;
  dbmDescricaoGeral.Enabled := AHabilitar;

  edtAnexoOcorrencia.Enabled := AHabilitar;
  btnAnexarOcor.Enabled := AHabilitar;
  btnVisualizarOcor.Enabled := AHabilitar;
end;

procedure TfrmSolicitacao.HabilitaOcorrenciaRegra(AHabilitar: Boolean);
begin
  edtDataRegra.Enabled := AHabilitar;
  edtHoraRegra.Enabled := AHabilitar;
  dbmDescricaoRegra.Enabled := AHabilitar;

  edtAnexoOcorrenciaRegra.Enabled := AHabilitar;
  btnAnexarRegra.Enabled := AHabilitar;
  btnVisualizarOcorrenciaRegra.Enabled := AHabilitar;
end;

procedure TfrmSolicitacao.HabilitaOcorrenciaTecnica(AHabilitar: Boolean);
begin
  edtDataTecnica.Enabled := AHabilitar;
  edtHoraTecnica.Enabled := AHabilitar;
  EditorTecnico2.Enabled := AHabilitar;

  edtAnexoTecnico.Enabled := AHabilitar;
  btnAnexarTecnico.Enabled := AHabilitar;
  btnVisualizarTecnico.Enabled := AHabilitar;
end;

procedure TfrmSolicitacao.HabilitarBotoesAbas;
begin
  if edtCodOperGeral.Enabled = False then
  begin
    btnEditarGeral.Enabled := False;
    btnNovoGeral.Enabled := False;
    btnExcluirGeral.Enabled := False;
    btnCancelarGeral.Enabled := False;
    btnSalvarGeral.Enabled := False;
  end;

  if edtCodOperTecnico.Enabled = False then
  begin
    btnEditarTecnico.Enabled := False;
    btnNovoTecnico.Enabled := False;
    btnExcluirTecnico.Enabled := False;
    btnCancelarTecnico.Enabled := False;
    btnSalvarTecnico.Enabled := False;
  end;

  if edtCodOperAnalista.Enabled = False then
  begin
    btnNovoCrono.Enabled := False;
    btnEditarCrono.Enabled := False;
    btnSalvarCronograma.Enabled := False;
    btnExcluirCrono.Enabled := False;
    btnCancelarCrono.Enabled := False;
  end;

  if FController.Model.CDSCadastro.State = dsInsert then
  begin
    // geral
    btnEditarGeral.Enabled := True;
    btnNovoGeral.Enabled := True;
    btnExcluirGeral.Enabled := true;
    btnCancelarGeral.Enabled := False;
    btnSalvarGeral.Enabled := False;

    // Tecnico
    btnEditarTecnico.Enabled := True;
    btnNovoTecnico.Enabled := True;
    btnExcluirTecnico.Enabled := true;
    btnCancelarTecnico.Enabled := False;
    btnSalvarTecnico.Enabled := False;

    // cronograma
    btnEditarCrono.Enabled := True;
    btnNovoCrono.Enabled := True;
    btnExcluirCrono.Enabled := true;
    btnCancelarCrono.Enabled := False;
    btnSalvarCronograma.Enabled := False;
  end;
end;

constructor TfrmSolicitacao.create(APesquisar, AQuadro: Boolean);
begin
  inherited create(nil);
  Iniciar(APesquisar);
  FQuadro := AQuadro;
end;

procedure TfrmSolicitacao.btnCancelarAnalistaClick(Sender: TObject);
begin
  inherited;
//  btnEditarAnalista.Enabled := true;
  btnSalvarAnalista.Enabled := False;
  btnCancelarAnalista.Enabled := False;
  btnSalvar.Enabled := True;
end;

procedure TfrmSolicitacao.btnCancelarClick(Sender: TObject);
begin
  if FQuadro then
    Close
  else
    inherited;
end;

procedure TfrmSolicitacao.btnCancelarCronoClick(Sender: TObject);
begin
  inherited;
  FController.CancelarCronograma;
end;

procedure TfrmSolicitacao.btnExcluirCronoClick(Sender: TObject);
begin
  if dsCronograma.DataSet.RecordCount = 0 then
    raise Exception.Create('N�o h� registro para Excluir!');

  inherited;
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.ExcluirCronograma;
    FController.ModoEdicaoInsercao;
  end;
end;

procedure TfrmSolicitacao.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  PageControlsPadrao;
  edtDataInicial.SetFocus;
end;

procedure TfrmSolicitacao.btnNovoCronoClick(Sender: TObject);
begin
  inherited;
  NovoCronograma;
end;

procedure TfrmSolicitacao.btnSalvarCronogramaClick(Sender: TObject);
begin
  inherited;
  SalvarCronograma;
end;

procedure TfrmSolicitacao.btnSalvarGeralClick(Sender: TObject);
begin
  if SalvarOcorrenciaGeral then
    inherited;
  btnSalvar.Enabled := True;
end;

procedure TfrmSolicitacao.btnSalvarRegraClick(Sender: TObject);
begin
  if SalvarRegra() then
    inherited;
  btnSalvar.Enabled := True;
end;

function TfrmSolicitacao.SalvarOcorrenciaGeralQuadro: Boolean;
begin
  // se usar quadro, ja abre no modo inclusao
  if FQuadro then
    Self.Close;
  Result := FQuadro;
end;


function TfrmSolicitacao.SalvarOcorrenciaRegraItem: Boolean;
begin
  result := False;
  if (tsEdicao.Showing) and (tsOcorrenciaRegra.Showing) then
  begin
    if btnSalvarRegra.Enabled then
    begin
      btnSalvarRegra.SetFocus;
      btnSalvarRegraClick(self);
      Result := True;
    end;
  end;
end;

function TfrmSolicitacao.SalvarOcorrenciaTecnicaItem: Boolean;
begin
  result := False;
  if (tsEdicao.Showing) and (tsOcorrenciaTecnica.Showing) then
  begin
    if btnSalvarTecnico.Enabled then
    begin
      btnSalvarTecnico.SetFocus;
      btnSalvarTecnicoClick(self);
      Result := True;
    end;
  end;
end;

function TfrmSolicitacao.SalvarRegra: Boolean;
var
  bInclusao: Boolean;
begin
  if not TFuncoes.DataEmBrancoNula(FController.Model.CDSOcorrenciaRegraConsultaSOcor_Data.AsString) then
  begin
    if FController.Model.CDSOcorrenciaRegraConsultaSOcor_Data.AsDateTime < FController.Model.CDSCadastroSol_Data.AsDateTime then
      raise Exception.Create('Data da Ocorr�ncia Regra menor que Data de Abertura!');
  end;

  tsEdicaoRegra.Show;
  if FController.Model.CDSOcorrenciaRegraConsultaSOcor_Descricao.AsString.Trim = '' then
  begin
    raise Exception.Create('Informe a Descri��o!');
  end;

  try
      Result := EntrarTelaStatus();
      FController.PostOcorrenciaRegra;

      if (FQuadro) and (FOcorrenciaRegra) then
      begin
        FController.ModoEdicaoInsercao;
        btnSalvarClick(Self);
        Exit;
      end;
      if Edit3.Enabled then
        Edit3.SetFocus;
  except
    On E: Exception do
    begin
      Result := False;
      ShowMessage(E.Message);
      if edtDataRegra.Enabled then
        edtDataRegra.SetFocus;
    end;
  end;
end;

procedure TfrmSolicitacao.btnSalvarTecnicoClick(Sender: TObject);
begin
  if SalvarTecnico() then
    inherited;
  btnSalvar.Enabled := True;
end;

procedure TfrmSolicitacao.dbCronogramaDrawColumnCell(Sender: TObject; const
    Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsCronograma.DataSet, dbCronograma, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmSolicitacao.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmSolicitacao.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmSolicitacao.dbGeralDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsOcorrenciaGeral.DataSet, dbGeral, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmSolicitacao.dbGeralKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmSolicitacao.dbmDescricaoGeralEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmSolicitacao.dbmDescricaoGeralExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmSolicitacao.dbmDescricaoGeralKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);

  if Key = VK_F9 then
    BuscarObservacao(3);
end;

procedure TfrmSolicitacao.dbmDescricaoRegraEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmSolicitacao.dbmDescricaoRegraExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmSolicitacao.dbmDescricaoRegraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);

  if Key = VK_F9 then
    BuscarObservacao(5);
end;

procedure TfrmSolicitacao.dbRegrasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsOcorrenciaRegra.DataSet, dbRegras, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmSolicitacao.dbRegrasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmSolicitacao.dbStatusDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsStatus.DataSet, dbStatus, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmSolicitacao.dbStatusKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmSolicitacao.dbTecnicaCellClick(Column: TColumn);
begin
  inherited;
//  if FController.Model.CDSOcorrenciaTecnicaConsulta.RecordCount > 0 then
//    TFormatacao.CarregarMemo(EditorTecnico, FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_Descricao);
end;

procedure TfrmSolicitacao.dbTecnicaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsOcorrenciaTecnica.DataSet, dbTecnica, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmSolicitacao.dbTecnicaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmSolicitacao.dsCadStateChange(Sender: TObject);
begin
//  inherited;
  try
    btnDetalhes.Enabled := (dsCad.State in [dsEdit, dsBrowse]);
    btnEditarAnalista.Enabled := (dsCad.State in [dsBrowse]);
    btnSalvar.Enabled := (dsCad.State in [dsEdit, dsInsert]);
    btnNegrito2.Enabled := (dsCad.State in [dsEdit, dsInsert]);
//    if btnSalvar.Enabled = False then
//    begin
//      if dsCad.DataSet.State in [dsEdit, dsInsert] then
//        btnSalvar.Enabled := True;
//    end;
//
//    if (tsAnalista.Showing) and (tsAnalistaPrincipal.Showing) then
//    begin
//      btnSalvarAnalista.Enabled := (dsCad.DataSet.State in [dsEdit, dsInsert]);
//      btnSalvar.Enabled := not btnSalvarAnalista.Enabled;
//    end;

  except
//    ShowMessage('Deu erro');
  end;
end;

procedure TfrmSolicitacao.dsCronogramaStateChange(Sender: TObject);
begin
  dbCronograma.Enabled := dsCronograma.DataSet.State in [dsBrowse];
  inherited;
  btnCancelarCrono.Enabled := dsCronograma.DataSet.State in [dsEdit, dsInsert];
  btnSalvarCronograma.Enabled := dsCronograma.DataSet.State in [dsEdit, dsInsert];
  btnEditarCrono.Enabled := dsCronograma.DataSet.State in [dsBrowse];
  btnExcluirCrono.Enabled := dsCronograma.DataSet.State in [dsBrowse];
  btnNovoCrono.Enabled := dsCronograma.DataSet.State in [dsBrowse];

  btnCancelarCrono.Enabled := (dsCronograma.DataSet.State in [dsEdit, dsInsert]);
  if dsCronograma.DataSet.State in [dsEdit, dsInsert] then
    FController.ModoEdicaoInsercao;

  ControleBotaoSalvar();
end;

procedure TfrmSolicitacao.dsOcorrenciaGeralStateChange(Sender: TObject);
begin
  dbGeral.Enabled := (dsOcorrenciaGeral.State = dsBrowse);
  if dbmDescricaoGeral.Enabled then
  begin
    inherited;
    btnCancelarGeral.Enabled := dsOcorrenciaGeral.DataSet.State in [dsEdit, dsInsert];
    btnSalvarGeral.Enabled := dsOcorrenciaGeral.DataSet.State in [dsEdit, dsInsert];
    btnEditarGeral.Enabled := dsOcorrenciaGeral.DataSet.State in [dsBrowse];
    btnExcluirGeral.Enabled := dsOcorrenciaGeral.DataSet.State in [dsBrowse];
    btnNovoGeral.Enabled := dsOcorrenciaGeral.DataSet.State in [dsBrowse];

    if dsOcorrenciaGeral.State in [dsEdit, dsInsert] then
      FController.ModoEdicaoInsercao;

    ControleBotaoSalvar();
  end;
end;

procedure TfrmSolicitacao.dsOcorrenciaRegraStateChange(Sender: TObject);
begin
  dbRegras.Enabled := not (dsOcorrenciaRegra.State in [dsEdit, dsInsert]);
  inherited;
  btnCancelarRegra.Enabled := dsOcorrenciaRegra.DataSet.State in [dsEdit, dsInsert];
  btnSalvarRegra.Enabled := dsOcorrenciaRegra.DataSet.State in [dsEdit, dsInsert];
  btnEditarRegra.Enabled := dsOcorrenciaRegra.DataSet.State in [dsBrowse];
  btnExcluirRegra.Enabled := dsOcorrenciaRegra.DataSet.State in [dsBrowse];
  btnNovoRegra.Enabled := dsOcorrenciaRegra.DataSet.State in [dsBrowse];
  dbRegras.Enabled := dsOcorrenciaRegra.DataSet.State in [dsBrowse];

  if dsOcorrenciaRegra.State in [dsEdit, dsInsert] then
    FController.ModoEdicaoInsercao;

  ControleBotaoSalvar();
end;

procedure TfrmSolicitacao.dsOcorrenciaTecnicaStateChange(Sender: TObject);
begin
  dbTecnica.Enabled := not (dsOcorrenciaTecnica.State in [dsEdit, dsInsert]);
  btnFormatarTecnico.Enabled := (dsOcorrenciaTecnica.State in [dsEdit, dsInsert]);
  inherited;
  btnCancelarTecnico.Enabled := dsOcorrenciaTecnica.DataSet.State in [dsEdit, dsInsert];
  btnSalvarTecnico.Enabled := dsOcorrenciaTecnica.DataSet.State in [dsEdit, dsInsert];
  btnEditarTecnico.Enabled := dsOcorrenciaTecnica.DataSet.State in [dsBrowse];
  btnExcluirTecnico.Enabled := dsOcorrenciaTecnica.DataSet.State in [dsBrowse];
  btnNovoTecnico.Enabled := dsOcorrenciaTecnica.DataSet.State in [dsBrowse];
  dbTecnica.Enabled := dsOcorrenciaTecnica.DataSet.State in [dsBrowse];

  if dsOcorrenciaTecnica.State in [dsEdit, dsInsert] then
    FController.ModoEdicaoInsercao;

  ControleBotaoSalvar();
end;

procedure TfrmSolicitacao.EditarAnalista;
begin
  if (tsAnalista.Showing) and (tsAnalistaPrincipal.Showing) then
  begin
    if btnEditarAnalista.Enabled then
      btnEditarAnalistaClick(Self);
  end;
end;

procedure TfrmSolicitacao.EditarCronograma;
begin
  if (tsEdicao.Showing) and (tsCronograma.Showing) and (btnEditarCrono.Enabled) then
    btnEditarCronoClick(Self);
end;

procedure TfrmSolicitacao.EditarOcorrenciaGeral;
begin
  if (tsEdicao.Showing) and (tsOcorrenciaGeral.Showing) and (btnEditarGeral.Enabled) then
    btnEditarGeralClick(Self);
end;

procedure TfrmSolicitacao.EditarOcorrenciaTecnica;
begin
  if (tsEdicao.Showing) and (tsOcorrenciaTecnica.Showing) and (btnEditarTecnico.Enabled) then
    btnEditarTecnicoClick(Self);
end;

procedure TfrmSolicitacao.EditarRegra;
begin
  if (tsEdicao.Showing) and (tsOcorrenciaRegra.Showing) and (btnEditarRegra.Enabled) then
    btnEditarRegraClick(Self);
end;

procedure TfrmSolicitacao.EditorAberturaChange(Sender: TObject);
begin
  inherited;
//  if tsDescricaoAbertura.Showing then
//  begin
//    FController.ModoEdicaoInsercao;
//    btnSalvar.Enabled := True;
//  end;

end;

procedure TfrmSolicitacao.EditorAnalista2Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmSolicitacao.EditorAnalista2Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmSolicitacao.EditorAnalista2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);

  if Key = VK_F9 then
  begin
    if Sender = dbmDescricaoAbertura then
      BuscarObservacao(1)
    else if Sender = EditorAnalista2 then
      BuscarObservacao(2);
  end;
end;

procedure TfrmSolicitacao.EditorTecnico2Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmSolicitacao.EditorTecnico2Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmSolicitacao.EditorTecnico2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);
  if Key = VK_F9 then
    BuscarObservacao(4);
end;

procedure TfrmSolicitacao.edtAnexoOcorrenciaKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SalvarOcorrenciaGeral;
end;

procedure TfrmSolicitacao.edtAnexoOcorrenciaRegraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SalvarRegra();
end;

procedure TfrmSolicitacao.edtAnexoTecnicoKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SalvarTecnico;
end;

procedure TfrmSolicitacao.edtCodAberturaExit(Sender: TObject);
begin
  inherited;
  if edtCodAbertura.Modified then
    BuscarUsuario(0, StrToIntDef(edtCodAbertura.Text, 0));
end;

procedure TfrmSolicitacao.edtCodAnalistaExit(Sender: TObject);
begin
  inherited;
  if edtCodAnalista.Modified then
    BuscarAnalista(0, StrToIntDef(edtCodAnalista.Text, 0));
end;

procedure TfrmSolicitacao.edtCodCategoriaExit(Sender: TObject);
begin
  inherited;
  if edtCodCategoria.Modified then
    BuscarCategoria(0, StrToIntDef(edtCodCategoria.Text, 0));
end;

procedure TfrmSolicitacao.edtCodClienteExit(Sender: TObject);
begin
  inherited;
  if edtCodCliente.Modified then
    BuscarCliente(0, StrToIntDef(edtCodCliente.Text, 0));
end;

procedure TfrmSolicitacao.edtCodClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
  begin
    if Sender = edtCodCliente then
      btnClienteClick(Self)
    else if Sender = edtCodModulo then
      btnModuloClick(Self)
    else if Sender = edtCodAnalista then
      btnAnalistaClick(Self)
//    else if Sender = edtCodTipo then
//      btnTipoClick(Self)
    else if Sender = edtCodDesenv then
      btnDesenvClick(Self)
    else if Sender = edtCodOperAnalista then
      btnOperAnalistaClick(Self)
    else if Sender = edtCodTipoGeral then
      btnTipoGeralClick(Self)
    else if Sender = edtCodModulo2 then
      btnModulo2Click(Self)
    else if Sender = edtCodCategoria then
      btnCategoriaClick(Self);
  end;
end;

procedure TfrmSolicitacao.edtCodDesenvExit(Sender: TObject);
begin
  inherited;
  if edtCodDesenv.Modified then
    BuscarDesenvolvedorTipo(0, StrToIntDef(edtCodDesenv.Text, 0));
end;

procedure TfrmSolicitacao.edtCodModulo2Exit(Sender: TObject);
begin
  inherited;
  if edtCodModulo2.Modified then
    BuscarModulo(0, StrToIntDef(edtCodModulo2.Text, 0));

end;

procedure TfrmSolicitacao.edtCodModuloExit(Sender: TObject);
begin
  inherited;
  if edtCodModulo.Modified then
    BuscarModulo(0, StrToIntDef(edtCodModulo.Text, 0));
end;

procedure TfrmSolicitacao.edtCodOperAnalistaExit(Sender: TObject);
begin
  inherited;
  if edtCodOperAnalista.Modified then
    BuscarOperadorAnalista(0, StrToIntDef(edtCodOperAnalista.Text, 0));
end;

procedure TfrmSolicitacao.edtCodProdutoExit(Sender: TObject);
begin
  inherited;
  if edtCodProduto.Modified then
    BuscarProduto(0, StrToIntDef(edtCodProduto.Text,0));
end;

procedure TfrmSolicitacao.edtCodTipoAberturaExit(Sender: TObject);
begin
  inherited;
  if edtCodTipoAbertura.Modified then
    BuscarTipoAbertura(0, StrToIntDef(edtCodTipoAbertura.Text, 0));
end;

procedure TfrmSolicitacao.edtCodTipoAberturaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnTipoAberturaClick(Self);
end;

procedure TfrmSolicitacao.edtCodTipoAnaliseExit(Sender: TObject);
begin
  inherited;
  if edtCodTipoAnalise.Modified then
    BuscarTipoAbertura(0, StrToIntDef(edtCodTipoAnalise.Text, 0));
end;

procedure TfrmSolicitacao.edtCodTipoGeralExit(Sender: TObject);
begin
  inherited;
  if edtCodTipoGeral.Modified then
    BuscarTipoGeral(0, StrToIntDef(edtCodTipoGeral.Text, 0));
end;

procedure TfrmSolicitacao.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmSolicitacao.edtHoraFimKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    SalvarCronograma;
    if edtIdOperadorAnalista.Enabled then
      edtIdOperadorAnalista.SetFocus;
  end;
end;

procedure TfrmSolicitacao.edtIdFiltroExit(Sender: TObject);
begin
  inherited;
  if edtIdFiltro.Modified then
  begin
    edtIdFiltro.Text := FormatFloat('000000', StrToFloatDef(edtIdFiltro.Text, 0));
    edtIdFiltro.Modified := False;
  end;
end;

procedure TfrmSolicitacao.edtVersaoExit(Sender: TObject);
begin
  inherited;
  if edtVersao.Modified then
  begin
    if StrToIntDef(edtVersao.Text, 0) = 0 then
    begin
      FController.ModoEdicaoInsercao;
      FController.Model.CDSCadastroSol_VersaoId.Clear;
      FController.Model.CDSCadastroVer_Versao.Clear;
      Exit;
    end;

    BuscarVersao(StrToIntDef(edtVersao.Text, 0));
  end;
end;

procedure TfrmSolicitacao.edtVersaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnVersaoClick(Self);
end;

function TfrmSolicitacao.EntrarTelaStatus: Boolean;
var
  form: TfrmStatusTroca;
  bOk: Boolean;
begin
  bOk := False;
  form := TfrmStatusTroca.Create(prSolicitacao);
  try
    if form.ShowModal = mrOk then
    begin
      if FController.Model.CDSCadastroSol_Status.AsString <> form.edtIdStatus.Text then
      begin
//        if FController.Model.CDSCadastroSol_UsuarioAtendeAtual.AsInteger = dm.IdUsuario then
          FinalizarTempo(FController.Model.CDSCadastroSol_UsuarioAtendeAtual.AsInteger);
      end;

      FController.ModoEdicaoInsercao();
      FController.Model.CDSCadastroSol_Status.AsString  := form.edtIdStatus.Text;
      FController.Model.CDSCadastroSta_Codigo.AsString  := form.edtCodStatus.Text;
      FController.Model.CDSCadastroSta_Nome.AsString    := form.edtNome.Text;
      bOk := True;
    end;
  finally
    FreeAndNil(form);
  end;
  Result := bOk;
end;

procedure TfrmSolicitacao.EnviarEmail1Click(Sender: TObject);
begin
  inherited;
  if FController.Model.CDSConsulta.IsEmpty then
    raise Exception.Create('N�o h� Itens!');

  if TFuncoes.Confirmar('Confirmar o envio de email?') then
  begin
    EnvioEmail(FController.Model.CDSConsultaSol_Id.AsInteger,
               FController.Model.CDSConsultaSol_Status.AsInteger);
  end;
end;

procedure TfrmSolicitacao.EnvioEmail(AIdSolicitacao, AIdStatus: Integer);
var
  objEmailSolicitacao: TEmailSolicitacao;
  sEmail: string;
  sEmailCliente: string;
  objContaEmail: TContaEmailController;
begin
  if TFuncoes.ModoDesenvolvimento() then
    Exit;

  objContaEmail := TContaEmailController.Create;
  objEmailSolicitacao := TEmailSolicitacao.Create;
  try
    sEmail := objEmailSolicitacao.RetornarListaEmail(AIdSolicitacao,
                                                     DM.IdUsuario,
                                                     AIdStatus);

    sEmailCliente := objEmailSolicitacao.RetornarListaEmailCliente(AIdSolicitacao);

    if sEmailCliente = '' then
      sEmailCliente := sEmail;

    if sEmailCliente <> '' then
    begin
      objContaEmail.EnviarEmail(DM.IdUsuario,
                                sEmailCliente,
                                sEmail,
                                objEmailSolicitacao.RetornarAssunto(AIdSolicitacao),
                                objEmailSolicitacao.TextoEmailSolicitacao(AIdSolicitacao),
                                '');
    end;
  finally
    FreeAndNil(objContaEmail);
    FreeAndNil(objEmailSolicitacao);
  end;
end;

procedure TfrmSolicitacao.ExcluirCronograma;
begin
  if (tsEdicao.Showing) and (tsAnalista.Showing) and (tsCronograma.Showing) then
  begin
    if btnExcluirCrono.Enabled then
      btnExcluirCronoClick(Self);
  end;
end;

procedure TfrmSolicitacao.ExcluirGeral;
begin
  if (tsEdicao.Showing) and (tsOcorrenciaGeral.Showing) then
  begin
    if btnExcluirGeral.Enabled then
    begin
      if btnExcluirGeral.Enabled then
        btnExcluirGeralClick(Self);
    end;
  end;
end;

procedure TfrmSolicitacao.ExcluirRegra;
begin
  if (tsEdicao.Showing) and (tsOcorrenciaRegra.Showing) then
  begin
    if btnExcluirRegra.Enabled then
      btnExcluirRegraClick(Self);
  end;
end;

procedure TfrmSolicitacao.ExcluirTecnico;
begin
  if (tsEdicao.Showing) and (tsOcorrenciaTecnica.Showing) then
  begin
    if btnExcluirTecnico.Enabled then
      btnExcluirTecnicoClick(Self);
  end;
end;

function TfrmSolicitacao.FiltroRelatorio: TFiltroSolicitacao;
var
  Filtro: TFiltroSolicitacao;
begin
  Filtro := TFiltroSolicitacao.Create;
  Filtro.DataInicial := edtDataInicial.Text;
  Filtro.DataFinal := edtDataFinal.Text;
  Filtro.IdUsuarioAbertura := FraUsuario.RetornoSelecao();
  Filtro.IdCliente := FraCliente.RetornoSelecao();
  Filtro.IdModulo := FraModulo.RetornoSelecao();
  Filtro.IdAnalista := FraAnalista.RetornoSelecao();
  Filtro.IdTipo := FraTipo.RetornoSelecao();
  Filtro.IdDesenvolvedor := FraDesenvolvedor.RetornoSelecao();
  Filtro.IdOperador := FraOperador.RetornoSelecao();
  Filtro.IdStatus := FraStatus.RetornoSelecao();
  Filtro.Cliente.IdUsuario := FraColaborador.RetornoSelecao();
  Filtro.Nivel := cbbNivel.ItemIndex + 1;
  Filtro.idVersao := FraVersao.RetornoSelecao();
  Filtro.IdCategoria := FraCategoria.RetornoSelecao();

  Filtro.Id := StrToIntDef(edtIdFiltro.Text, 0);

  Result := Filtro;
end;

procedure TfrmSolicitacao.FinalizarTempo(AIdUsuario: Integer);
var
  objVO: TSolicitacaoTempoVO;
begin
  objVO := TSolicitacaoTempoVO.Create;
  try
    objVO.IdSolicitacao := FController.Model.CDSCadastroSol_Id.AsInteger;
    objVO.IdUsuario     := FController.Model.CDSCadastroSol_UsuarioAtendeAtual.AsInteger;
    FController.Finalizar(AIdUsuario, objVO, False);
  finally
    FreeAndNil(objVO);
  end;
end;

procedure TfrmSolicitacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(FController) then
    FreeAndNil(FController);
end;

procedure TfrmSolicitacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if CancelarOcorrenciaGeral then
      Exit;

    if CancelarOcorrenciaTecnico then
      Exit;

    if CancelarOcorrenciaRegra then
      Exit;

    if CancelarCronograma then
      Exit;

    if CancelarAnalista() then
      Exit;

  end;

  if Key = VK_F8 then
  begin
    if SalvarCronogramaItem() then
      Exit;

    if SalvarOcorrenciaGeralItem() then
      Exit;

    if SalvarOcorrenciaTecnicaItem() then
      Exit;

    if SalvarOcorrenciaRegraItem() then
      Exit;

    if SalvarAnalista() then
      Exit;
  end;

  if not FQuadro then
    inherited;

  TeclasAtalho(Key, Shift);
end;

procedure TfrmSolicitacao.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
  iPosicao: integer;
  Botao: TPosicaoBotao;
  PermissaoSolicitacao: TPermissaoSolicitacaoVO;
begin
  inherited;
  Edit1.SendToBack;
  Edit2.SendToBack;
  Edit3.SendToBack;
  edtIdOperadorAnalista.SendToBack;
  pgcAnalista.ActivePageIndex := 0;

//  PageControl1.TabIndex := 0;
//  PageControl2.TabIndex := 0;

  Img := TfrmImagens.Create(Self);
  try
    btnCliente.Glyph := Img.btnProcurar.Glyph;
    btnModulo.Glyph := Img.btnProcurar.Glyph;
    btnAnalista.Glyph := Img.btnProcurar.Glyph;
    btnTipoAbertura.Glyph := Img.btnProcurar.Glyph;
    btnTipoAnalise.Glyph := Img.btnProcurar.Glyph;
    btnModulo2.Glyph := Img.btnProcurar.Glyph;
    btnVersao.Glyph := Img.btnProcurar.Glyph;
    btnCategoria.Glyph := Img.btnProcurar.Glyph;

//    btnTipo.Glyph := Img.btnProcurar.Glyph;
    btnDesenv.Glyph := Img.btnProcurar.Glyph;
    btnOperAnalista.Glyph := Img.btnProcurar.Glyph;
    btnAnexar.Glyph := Img.btnAnexar.Glyph;
    btnVisualizar.Glyph := Img.btnExportar.Glyph;
    btnTipoGeral.Glyph := Img.btnProcurar.Glyph;

    btnNovoCrono.Glyph := Img.btnNovoItem.Glyph;
    btnEditarCrono.Glyph := Img.btnEditar.Glyph;
    btnExcluirCrono.Glyph := Img.btnExcluirItem.Glyph;
    btnCancelarCrono.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarCronograma.Glyph := Img.btnSalvar.Glyph;

    btnNovoGeral.Glyph := Img.btnNovoItem.Glyph;
    btnEditarGeral.Glyph := Img.btnEditar.Glyph;
    btnExcluirGeral.Glyph := Img.btnExcluirItem.Glyph;
    btnCancelarGeral.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarGeral.Glyph := Img.btnSalvar.Glyph;

    btnNovoTecnico.Glyph := Img.btnNovoItem.Glyph;
    btnEditarTecnico.Glyph := Img.btnEditar.Glyph;
    btnExcluirTecnico.Glyph := Img.btnExcluirItem.Glyph;
    btnCancelarTecnico.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarTecnico.Glyph := Img.btnSalvar.Glyph;

    btnNovoRegra.Glyph := Img.btnNovoItem.Glyph;
    btnEditarRegra.Glyph := Img.btnEditar.Glyph;
    btnExcluirRegra.Glyph := Img.btnExcluirItem.Glyph;
    btnCancelarRegra.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarRegra.Glyph := Img.btnSalvar.Glyph;

    btnAnexarRegra.Glyph := Img.btnAnexar.Glyph;
    btnVisualizarOcorrenciaRegra.Glyph := Img.btnExportar.Glyph;

    btnAnexarOcor.Glyph := Img.btnAnexar.Glyph;
    btnVisualizarOcor.Glyph := Img.btnExportar.Glyph;

    btnAnexarTecnico.Glyph := Img.btnAnexar.Glyph;
    btnVisualizarTecnico.Glyph := Img.btnExportar.Glyph;
    btnDetalhes.Glyph := Img.btnDetalhe.Glyph;
    btnDetalhes2.Glyph := Img.btnDetalhe.Glyph;
    btnBuscarCliente.Glyph := Img.btnFiltro.Glyph;

    btnEditarAnalista.Glyph := Img.btnEditar.Glyph;
    btnCancelarAnalista.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarAnalista.Glyph := Img.btnSalvar.Glyph;

    btnAnexo.Glyph := Img.btnExportar.Glyph;
    btnListarAnexo2.Glyph := Img.btnExportar.Glyph;

  finally
    FreeAndNil(Img);
  end;

  try
    PermissaoSolicitacao := FController.PermissoesSolicitacao(dm.IdUsuario);
    tsAbertura.TabVisible := PermissaoSolicitacao.Abertura;
    tsDescricaoAbertura.TabVisible := tsAbertura.TabVisible;
    tsAnalista.TabVisible := PermissaoSolicitacao.Analise;
    tsOcorrenciaGeral.TabVisible := PermissaoSolicitacao.OcorrenciaGeral;
    tsOcorrenciaTecnica.TabVisible := PermissaoSolicitacao.OcorrenciaTecnica;
    tsOcorrenciaRegra.TabVisible := PermissaoSolicitacao.OcorrenciaRegra;
    tsStatus.TabVisible := PermissaoSolicitacao.StatusSolicitacao;
    pmTempo.Visible := PermissaoSolicitacao.Tempo;
  finally
    FreeAndNil(PermissaoSolicitacao);
  end;

//  tsAbertura.TabVisible := FController.PermissaoAbertura(dm.IdUsuario);
//  tsDescricaoAbertura.TabVisible := tsAbertura.TabVisible;
//  tsAnalista.TabVisible := FController.PermissaoAnalise(dm.IdUsuario);
//  tsOcorrenciaGeral.TabVisible := FController.PermissaoOcorrenciaGeral(dm.IdUsuario);
//  tsOcorrenciaTecnica.TabVisible := FController.PermissaoOcorrenciaTecnica(dm.IdUsuario);
//  tsOcorrenciaRegra.TabVisible := FController.PermissaoOcorrenciaRegra(DM.IdUsuario);
//  tsStatus.TabVisible := FController.PermissaoStatus(dm.IdUsuario);
//  pmTempo.Visible := FController.SolicitacaoTempoPermissao(dm.IdUsuario);

  pmConferenciaTempo.Visible := pmTempo.Visible;

  iPosicao := 517;
  Botao := TPosicaoBotao.Create(btnNovoGeral, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnEditarGeral);
    Botao.PosicaoBotao(btnSalvarGeral);
    Botao.PosicaoBotao(btnExcluirGeral);
    Botao.PosicaoBotao(btnCancelarGeral);
  finally
    FreeAndNil(Botao);
  end;

  Botao := TPosicaoBotao.Create(btnNovoTecnico, iPosicao, 500);
  try
    Botao.PosicaoBotao(btnEditarTecnico);
    Botao.PosicaoBotao(btnSalvarTecnico);
    Botao.PosicaoBotao(btnExcluirTecnico);
    Botao.PosicaoBotao(btnCancelarTecnico);
  finally
    FreeAndNil(Botao);
  end;

  Botao := TPosicaoBotao.Create(btnNovoRegra, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnEditarRegra);
    Botao.PosicaoBotao(btnSalvarRegra);
    Botao.PosicaoBotao(btnExcluirRegra);
    Botao.PosicaoBotao(btnCancelarRegra);
  finally
    FreeAndNil(Botao);
  end;

  iPosicao := 517;
  Botao := TPosicaoBotao.Create(btnNovoCrono, iPosicao, 469);
  try
    Botao.PosicaoBotao(btnEditarCrono);
    Botao.PosicaoBotao(btnSalvarCronograma);
    Botao.PosicaoBotao(btnExcluirCrono);
    Botao.PosicaoBotao(btnCancelarCrono);
  finally
    FreeAndNil(Botao);
  end;

//------------------------------------------------------------------------------
// Pesquisa
  iPosicao := 6;
  Botao := TPosicaoBotao.Create(btnPrimeiro, iPosicao, 6, True);
  try
    Botao.PosicaoBotaoNavegacao(btnAnterior);
    Botao.PosicaoBotaoNavegacao(btnProximo);
    Botao.PosicaoBotaoNavegacao(btnUltimo);
    Botao.PosicaoBotao(btnNovo);
    Botao.PosicaoBotao(btnEditar);
    Botao.PosicaoBotao(btnExcluir);
    Botao.PosicaoBotao(btnFiltrar);
    Botao.PosicaoBotao(btnDetalhes2);
    Botao.PosicaoBotao(btnAnexo);
    Botao.PosicaoBotao(btnSair);
  finally
    FreeAndNil(Botao);
  end;
//------------------------------------------------------------------------------
// edicao
  iPosicao := 6;
  Botao := TPosicaoBotao.Create(btnSalvar, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnCancelar);
    Botao.PosicaoBotao(btnDetalhes);
    Botao.PosicaoBotao(btnBuscarCliente);
    Botao.PosicaoBotao(btnListarAnexo2);
  finally
    FreeAndNil(Botao);
  end;
//------------------------------------------------------------------------------
// filtro
  iPosicao := 6;
  Botao := TPosicaoBotao.Create(btnFiltro, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnImprimir);
    Botao.PosicaoBotao(btnFecharFiltro);
  finally
    FreeAndNil(Botao);
  end;

  EntrarSolicitacaoQuadro;
  tsFiltroOperador.TabVisible := False;

  if FEditar then
    btnEditarClick(Self);

  CaminhoAnexo();
  MostrarAnexo();
end;

procedure TfrmSolicitacao.FraStatusbtnProcClick(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prSolicitacao;
  FraStatus.btnProcClick(Sender);

end;

procedure TfrmSolicitacao.FraStatusedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prSolicitacao;
end;

procedure TfrmSolicitacao.FraTipobtnProcClick(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prSolicitacao;
  FraTipo.btnProcClick(Sender);
end;

procedure TfrmSolicitacao.FraTipoedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prSolicitacao;
end;

procedure TfrmSolicitacao.Iniciar(APesquisar: boolean);
begin
  lblSolicitacaoTecnica.Caption := '';
  FController := TSolicitacaoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;
  dsOcorrenciaGeral.DataSet := FController.Model.CDSOcorrenciaGeralConsulta;
  dsOcorrenciaTecnica.DataSet := FController.Model.CDSOcorrenciaTecnicaConsulta;
  dsOcorrenciaRegra.DataSet := FController.Model.CDSOcorrenciaRegraConsulta;
  dsCronograma.DataSet := FController.Model.CDSCronogramaConsulta;
  dsStatus.DataSet := FController.Model.CDSStatusConsulta;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  cbbCampos.ItemIndex := 6;

  Localizar('ABCDE'); // para trazer vazio
  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
  FraUsuario.Inicializar();
  FraCliente.Inicializar();
  FraStatus.Inicializar();
  FraModulo.Inicializar();
  FraAnalista.Inicializar();
  FraTipo.Inicializar();
  FraDesenvolvedor.Inicializar();
  FraOperador.Inicializar();
  FraColaborador.Inicializar();
  FraVersao.Inicializar();
  FraCategoria.Inicializar();
  FOcorrenciaGeral := False;
  FOcorrenciaTecnica := False;
  FOcorrenciaRegra := False;
  FEditar := False;
end;

procedure TfrmSolicitacao.LiberarAnalista;
var
  Usuario: TUsuarioController;
  bUsuarioADM: Boolean;
begin
  Usuario := TUsuarioController.Create;
  try
    bUsuarioADM := Usuario.UsuarioADM(dm.IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  if (FController.Model.CDSCadastroSol_Analista.AsInteger = dm.IdUsuario) or
     (FController.Model.CDSCadastroSol_Analista.AsInteger = 0) or
     (bUsuarioADM = true) then
  begin
    edtCodAnalista.Enabled := True;
    edtNomeAnalista.Enabled := True;
    btnAnalista.Enabled := True;
    edtTempoPrevisto.Enabled := True;
    edtPrevisaoEntrega.Enabled := True;

    edtCodDesenv.Enabled := True;
    edtNomeDesenvolvedor.Enabled := True;
    btnDesenv.Enabled := True;

    edtVersao.Enabled := True;
    edtNomeVersao.Enabled := True;
    btnVersao.Enabled := True;

    edtCodTipoAnalise.Enabled := True;
    edtNomeTipoAnalise.Enabled := True;
    btnTipoAnalise.Enabled := True;

    edtCodModulo2.Enabled := True;
    edtNomeModulo2.Enabled := True;
    btnModulo2.Enabled := True;
    EditorAnalista2.Enabled := True;

    btnEditarAnalista.Enabled := True;

    edtCodOperAnalista.Enabled := True;
    btnOperAnalista.Enabled := True;

    edtDataPrevCrono.Enabled := True;
    edtHoraIniCrono.Enabled := True;
    edtHoraFim.Enabled := True;

    btnNovoCrono.Enabled := True;
    btnEditarCrono.Enabled := True;
    btnExcluirCrono.Enabled := True;

    edtCodCategoria.Enabled := True;
    edtNomeCategoria.Enabled := True;
    btnCategoria.Enabled := True;
    edtTituloAnal.Enabled := True;
  end;
end;

procedure TfrmSolicitacao.ListarAnexos(AIdSolicitacao: Integer);
var
  Formulario: TfrmListaAnexos;
begin
  if AIdSolicitacao = 0 then
    raise Exception.Create('N�o h� Registros!');

  Formulario := TfrmListaAnexos.create(FController.Model.CDSConsultaSol_Id.AsInteger, tpSolicitacao);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmSolicitacao.Localizar(ATexto: string);
var
  sCampo: string;
  bContem: Boolean;
  Filtro: TFiltroSolicitacao;
begin
//  inherited;
  try
//    Filtro := TFiltroSolicitacao.Create;
    Filtro := FiltroRelatorio();
//    Filtro.DataInicial := edtDataInicial.Text;
//    Filtro.DataFinal := edtDataFinal.Text;
//    Filtro.IdUsuarioAbertura := FraUsuario.RetornoSelecao();
//    Filtro.IdCliente := FraCliente.RetornoSelecao();
//    Filtro.IdModulo := FraModulo.RetornoSelecao();
//    Filtro.IdAnalista := FraAnalista.RetornoSelecao();
//    Filtro.IdTipo := FraTipo.RetornoSelecao();
//    Filtro.IdDesenvolvedor := FraDesenvolvedor.RetornoSelecao();
//    Filtro.IdOperador := FraOperador.RetornoSelecao();
//    Filtro.IdStatus := FraStatus.RetornoSelecao();
//    Filtro.Cliente.IdUsuario := FraColaborador.RetornoSelecao();
//
//    Filtro.Nivel := cbbNivel.ItemIndex + 1;

    sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
    bContem := (cbbPesquisa.ItemIndex = 1);

    FController.FiltrarSolicitacao(Filtro, sCampo, ATexto, dm.IdUsuario, bContem);
    FController.Model.CDSConsulta.IndexFieldNames := sCampo;
  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmSolicitacao.MensagemData;
begin
  lblMensagem.Visible := TFuncoes.MostrarDescricaoPesquisaData(cbbCampos.Text);
end;

procedure TfrmSolicitacao.MostrarAnexo;
var
  Departamento: TDepartamentoController;
  bResultado: Boolean;
begin
  Departamento := TDepartamentoController.Create;
  try
    bResultado := Departamento.MostrarAnexos();
    Label14.Visible := bResultado;
    edtNomeArquivo.Visible := bResultado;
    btnAnexar.Visible := bResultado;
    btnVisualizar.Visible := bResultado;

    Label32.Visible := bResultado;
    edtAnexoOcorrencia.Visible := bResultado;
    btnAnexarOcor.Visible := bResultado;
    btnVisualizarOcor.Visible := bResultado;
    btnListarAnexo2.Visible := bResultado;

    Label34.Visible := bResultado;
    edtAnexoTecnico.Visible := bResultado;
    btnAnexarTecnico.Visible := bResultado;
    btnVisualizarTecnico.Visible := bResultado;

    Label49.Visible := bResultado;
    edtAnexoOcorrenciaRegra.Visible := bResultado;
    btnAnexarRegra.Visible := bResultado;
    btnVisualizarOcorrenciaRegra.Visible := bResultado;

    btnAnexo.Visible := bResultado;
  finally
    FreeAndNil(Departamento);
  end;
end;

procedure TfrmSolicitacao.NovaRegra;
begin
  if btnNovoRegra.Enabled = False then
    Exit;

  if (tsEdicao.Showing) and (tsOcorrenciaRegra.Showing) then
  begin
    if FController.Model.CDSOcorrenciaRegraConsulta.State <> dsBrowse then
      Exit;

    HabilitaOcorrenciaRegra(True);
    tsEdicaoRegra.Show;
//    EditorTecnico.Clear;
    FController.Model.CDSOcorrenciaRegraConsulta.Last;
    if edtDataRegra.Enabled then
      edtDataRegra.SetFocus;
    FController.Model.CDSOcorrenciaRegraConsulta.Append;

    OcorrenciaRegra();
  end;
end;

procedure TfrmSolicitacao.NovaSolicitacaoOcorrencia;
begin
  if (FOcorrenciaGeral) or (FOcorrenciaTecnica) or (FAnalise) or (FOcorrenciaRegra) then
  begin
    if FAnalise then
      btnEditarAnalistaClick(Self);
  end;
end;

procedure TfrmSolicitacao.NovaSolicitacaoQuadro;
var
  Status: TStatusController;
  sCodigo: string;
begin
  Status := TStatusController.Create;
  try
    sCodigo := FController.StatusAbertura();

    try
      Status.LocalizarCodigo(StrToIntDef(sCodigo, 0));

      if Status.Model.CDSCadastroSta_Id.AsInteger = 0 then
        raise Exception.Create('Informe o Status para abertura do chamado nos Par�metros do Sistema!');

      FController.Model.CDSCadastroSol_Status.AsString := Status.Model.CDSCadastroSta_Id.AsString;
      FController.Model.CDSCadastroSta_Codigo.AsString := Status.Model.CDSCadastroSta_Codigo.AsString;
      FController.Model.CDSCadastroSta_Nome.AsString := Status.Model.CDSCadastroSta_Nome.AsString;
//
//      edtCodStatus.ReadOnly := True;
//      edtCodStatus.Color := clSilver;
//      edtCodStatus.TabStop := False;
    except
      ON E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FreeAndNil(Status);
  end;
end;

procedure TfrmSolicitacao.NovoCronograma;
begin
  if (tsAnalista.Showing) and (tsCronograma.Showing) then
  begin
    if btnNovoCrono.Enabled then
    begin
      FController.Model.CDSCronogramaConsulta.Last;
      if edtCodOperAnalista.Enabled then
        edtCodOperAnalista.SetFocus;
      FController.Model.CDSCronogramaConsulta.Append;
    end;
  end;
end;

procedure TfrmSolicitacao.NovoGeral;
begin
  if btnNovoGeral.Enabled = False then
    Exit;

  if (tsEdicao.Showing) and (tsOcorrenciaGeral.Showing) then
  begin
    if FController.Model.CDSOcorrenciaGeralConsulta.State <> dsBrowse then
      Exit;

//    if edtDataGeral.Enabled = False then
//      Exit;

    HabilitaOcorrenciaGeral(True);

    tsEdicaoGeral.Show;

    FController.Model.CDSOcorrenciaGeralConsulta.Last;
    if edtDataGeral.Enabled then
      edtDataGeral.SetFocus;
    FController.Model.CDSOcorrenciaGeralConsulta.Append;

    UsuarioGeral;
  end;
end;

procedure TfrmSolicitacao.NovoTecnico;
begin
  if btnNovoTecnico.Enabled = False then
    Exit;

  if (tsEdicao.Showing) and (tsOcorrenciaTecnica.Showing) then
  begin
    if FController.Model.CDSOcorrenciaTecnicaConsulta.State <> dsBrowse then
      Exit;

//    if edtDataTecnica.Enabled = False then
//      Exit;

    HabilitaOcorrenciaTecnica(True);
    tsEdicaoTecnica.Show;
//    EditorTecnico.Clear;
    FController.Model.CDSOcorrenciaTecnicaConsulta.Last;
    if edtDataTecnica.Enabled then
      edtDataTecnica.SetFocus;
    FController.Model.CDSOcorrenciaTecnicaConsulta.Append;

    OcorrenciaTecnica;
  end;
end;

procedure TfrmSolicitacao.OcorrenciaRegra;
var
  Usuario: TUsuarioController;
begin
  Usuario := TUsuarioController.Create;
  try
    Usuario.LocalizarId(DM.IdUsuario);
    FController.Model.CDSOcorrenciaRegraConsultaSOcor_UsuarioOperacional.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
    FController.Model.CDSOcorrenciaRegraConsultaUsu_Codigo.AsInteger := Usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
    FController.Model.CDSOcorrenciaRegraConsultaUsu_Nome.AsString := Usuario.Model.CDSCadastroUsu_Nome.AsString;
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmSolicitacao.OcorrenciaTecnica;
var
  Usuario: TUsuarioController;
begin
  Usuario := TUsuarioController.Create;
  try
    Usuario.LocalizarId(DM.IdUsuario);
    FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_UsuarioOperacional.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
    FController.Model.CDSOcorrenciaTecnicaConsultaUsu_Codigo.AsInteger := Usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
    FController.Model.CDSOcorrenciaTecnicaConsultaUsu_Nome.AsString := Usuario.Model.CDSCadastroUsu_Nome.AsString;
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmSolicitacao.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage <> tsAnalista then
  begin
      TFuncoes.ControleGuias(pgcAnalista,
                             tsCronograma,
                             btnSalvarCronograma,
                             'o Cronograma!',
                             2);


//    if pgcAnalista.ActivePage = tsCronograma then
//    begin
//      if btnSalvarCronograma.Enabled then
//      begin
//        tsCronograma.Show;
//        raise Exception.Create('Salve ou Cancele o Cronograma !');
//      end;
//    end;
  end;

  TFuncoes.ControleGuias(PageControl1,
                         tsOcorrenciaGeral,
                         btnSalvarGeral,
                         'a Ocorr�ncia Geral!',
                         1);

  TFuncoes.ControleGuias(PageControl1,
                         tsOcorrenciaTecnica,
                         btnSalvarTecnico,
                         'a Ocorr�ncia T�cnica!',
                         1);

  TFuncoes.ControleGuias(PageControl1,
                         tsOcorrenciaRegra,
                         btnSalvarRegra,
                         'a Ocorr�ncia Regra!',
                         1);

//  if PageControl1.ActivePage <> tsOcorrenciaGeral then
//  begin
//    if btnSalvarGeral.Enabled then
//    begin
//      tsOcorrenciaGeral.Show;
//      raise Exception.Create('Salve ou Cancele o Ocorr�ncia Geral !');
//    end;
//  end;

//  if PageControl1.ActivePage <> tsOcorrenciaTecnica then
//  begin
//    if btnSalvarTecnico.Enabled then
//    begin
//      tsOcorrenciaTecnica.Show;
//      raise Exception.Create('Salve ou Cancele o Ocorr�ncia T�cnica !');
//    end;
//  end;


end;

procedure TfrmSolicitacao.pgcAnalistaChange(Sender: TObject);
begin
  inherited;
  if pgcAnalista.ActivePage <> tsCronograma then
  begin
//    btnSalvar.Visible := True;
//    btnCancelar.Visible := True;

    if btnSalvarCronograma.Enabled then
    begin
      tsCronograma.Show;
      ShowMessage('Salve ou Cancele o Cronograma');
    end;
  end;
end;

procedure TfrmSolicitacao.pmConferenciaTempoClick(Sender: TObject);
var
  F: TfrmConferenciaTempo;
begin
  inherited;
  F := TfrmConferenciaTempo.create(Self);
  F.ShowModal;
  FreeAndNil(F);
end;

procedure TfrmSolicitacao.pmTempoClick(Sender: TObject);
var
  F: TfrmSolicitacaoTempoManual;
begin
  inherited;
  if FController.Model.CDSConsulta.IsEmpty then
    raise Exception.Create('N�o h� Itens!');

  F := TfrmSolicitacaoTempoManual.create(FController.Model.CDSConsultaSol_Id.AsInteger);
  F.ShowModal;
  FreeAndNil(F);
end;

procedure TfrmSolicitacao.PageControlsPadrao;
begin
  PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
  pgcAnalista.ActivePageIndex := 0;
  PageControl3.ActivePageIndex := 0;
  PageControl4.ActivePageIndex := 0;
end;

procedure TfrmSolicitacao.PermissaoEdicaoOcorrenciaGeral;
var
  Usuario: TUsuarioController;
  bResult: Boolean;
begin
  Usuario := TUsuarioController.Create;
  try
    bResult := Usuario.PermissaoSolicitacaoOcorrenciaGeralAlterar(dm.IdUsuario, 0);
    btnNovoGeral.Enabled := bResult;
    btnEditarGeral.Enabled := bResult;
    btnSalvarGeral.Enabled := False;
    btnExcluirGeral.Enabled := bResult;
//    btnSalvar.Enabled := True;

//    ControleBotaoSalvar();
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmSolicitacao.PermissaoEdicaoOcorrenciaTecnica;
var
  Usuario: TUsuarioController;
  bResult: Boolean;
begin
  Usuario := TUsuarioController.Create;
  try
    bResult := Usuario.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(dm.IdUsuario, 0);
    btnNovoTecnico.Enabled := bResult;
    btnEditarTecnico.Enabled := bResult;
    btnSalvarTecnico.Enabled := False;
    btnExcluirTecnico.Enabled := bResult;
  finally
    FreeAndNil(Usuario);
  end;
end;

function TfrmSolicitacao.SalvarAnalista: Boolean;
begin
  Result := False;
  if (tsAnalista.Showing) and (tsAnalistaPrincipal.Showing) then
  begin
    if btnSalvarAnalista.Enabled then
    begin
      btnSalvarAnalista.SetFocus;
      btnSalvarAnalistaClick(Self);
      Result := True;
    end;
  end;
end;

procedure TfrmSolicitacao.SalvarCronograma;
begin
  if not TFuncoes.DataEmBrancoNula(FController.Model.CDSCronogramaConsultaSCro_Data.AsString) then
  begin
    if FController.Model.CDSCronogramaConsultaSCro_Data.AsDateTime < FController.Model.CDSCadastroSol_Data.AsDateTime then
      raise Exception.Create('Data de Previs�o de In�cio menor que Data de Abertura!');
  end;


  try
    FController.PostCronograma;
    if edtCodOperAnalista.Enabled then
      edtCodOperAnalista.SetFocus;

    FController.ModoEdicaoInsercao;
  except
    On E: Exception do
    begin
      ShowMessage(E.Message);
      if edtCodOperAnalista.Enabled then
        edtCodOperAnalista.SetFocus;
    end;
  end;
end;

function TfrmSolicitacao.SalvarCronogramaItem: Boolean;
begin
  result := False;
  if (tsEdicao.Showing) and (tsAnalista.Showing) and (tsCronograma.Showing) then
  begin
    if btnSalvarCronograma.Enabled then
    begin
      btnSalvarCronogramaClick(Self);
      Result := True;
    end;
  end;

end;

function TfrmSolicitacao.SalvarOcorrenciaGeral: Boolean;
var
  bInclusao: Boolean;
begin
  if FController.Model.CDSOcorrenciaGeralConsulta.State in [dsEdit, dsInsert] then
  begin
    if not TFuncoes.DataEmBrancoNula(FController.Model.CDSOcorrenciaGeralConsultaSOcor_Data.AsString) then
    begin
      if FController.Model.CDSOcorrenciaGeralConsultaSOcor_Data.AsDateTime < FController.Model.CDSCadastroSol_Data.AsDateTime then
        raise Exception.Create('Data da Ocorr�ncia Geral menor que Data de Abertura!');
    end;

//    if FController.Model.CDSOcorrenciaGeralConsultaSOcor_Tipo.AsInteger = 0 then
//    begin
//      edtCodTipoGeral.SetFocus;
//      raise Exception.Create('Informe o Tipo!');
//    end;

    if FController.Model.CDSOcorrenciaGeralConsultaSOcor_Descricao.AsString.Trim = '' then
    begin
      tsEdicaoGeral.Show;
      if dbmDescricaoGeral.Enabled then
        dbmDescricaoGeral.SetFocus;
      raise Exception.Create('Informe a Descri��o!');
    end;

    try
        Result := EntrarTelaStatus();
//      if Result then
//      begin
//        bInclusao := (FController.Model.CDSOcorrenciaGeralConsulta.State = dsInsert);
        FController.PostOcorrenciaGeral;
        if (FQuadro) and (FOcorrenciaGeral) then
        begin
          FController.ModoEdicaoInsercao();
          btnSalvarClick(Self);
//          FController.Salvar(dm.IdUsuario);
//
//          if bInclusao then
//            EnvioEmail(FController.Model.CDSCadastroSol_Id.AsInteger, FController.Model.CDSCadastroSol_Status.AsInteger);

//          Self.Close;
          Exit;
        end;

        if Edit1.Enabled then
          Edit1.SetFocus;
//      end;
    except
      On E: Exception do
      begin
        Result := False;
        ShowMessage(E.Message);
        if edtDataGeral.Enabled then
          edtDataGeral.SetFocus;
      end;
    end;
  end;
end;

function TfrmSolicitacao.SalvarOcorrenciaGeralItem: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsOcorrenciaGeral.Showing) then
  begin
    if btnSalvarGeral.Enabled then
    begin
      btnSalvarGeral.SetFocus;
      btnSalvarGeralClick(Self);
      Result := True;
    end;
  end;
end;

procedure TfrmSolicitacao.EntrarSolicitacaoQuadro;
begin
  // se usar quadro, ja abre no modo inclusao
  if FQuadro then
  begin
    tsAbertura.TabVisible := False;
    tsDescricaoAbertura.TabVisible := tsAbertura.TabVisible;
    tsAnalista.TabVisible := False;
    tsOcorrenciaGeral.TabVisible := False;
    tsOcorrenciaTecnica.TabVisible := False;
    tsOcorrenciaRegra.TabVisible := False;
    tsStatus.TabVisible := False;
  end;

  if (FQuadro) and (FOcorrenciaGeral = False) and (FOcorrenciaTecnica = False) and (FOcorrenciaRegra = False) and (FAnalise = False) then
  begin
    tsAbertura.TabVisible := True;
    tsDescricaoAbertura.TabVisible := tsAbertura.TabVisible;
    btnNovoClick(Self);
  end;

  if (FQuadro) and (FAnalise) then
  begin
    btnEditarClick(Self);
    tsAnalista.TabVisible := True;
  end;

  if (FQuadro) and (FOcorrenciaGeral) then
  begin
    btnEditarClick(Self);
    tsOcorrenciaGeral.TabVisible := True;
    btnNovoGeralClick(Self);
  end;

  if (FQuadro) and (FOcorrenciaTecnica) then
  begin
    btnEditarClick(Self);
    tsOcorrenciaTecnica.TabVisible := True;
    btnNovoTecnicoClick(Self);
  end;

  if (FQuadro) and (FOcorrenciaRegra) then
  begin
    btnEditarClick(Self);
    tsOcorrenciaRegra.TabVisible := True;
    btnNovoRegraClick(Self);
  end;
end;

function TfrmSolicitacao.SalvarTecnico: Boolean;
var
  bInclusao: Boolean;
begin
  if not TFuncoes.DataEmBrancoNula(FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_Data.AsString) then
  begin
    if FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_Data.AsDateTime < FController.Model.CDSCadastroSol_Data.AsDateTime then
      raise Exception.Create('Data da Ocorr�ncia T�cnica menor que Data de Abertura!');
  end;

  tsEdicaoTecnica.Show;
  if FController.Model.CDSOcorrenciaTecnicaConsultaSOcor_Descricao.AsString.Trim = '' then
  begin
    raise Exception.Create('Informe a Descri��o!');
  end;

  try
      Result := EntrarTelaStatus();
      FController.PostOcorrenciaTecnico;
      if (FQuadro) and (FOcorrenciaTecnica) then
      begin
        FController.ModoEdicaoInsercao;
        btnSalvarClick(Self);
        Exit;
      end;
      if Edit2.Enabled then
        Edit2.SetFocus;
  except
    On E: Exception do
    begin
      Result := False;
      ShowMessage(E.Message);
      if edtDataTecnica.Enabled then
        edtDataTecnica.SetFocus;
    end;
  end;
end;

procedure TfrmSolicitacao.btnVisualizarOcorrenciaRegraClick(Sender: TObject);
begin
  inherited;
  TFuncoes.VisualizarArquivo(edtAnexoOcorrenciaRegra.Text);
end;

procedure TfrmSolicitacao.TeclasAtalho(var Key: Word; var Shift: TShiftState);
var
  cancelar: Boolean;
begin
  case Key of
    VK_INSERT:
    begin
      NovoGeral;
      NovoTecnico;
      NovoCronograma;
      NovaRegra();
    end;
    VK_F2:
    begin
      EditarCronograma();
      EditarOcorrenciaGeral();
      EditarOcorrenciaTecnica();
      EditarAnalista();
      EditarRegra();
    end;
    VK_F8:
    begin
      if btnSalvar.Enabled then
      begin
        if tsEdicao.Showing then
          btnSalvar.SetFocus;
        btnSalvarClick(Self);
      end
      else begin
        SalvarCronogramaItem();
        SalvarOcorrenciaGeralItem();
        SalvarOcorrenciaTecnicaItem();
        SalvarOcorrenciaRegraItem();
//        SalvarAnalista();
      end;
    end;
    VK_ESCAPE:
    begin
      cancelar := False;
      if tsOcorrenciaGeral.Showing then
        cancelar := CancelarOcorrenciaGeral()
      else if tsOcorrenciaTecnica.Showing then
        cancelar := CancelarOcorrenciaTecnico()
      else if tsCronograma.Showing then
        cancelar := CancelarCronograma
      else if tsAnalistaPrincipal.Showing then
        cancelar := CancelarAnalista()
      else if tsOcorrenciaRegra.Showing then
           cancelar := CancelarOcorrenciaRegra();

      if cancelar = False then
        btnCancelarClick(Self);
    end;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
  begin
    ExcluirGeral;
    ExcluirTecnico;
    ExcluirCronograma;
    ExcluirRegra;
  end;
end;

procedure TfrmSolicitacao.tsAnalistaShow(Sender: TObject);
begin
  inherited;
  try
    edtCodAnalista.SetFocus;
  except
    // nada
  end;
end;

procedure TfrmSolicitacao.tsFiltroShow(Sender: TObject);
begin
  inherited;
  PageControl2.ActivePageIndex := 0;
end;

procedure TfrmSolicitacao.tsOcorrenciaGeralShow(Sender: TObject);
begin
  inherited;
  try
    edtCodTipoGeral.SetFocus;
  except
    // nada
  end;
end;

procedure TfrmSolicitacao.UsuarioGeral;
var
  Usuario: TUsuarioController;
begin
  Usuario := TUsuarioController.Create;
  try
    Usuario.LocalizarId(DM.IdUsuario);
    FController.Model.CDSOcorrenciaGeralConsultaSOcor_UsuarioOperacional.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
    FController.Model.CDSOcorrenciaGeralConsultaUsu_Codigo.AsInteger := Usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
    FController.Model.CDSOcorrenciaGeralConsultaUsu_Nome.AsString := Usuario.Model.CDSCadastroUsu_Nome.AsString;
  finally
    FreeAndNil(Usuario);
  end;
end;

end.

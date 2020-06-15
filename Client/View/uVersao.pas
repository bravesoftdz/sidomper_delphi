unit uVersao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMVersao,
  uVersaoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, Vcl.OleCtnrs, uFraCliente,
  uFraUsuario, uFraTipo, uFraStatus, uEnumerador, Vcl.Menus, uPosicaoBotao, uFiltroVersao,
  uFraProduto, uProduto;

type
  TfrmVersao = class(TfrmBaseCadastro)
    PageControl1: TPageControl;
    tsPrincipal: TTabSheet;
    Panel7: TPanel;
    edtCodigo: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtNome: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    edtCodUsuario: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    edtCodTipo: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    btnTipo: TSpeedButton;
    edtCodStatus: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    btnStatus: TSpeedButton;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    dlgAbrirArquivo: TOpenDialog;
    tsFiltroUsuario: TTabSheet;
    Panel9: TPanel;
    FraUsuario: TFraUsuario;
    tsFiltroTipo: TTabSheet;
    tsFiltroStatus: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    FraTipo: TFraTipo;
    FraStatus: TFraStatus;
    Label39: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label40: TLabel;
    Label20: TLabel;
    edtVersao: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtDataLibInicial: TMaskEdit;
    edtDataLibFinal: TMaskEdit;
    lblMensagem: TLabel;
    pmRelatorio: TPopupMenu;
    Estatsticas1: TMenuItem;
    DocumentospLiberao1: TMenuItem;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    cbModelo: TComboBox;
    tsFiltroProduto: TTabSheet;
    Panel8: TPanel;
    FraProduto: TFraProduto;
    Label11: TLabel;
    edtCodProduto: TDBEdit;
    DBEdit2: TDBEdit;
    btnProduto: TSpeedButton;
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharEdicaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure btnTipoClick(Sender: TObject);
    procedure cbbCamposChange(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodStatusExit(Sender: TObject);
    procedure edtCodTipoExit(Sender: TObject);
    procedure edtCodTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tsFiltroShow(Sender: TObject);
    procedure tsGeralShow(Sender: TObject);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure FraTipoedtCodigoEnter(Sender: TObject);
    procedure FraTipobtnProcClick(Sender: TObject);
    procedure FraStatusedtCodigoEnter(Sender: TObject);
    procedure FraStatusbtnProcClick(Sender: TObject);
    procedure Estatsticas1Click(Sender: TObject);
    procedure DocumentospLiberao1Click(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
  private
    { Private declarations }
    FController: TVersaoController;
    procedure Localizar(ATexto: string);

    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure BuscarTipo(AId, ACodigo: Integer);
    procedure BuscarStatus(AId, ACodigo: Integer);
    procedure BuscarProduto(AId, ACodigo: Integer);
    procedure BuscarObservacao;
    procedure BuscarStatusDesenvolvimento;
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);

    procedure Impressao(ATipo, AIdVersao: Integer);
    procedure ImpressaoVersao(AIdVersao: Integer);
    procedure ImpressaoDocumento(AIdVersao: Integer);
  end;

var
  frmVersao: TfrmVersao;

implementation

{$R *.dfm}

uses uGrade, uDM, uImagens, uClienteController, uUsuario, uCliente,
  uUsuarioController, uTipo, uTipoController, uStatusController, uStatus,
  uFiltroVisita, uObservacao, uObsevacaoController, uProdutoController;

procedure TfrmVersao.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmVersao.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmVersao.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmVersao.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure TfrmVersao.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmVersao.btnImprimirClick(Sender: TObject);
var
  Controller: TVersaoController;
  Filtro: TFiltroVersao;
begin
  TFuncoes.DataValida(edtDataInicial.Text);
  TFuncoes.DataValida(edtDataFinal.Text);
  TFuncoes.DataValida(edtDataLibInicial.Text);
  TFuncoes.DataValida(edtDataLibFinal.Text);

  FController.Imprimir(dm.IdUsuario);

  Filtro := TFiltroVersao.Create;
  Controller := TVersaoController.Create;
  try
    Filtro.DataInicial := edtDataInicial.Text;
    Filtro.DataFinal := edtDataFinal.Text;
    Filtro.DataLiberacaoInicial := edtDataLibInicial.Text;
    Filtro.DataLiberacaoFinal := edtDataLibFinal.Text;
    Filtro.IdCliente := '';
    Filtro.IdTipo := FraTipo.RetornoSelecao();
    Filtro.IdStatus := FraStatus.RetornoSelecao();
    Filtro.IdUsuario := FraUsuario.RetornoSelecao();
    Filtro.IdProduto := FraProduto.RetornoSelecao();
    Filtro.IdVersao := 0;

    if cbModelo.ItemIndex = 0 then
      Controller.Relatorio03(0, Filtro);
  finally
    FreeAndNil(Controller);
    FreeAndNil(Filtro);
  end;

  inherited;
end;

procedure TfrmVersao.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmVersao.btnProdutoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmProduto.create(true));
  if dm.IdSelecionado > 0 then
    BuscarProduto(dm.IdSelecionado, 0);
end;

procedure TfrmVersao.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

procedure TfrmVersao.BuscarObservacao;
var
  obs: TObservacaoController;
begin
  if edtVersao.Enabled = False then
    Exit;

  TFuncoes.CriarFormularioModal(TfrmObservacao.create(true, prVersao));
  if dm.IdSelecionado > 0 then
  begin
    FController.ModoEdicaoInsercao;
    obs := TObservacaoController.Create;
    try
      obs.LocalizarId(dm.IdSelecionado);
      FController.Model.CDSCadastroVer_Descricao.AsString :=
      FController.Model.CDSCadastroVer_Descricao.AsString + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
    finally
      FreeAndNil(obs);
    end;
  end;
end;

procedure TfrmVersao.BuscarProduto(AId, ACodigo: Integer);
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
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroVer_Produto.AsString := obj.Model.CDSCadastroProd_Id.AsString;
    FController.Model.CDSCadastroProd_Codigo.AsString := obj.Model.CDSCadastroProd_Codigo.AsString;
    FController.Model.CDSCadastroProd_Nome.AsString := obj.Model.CDSCadastroProd_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodProduto.Modified := False;

end;

procedure TfrmVersao.BuscarStatus(AId, ACodigo: Integer);
var
  obj: TStatusController;
begin
  obj := TStatusController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prVersao);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodStatus.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroVer_Status.AsString := obj.Model.CDSCadastroSta_Id.AsString;
    FController.Model.CDSCadastroSta_Codigo.AsString := obj.Model.CDSCadastroSta_Codigo.AsString;
    FController.Model.CDSCadastroSta_Nome.AsString := obj.Model.CDSCadastroSta_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodStatus.Modified := False;
end;

procedure TfrmVersao.BuscarStatusDesenvolvimento;
var
  iCodStatus: Integer;
begin
  iCodStatus := FController.BuscarStatusVersaoDesenvolvimento();
  if iCodStatus > 0 then
  begin
    FraStatus.edtCodigo.Text := IntToStr(iCodStatus);
    FraStatus.Adiciona();
  end;
end;

procedure TfrmVersao.BuscarTipo(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prVersao);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipo.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroVer_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSCadastroTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSCadastroTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodTipo.Modified := False;
end;

procedure TfrmVersao.BuscarUsuario(AId, ACodigo: Integer);
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
    FController.Model.CDSCadastroVer_Usuario.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSCadastroUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSCadastroUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodUsuario.Modified := False;
end;

constructor TfrmVersao.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TVersaoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  cbbCampos.ItemIndex := 4;
  Localizar('ABCDE'); // para trazer vazio

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
  FraUsuario.Inicializar();
  FraTipo.Inicializar();
  FraStatus.Inicializar();
  FraProduto.Inicializar();
end;

procedure TfrmVersao.btnStatusClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmStatus.create(prVersao, True));
  if dm.IdSelecionado > 0 then
    BuscarStatus(dm.IdSelecionado, 0);
end;

procedure TfrmVersao.btnTipoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prVersao, true));
  if dm.IdSelecionado > 0 then
    BuscarTipo(dm.IdSelecionado, 0);
end;

procedure TfrmVersao.cbbCamposChange(Sender: TObject);
begin
  inherited;
  lblMensagem.Visible := TFuncoes.MostrarDescricaoPesquisaData(cbbCampos.Text);
end;

procedure TfrmVersao.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmVersao.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmVersao.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmVersao.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmVersao.DBMemo1KeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F8 then
  begin
    if btnSalvar.Enabled then
    begin
      btnSalvar.SetFocus;
      btnSalvarClick(Self);
    end;
  end;

  if Key = VK_F9 then
    BuscarObservacao();

  if Key = VK_ESCAPE then
    btnCancelarClick(Self);
end;

procedure TfrmVersao.DocumentospLiberao1Click(Sender: TObject);
begin
  inherited;
  Impressao(2, FController.Model.CDSConsultaVer_Id.AsInteger);
end;

procedure TfrmVersao.edtCodProdutoExit(Sender: TObject);
begin
  inherited;
  if edtCodProduto.Modified then
    BuscarProduto(0, StrToIntDef(edtCodProduto.Text, 0));
end;

procedure TfrmVersao.edtCodStatusExit(Sender: TObject);
begin
  inherited;
  if edtCodStatus.Modified then
    BuscarStatus(0, StrToIntDef(edtCodStatus.Text,0));
end;

procedure TfrmVersao.edtCodTipoExit(Sender: TObject);
begin
  inherited;
  if edtCodTipo.Modified then
    BuscarTipo(0, StrToIntDef(edtCodTipo.Text, 0));
end;

procedure TfrmVersao.edtCodTipoKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F9 then
  begin
    if Sender = edtCodTipo then
      btnTipoClick(Self)
    else if Sender = edtCodStatus then
      btnStatusClick(Self)
    else if Sender = edtCodProduto then
      btnProdutoClick(Self);
  end;
end;

procedure TfrmVersao.edtCodUsuarioExit(Sender: TObject);
begin
  inherited;
  if edtCodUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtCodUsuario.Text, 0));
end;

procedure TfrmVersao.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmVersao.Estatsticas1Click(Sender: TObject);
begin
  inherited;
  Impressao(1, FController.Model.CDSConsultaVer_Id.AsInteger);
end;

procedure TfrmVersao.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmVersao.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
  Botao: TPosicaoBotao;
begin
  inherited;
  Img := TfrmImagens.Create(Self);
  try
    btnTipo.Glyph := Img.btnProcurar.Glyph;
    btnStatus.Glyph := Img.btnProcurar.Glyph;
    btnProduto.Glyph := Img.btnProcurar.Glyph;
  finally
    FreeAndNil(Img);
  end;

//------------------------------------------------------------------------------
// edicao
  Botao := TPosicaoBotao.Create(btnSalvar, 6, 6);
  try
    Botao.PosicaoBotao(btnCancelar);
  finally
    FreeAndNil(Botao);
  end;

//------------------------------------------------------------------------------
// Pesquisa
  Botao := TPosicaoBotao.Create(btnPrimeiro, 6, 6, True);
  try
    Botao.PosicaoBotaoNavegacao(btnAnterior);
    Botao.PosicaoBotaoNavegacao(btnProximo);
    Botao.PosicaoBotaoNavegacao(btnUltimo);
    Botao.PosicaoBotao(btnNovo);
    Botao.PosicaoBotao(btnEditar);
    Botao.PosicaoBotao(btnExcluir);
    Botao.PosicaoBotao(btnFiltrar);
    Botao.PosicaoBotao(btnSair);
  finally
    FreeAndNil(Botao);
  end;
//------------------------------------------------------------------------------
// filtro
  Botao := TPosicaoBotao.Create(btnFiltro, 6, 6);
  try
    Botao.PosicaoBotao(btnImprimir);
    Botao.PosicaoBotao(btnFecharFiltro);
  finally
    FreeAndNil(Botao);
  end;

  BuscarStatusDesenvolvimento();
end;

procedure TfrmVersao.FraStatusbtnProcClick(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prVersao;
  FraStatus.btnProcClick(Sender);
end;

procedure TfrmVersao.FraStatusedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prVersao;
end;

procedure TfrmVersao.FraTipobtnProcClick(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prVersao;
  FraTipo.btnProcClick(Sender);
end;

procedure TfrmVersao.FraTipoedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prVersao;
end;

procedure TfrmVersao.Impressao(ATipo, AIdVersao: Integer);
begin
  if FController.Model.CDSConsulta.IsEmpty then
    raise Exception.Create('N�o h� Registros!');

  case ATipo of
    1: ImpressaoVersao(AIdVersao);
    2: ImpressaoDocumento(AIdVersao);
  end;
end;

procedure TfrmVersao.ImpressaoDocumento(AIdVersao: Integer);
var
  obj: TVersaoController;
  Filtro: TFiltroVersao;
begin
  obj := TVersaoController.Create;
  Filtro := TFiltroVersao.Create;
  try
    Filtro.IdVersao := AIdVersao;
    obj.Relatorio02(AIdVersao, Filtro);
  finally
    FreeAndNil(obj);
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmVersao.ImpressaoVersao(AIdVersao: Integer);
var
  obj: TVersaoController;
begin
  obj := TVersaoController.Create;
  try
    obj.Relatorio01(AIdVersao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TfrmVersao.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
  Filtro: TFiltroVersao;
begin

  Filtro := TFiltroVersao.Create;
  try
    Filtro.DataInicial := edtDataInicial.Text;
    Filtro.DataFinal := edtDataFinal.Text;
    Filtro.DataLiberacaoInicial := edtDataLibInicial.Text;
    Filtro.DataLiberacaoFinal := edtDataLibFinal.Text;
    Filtro.IdTipo := FraTipo.RetornoSelecao();
    Filtro.IdStatus := FraStatus.RetornoSelecao();
    Filtro.IdUsuario := FraUsuario.RetornoSelecao();
    Filtro.IdProduto := FraProduto.RetornoSelecao();

    sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
    sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
    bContem := (cbbPesquisa.ItemIndex = 1);

    FController.FiltrarVersao(Filtro, sCampo, ATexto, bContem);
    FController.Model.CDSConsulta.IndexFieldNames := sCampo;
  finally
    FreeAndNil(Filtro);
  end;

end;

procedure TfrmVersao.tsFiltroShow(Sender: TObject);
begin
  inherited;
  PageControl2.ActivePageIndex := 0;
end;

procedure TfrmVersao.tsGeralShow(Sender: TObject);
begin
  cbbPesquisa.SetFocus;
  inherited;
end;

end.

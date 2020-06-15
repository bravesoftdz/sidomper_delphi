unit uModeloRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMModeloRelatorio,
  uModeloRelatorioController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uImagens, uRevendaController, uRevenda;

type
  TfrmModeloRelatorio = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    edtCodRevenda: TDBEdit;
    DBEdit2: TDBEdit;
    btnRevenda: TSpeedButton;
    edtObservacao: TDBEdit;
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
    procedure dbDadosTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure edtCodRevendaExit(Sender: TObject);
    procedure btnRevendaClick(Sender: TObject);
    procedure edtCodRevendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FController: TModeloRelatorioController;
    procedure Localizar(ATexto: string);
    procedure BuscarRevenda(AId, ACodigo: Integer);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);
  end;

var
  frmModeloRelatorio: TfrmModeloRelatorio;

implementation

{$R *.dfm}

uses uGrade, uDM, uFormatarTexto;

procedure TfrmModeloRelatorio.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtObservacao.Enabled then
    edtObservacao.SetFocus;
end;

procedure TfrmModeloRelatorio.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmModeloRelatorio.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmModeloRelatorio.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmModeloRelatorio.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmModeloRelatorio.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtObservacao.SetFocus;
end;

procedure TfrmModeloRelatorio.btnRevendaClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmRevenda.create(true));
  if dm.IdSelecionado > 0 then
    BuscarRevenda(dm.IdSelecionado, 0);
end;

procedure TfrmModeloRelatorio.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

procedure TfrmModeloRelatorio.BuscarRevenda(AId, ACodigo: Integer);
var
  RevendaController: TRevendaController;
begin
  RevendaController := TRevendaController.Create;
  try
    try
      RevendaController.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodRevenda.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
    FController.Model.CDSCadastroModR_Revenda.AsString := RevendaController.Model.CDSCadastroRev_Id.AsString;
    FController.Model.CDSCadastroRev_Codigo.AsString := RevendaController.Model.CDSCadastroRev_Codigo.AsString;
    FController.Model.CDSCadastroRev_Nome.AsString := RevendaController.Model.CDSCadastroRev_Nome.AsString;

    FreeAndNil(RevendaController);
  end;
  edtCodRevenda.Modified := False;
end;

constructor TfrmModeloRelatorio.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TModeloRelatorioController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  Localizar('ABCDE');

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
end;

procedure TfrmModeloRelatorio.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmModeloRelatorio.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmModeloRelatorio.edtCodRevendaExit(Sender: TObject);
begin
  inherited;
  if edtCodRevenda.Modified then
    BuscarRevenda(0, StrToIntDef(edtCodRevenda.Text, 0));
end;

procedure TfrmModeloRelatorio.edtCodRevendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnRevendaClick(Self);
end;

procedure TfrmModeloRelatorio.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmModeloRelatorio.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmModeloRelatorio.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
begin
  inherited;

  img := TfrmImagens.Create(self);
  try
    btnRevenda.Glyph := img.btnProcurar.Glyph;
  finally
    FreeAndNil(img);
  end;
end;

procedure TfrmModeloRelatorio.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

//  FController.Filtrar(sCampo, ATexto, sSituacao, bContem);
  FController.FiltrarUsuario(sCampo, ATexto, sSituacao, bContem);
end;

end.

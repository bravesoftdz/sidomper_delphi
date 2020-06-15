unit uLicenca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uFuncoesSIDomper,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, ULicencaVO, uLicencaItensVO,
  System.Generics.Collections, Winapi.ShellAPI, uGrade, uImagens, Vcl.Mask, uEnumerador,
  uFiltroLicenca, uRevendaController, uRevenda, uDM, uClienteController, uCliente,
  uLicencaController, uFormProcesso, uParametrosController, Vcl.Clipbrd,
  Vcl.Menus;

type
  TfrmLicenca = class(TForm)
    PageControl1: TPageControl;
    tsLicenca: TTabSheet;
    tsLicenca1: TTabSheet;
    Panel1: TPanel;
    btnImportar: TBitBtn;
    btnFechar: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    dbLicenca: TDBGrid;
    dbItens: TDBGrid;
    dsCad: TDataSource;
    dsCad1: TDataSource;
    CDSCad: TClientDataSet;
    CDSCad1: TClientDataSet;
    CDSCadDocumento: TStringField;
    CDSCadEmpresa: TStringField;
    CDSCadQtdeEstacao: TIntegerField;
    CDSCadQtdeUsuario: TIntegerField;
    CDSCadIPExterno: TStringField;
    CDSCadDataUtilizacao: TDateField;
    CDSCadBuild: TStringField;
    CDSCadIPLocal: TStringField;
    CDSCad1Documento: TStringField;
    CDSCad1DataLcto: TDateField;
    CDSCad1Licenca: TStringField;
    CDSCad1Utilizada: TStringField;
    CDSCad1DataUtilizacao: TDateField;
    CDSCad1Situacao: TStringField;
    Panel4: TPanel;
    lblQtdeLicenca2: TLabel;
    Panel5: TPanel;
    lblQtdeLicenca: TLabel;
    lblQtdeEstacao: TLabel;
    lblQtdeUsuarios: TLabel;
    CDSCadIdCliente: TIntegerField;
    CDSCadRazaoSocial: TStringField;
    CDSCad1IdCliente: TIntegerField;
    CDSCad1RazaoSocial: TStringField;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnFiltrar: TBitBtn;
    edtCodCliente: TEdit;
    edtCodRevenda: TEdit;
    edtNomeCliente: TEdit;
    edtNomeRevenda: TEdit;
    btnCliente: TSpeedButton;
    btnRevenda: TSpeedButton;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    edtIdCliente: TEdit;
    edtIdRevenda: TEdit;
    lblUtilizada: TLabel;
    lblNaoUtilizada: TLabel;
    lblNormal: TLabel;
    lblInutilizada: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbbUtilizada: TComboBox;
    cbbSituacao: TComboBox;
    PopupMenu1: TPopupMenu;
    CopiarLicena1: TMenuItem;
    btnLimparLicenca: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dbLicencaTitleClick(Column: TColumn);
    procedure dbItensTitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbLicencaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbItensDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnRevendaClick(Sender: TObject);
    procedure edtCodRevendaExit(Sender: TObject);
    procedure edtCodRevendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnClienteClick(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure CopiarLicena1Click(Sender: TObject);
    procedure btnLimparLicencaClick(Sender: TObject);
  private
    { Private declarations }
    procedure Importar();
    procedure MostrarDados;
    procedure MostrarDadosItens;
    procedure ImagensBotao;
    procedure LimparDados(ADataSet: TDataSet);
    procedure BuscarClienteII;
    function AplicarFiltro: Boolean;
    procedure BuscarRevenda(AId, ACodigo: Integer);
    procedure BuscarCliente(AId, ACodigo: Integer);
    procedure Filtrar;
  public
    { Public declarations }
  end;

var
  frmLicenca: TfrmLicenca;

implementation


{$R *.dfm}

function TfrmLicenca.AplicarFiltro: Boolean;
var
  bResult: Boolean;
begin
  bResult := False;
  if trim(edtDataInicial.Text) <> DataEmBranco then
    bResult := True;

  if trim(edtDataFinal.Text) <> DataEmBranco then
    bResult := True;

  if edtCodCliente.Text <> '' then
    bResult := True;

  if edtCodRevenda.Text <> '' then
    bResult := True;

  if cbbUtilizada.ItemIndex < 2 then
    bResult := True;

  if cbbSituacao.ItemIndex < 2 then
    bResult := True;

  Result := bResult;
end;

procedure TfrmLicenca.btnClienteClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmCliente.create(dm.IdUsuario ,true));
  if dm.IdSelecionado > 0 then
    BuscarCliente(dm.IdSelecionado, 0);
end;

procedure TfrmLicenca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLicenca.btnFiltrarClick(Sender: TObject);
begin
  Filtrar();
end;

procedure TfrmLicenca.btnImportarClick(Sender: TObject);
begin
  Importar();
end;

procedure TfrmLicenca.btnLimparLicencaClick(Sender: TObject);
var
  Controller: TLicencaController;
  sMensagem: string;
begin
  if TFuncoes.Confirmar('Confirmar Limpeza das Licen�as?') then
  begin
    btnLimparLicenca.Enabled := False;
    Screen.Cursor := crHourGlass;
    Controller := TLicencaController.Create;
    try
      sMensagem := Controller.LimparLicencas();
      if sMensagem <> '' then
        ShowMessage(sMensagem)
      else
        Filtrar();
    finally
      FreeAndNil(Controller);
      Screen.Cursor := crDefault;
      btnLimparLicenca.Enabled := True;
    end;
  end;
end;

procedure TfrmLicenca.btnRevendaClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmRevenda.create(true));
  if dm.IdSelecionado > 0 then
    BuscarRevenda(dm.IdSelecionado, 0);
end;

procedure TfrmLicenca.BuscarClienteII;
var
  bAchou: Boolean;
begin
  if CDSCad1.RecordCount = 0 then
    Exit;

  bAchou := False;
  CDSCad.DisableControls;
  try
    CDSCad.First;
    while not CDSCad.Eof do
    begin
      if CDSCadDocumento.AsString = CDSCad1Documento.AsString then
      begin
        bAchou := True;
        Break;
      end;
      CDSCad.Next;
    end;

    if bAchou = False then
    begin
      CDSCad.First;
      raise Exception.Create('Registro n�o Encontrado!');
    end;
  finally
    CDSCad.EnableControls;
  end;

  if bAchou then
  begin
    tsLicenca.Show;
    dbLicenca.SetFocus;
  end;
end;

procedure TfrmLicenca.BuscarCliente(AId, ACodigo: Integer);
var
  ClienteController: TClienteController;
begin
  ClienteController := TClienteController.Create;
  try
    try
      ClienteController.APesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodCliente.SetFocus;
      end;
    end;
  finally
    edtIdCliente.Text := ClienteController.Model.CDSCadastroCli_Id.AsString;
    edtNomeCliente.Text := ClienteController.Model.CDSCadastroCli_Nome.AsString;
    edtCodCliente.Text := ClienteController.MascaraCodigo(ClienteController.Model.CDSCadastroCli_Codigo.AsString);
    FreeAndNil(ClienteController);
  end;
  edtCodCliente.Modified := False;
end;

procedure TfrmLicenca.BuscarRevenda(AId, ACodigo: Integer);
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
    edtIdRevenda.Text := RevendaController.Model.CDSCadastroRev_Id.AsString;
    edtNomeRevenda.Text := RevendaController.Model.CDSCadastroRev_Nome.AsString;
    edtCodRevenda.Text := RevendaController.MascaraCodigo(RevendaController.Model.CDSCadastroRev_Codigo.AsString);
    FreeAndNil(RevendaController);
  end;
  edtCodRevenda.Modified := False;
end;

procedure TfrmLicenca.CopiarLicena1Click(Sender: TObject);
begin
  if CDSCad1Licenca.Text <> '' then
  begin
    Clipboard.Open;
    Clipboard.SetTextBuf(Pointer(CDSCad1Licenca.Text));
    Clipboard.Close;
  end;
end;

procedure TfrmLicenca.dbLicencaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCad.DataSet, dbLicenca, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmLicenca.dbLicencaTitleClick(Column: TColumn);
begin
  CDSCad.IndexFieldNames := Column.FieldName;
end;

procedure TfrmLicenca.edtCodClienteExit(Sender: TObject);
begin
  if edtCodCliente.Modified then
    BuscarCliente(0, StrToIntDef(edtCodCliente.Text, 0));
end;

procedure TfrmLicenca.edtCodRevendaExit(Sender: TObject);
begin
  if edtCodRevenda.Modified then
    BuscarRevenda(0, StrToIntDef(edtCodRevenda.Text, 0));
end;

procedure TfrmLicenca.edtCodRevendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
  begin
    if Sender = edtCodRevenda then
      btnRevendaClick(Self)
    else begin
      if Sender = edtCodCliente then
        btnClienteClick(Self);
    end;
  end;
end;

procedure TfrmLicenca.dbItensDblClick(Sender: TObject);
begin
  BuscarClienteII();
end;

procedure TfrmLicenca.dbItensDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCad1.DataSet, dbItens, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmLicenca.dbItensTitleClick(Column: TColumn);
begin
  CDSCad1.IndexFieldNames := Column.FieldName;
end;

procedure TfrmLicenca.Filtrar;
begin
  try
    TFuncoes.ValidaIntervaloDatas(edtDataInicial.Text, edtDataFinal.Text);
  except
    On E: Exception do
    begin
      edtDataInicial.SetFocus;
      ShowMessage(E.Message);
      Exit;
    end;
  end;
  MostrarDados();
  MostrarDadosItens();
end;

procedure TfrmLicenca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CDSCad.Filtered := False;
  Action := caFree;
end;

procedure TfrmLicenca.FormCreate(Sender: TObject);
begin
  CDSCad.CreateDataSet;
  CDSCad1.CreateDataSet;
  lblQtdeLicenca.Caption := '';
  lblQtdeLicenca2.Caption := '';
  lblQtdeEstacao.Caption := '';
  lblQtdeUsuarios.Caption := '';

  lblUtilizada.Caption := '';
  lblNaoUtilizada.Caption := '';
  lblNormal.Caption := '';
  lblInutilizada.Caption := '';
end;

procedure TfrmLicenca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmLicenca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmLicenca.FormShow(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
  ImagensBotao();
  edtCodCliente.SetFocus;
end;

procedure TfrmLicenca.ImagensBotao;
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnImportar.Glyph := img.btnImportar.Glyph;
    btnLimparLicenca.Glyph := img.btnExcluir.Glyph;
    btnFiltrar.Glyph := img.btnListar.Glyph;
    btnFechar.Glyph := img.btnSair.Glyph;
    btnCliente.Glyph := img.btnProcurar.Glyph;
    btnRevenda.Glyph := img.btnProcurar.Glyph;
  finally
    FreeAndNil(img);
  end;
end;

procedure TfrmLicenca.Importar;
var
  sCaminho: string;
  ParametrosController: TParametrosController;
  sArquivo: string;
begin
  ParametrosController := TParametrosController.Create;
  try
    sCaminho := ParametrosController.CaminhoAplicativoImportarLicencas();
  finally
    FreeAndNil(ParametrosController);
  end;

  sArquivo := sCaminho + '\licenca.exe';
  if not FileExists(sArquivo) then
    raise Exception.Create(sArquivo + ' n�o encontrado.');

  ShellExecute(handle,'open',PChar(sCaminho + '\licenca.exe'), '','',SW_SHOWNORMAL);
end;

procedure TfrmLicenca.LimparDados(ADataSet: TDataSet);
begin
  ADataSet.DisableControls;
  ADataSet.First;
  while not ADataSet.Eof do
    ADataSet.Delete;

  ADataSet.EnableControls;
end;

procedure TfrmLicenca.MostrarDados;
var
  LicencaController: TLicencaController;
  Lista: TObjectList<TLicencaVO>;
  Item: TLicencaVO;
  iQtdeUsuarios: Integer;
  iQtdeEstacao: Integer;
  Filtro: TFiltroLicenca;
begin
  LicencaController := TLicencaController.Create;
  Filtro := TFiltroLicenca.Create;

  try
    Filtro.DataUtilizacaoInicial := edtDataInicial.Text;
    Filtro.DataUtilizacaoFinal := edtDataFinal.Text;

    if AplicarFiltro then
    begin
      if tsLicenca.Showing then // aba clientes
      begin
        Filtro.Tipo := 'C'; // cliente
        Filtro.IdCliente := StrToIntDef(edtIdCliente.Text, 0);
        Filtro.Cliente.IdRevenda := edtIdRevenda.Text;
      end
      else
        Filtro.Tipo := 'L'; // Licencas
    end
    else
      Filtro.Tipo := 'T'; // todos

    if (Filtro.Tipo = 'T') or (Filtro.Tipo = 'C') then
    begin
      CDSCad.DisableControls;
      Lista := LicencaController.BuscarLicencas(Filtro);
      lblQtdeLicenca.Caption := 'Registros: ' + Lista.Count.ToString();
      LimparDados(dsCad.DataSet);

      iQtdeUsuarios := 0;
      iQtdeEstacao := 0;

      for Item in Lista do
      begin
        CDSCad.Append;
        CDSCadDocumento.AsString        := Item.CNPJCPF;
        CDSCadEmpresa.AsString          := Item.Empresa;
        CDSCadQtdeEstacao.AsInteger     := Item.QtdeEstacao;
        CDSCadQtdeUsuario.AsInteger     := Item.QtdeUsuario;
        CDSCadIPExterno.AsString        := Item.IPExterno;
        CDSCadDataUtilizacao.AsDateTime := Item.DataAtualizacao;
        CDSCadBuild.AsString            := Item.Build;
        CDSCadIPLocal.AsString          := Item.IPLocal;
        CDSCadIdCliente.AsInteger       := Item.IdCliente;
        CDSCadRazaoSocial.AsString      := Item.RazaoSocial;
        CDSCad.Post;

        iQtdeUsuarios := iQtdeUsuarios + Item.QtdeUsuario;
        iQtdeEstacao  := iQtdeEstacao  + Item.QtdeEstacao;
      end;

      lblQtdeEstacao.Caption  := 'Esta��es: ' + FormatFloat(',##0',iQtdeEstacao);
      lblQtdeUsuarios.Caption := 'Usu�rios: ' + FormatFloat(',##0',iQtdeUsuarios);
    end;
  finally
    FreeAndNil(Lista);
    FreeAndNil(LicencaController);
    FreeAndNil(Filtro);
    CDSCad.First;
    CDSCad.EnableControls;
  end;

end;

procedure TfrmLicenca.MostrarDadosItens;
var
  LicencaController: TLicencaController;
  Lista: TObjectList<TLicencaItensVO>;
  Item: TLicencaItensVO;
  Filtro: TFiltroLicenca;
  iUtilizada,
  iInutilizada,
  iNormal,
  iNaoUsada: Integer;
begin
  LicencaController := TLicencaController.Create;

  Filtro := TFiltroLicenca.Create;

  try
    Filtro.DataUtilizacaoInicial := edtDataInicial.Text;
    Filtro.DataUtilizacaoFinal := edtDataFinal.Text;
    Filtro.Situacao := cbbSituacao.Text;
    Filtro.Utilizadas := cbbUtilizada.Text;

    if AplicarFiltro then
    begin
      if tsLicenca1.Showing then  // aba licencas
      begin
        Filtro.Tipo := 'L'; // Licencas
        Filtro.IdCliente := StrToIntDef(edtIdCliente.Text, 0);
        Filtro.Cliente.IdRevenda := edtIdRevenda.Text;
      end
      else
        Filtro.Tipo := 'C'; // Clientes;
    end
    else
      Filtro.Tipo := 'T'; // todos

    if (Filtro.Tipo = 'T') or (Filtro.Tipo = 'L') then
    begin
      CDSCad1.DisableControls;
      LimparDados(dsCad1.DataSet);
      Lista := LicencaController.BuscarLicencasItens(Filtro);
      lblQtdeLicenca2.Caption := 'Registros: ' + Lista.Count.ToString();

      iUtilizada    := 0;
      iInutilizada  := 0;
      iNormal       := 0;
      iNaoUsada     := 0;

      for Item in Lista do
      begin
        CDSCad1.Append;
        CDSCad1Documento.AsString   := Item.CNPJCPF;
        CDSCad1DataLcto.AsDateTime  := Item.DataLcto;
        CDSCad1Licenca.AsString     := Item.Licenca;

        if Item.DataUtilizacao > 0 then
          CDSCad1DataUtilizacao.AsDateTime := Item.DataUtilizacao;

        CDSCad1Situacao.AsString    := Item.SituacaoTela;

        if item.Situacao = '1' then
          CDSCad1Situacao.AsString := 'Normal'
        else if item.Situacao = '2' then
          CDSCad1Situacao.AsString := 'Inutiliz.'
        else
          CDSCad1Situacao.AsString := '';


        if item.LicencaUtilizada = 'S' then
          CDSCad1Utilizada.AsString := 'Sim'
        else
          CDSCad1Utilizada.AsString := 'N�o';

        CDSCad1IdCliente.AsInteger  := Item.IdCliente;
        CDSCad1RazaoSocial.AsString := Item.RazaoSocial;

        if item.LicencaUtilizada = 'S' then
          Inc(iUtilizada);

        if Item.LicencaUtilizada = 'N' then
          Inc(iNaoUsada);

        if item.Situacao = '1' then
          Inc(iNormal);

        if item.Situacao = '2' then
          Inc(iInutilizada);

        CDSCad1.Post;
      end;

      lblUtilizada.Caption    := 'Utilizadas: '           + FormatFloat(',##0', iUtilizada);
      lblNaoUtilizada.Caption := 'N�o Utilizadas: '       + FormatFloat(',##0', iNaoUsada);
      lblNormal.Caption       := 'Normais: '              + FormatFloat(',##0', iNormal);
      lblInutilizada.Caption  := 'Inutilizadas Domper: '  + FormatFloat(',##0', iInutilizada);
    end;
  finally
    FreeAndNil(Lista);
    FreeAndNil(LicencaController);
    FreeAndNil(Filtro);
    CDSCad1.First;
    CDSCad1.EnableControls;
  end;
end;

end.

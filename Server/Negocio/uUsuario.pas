unit uUsuario;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uFiltroUsuario,
  uUsuarioVO, uFireDAC, System.Generics.Collections, uFuncoesServidor,
  uGenericDAO, uDepartamento;

  const
    CConsulta: string = 'SELECT'
    +' U1.Usu_id, '
    +' U1.Usu_Codigo, '
    +' U1.Usu_Nome, '
    +' U1.Usu_Ativo, '
    +' U1.Usu_Email,'
    +' CtaEm_Codigo'
    +' FROM Usuario U1'
    +' LEFT JOIN Conta_Email ON U1.Usu_ContaEmail = CtaEm_Id';

type
  TUsuario = class(TInterfacedObject, ICadastroInterface)
  private
    function RetornaSQL: string;
    function RetornaSQLSolicitacao: string;
    function RetornaSQLChamado: string;
    function RetornaSQLAtividade: string;
    function RetornaSQLAgendamento: string;
    function RetornaPermissao(Programa, IdUsuario: Integer; Permissao: string): Boolean;

    function ExecutarPermissao(Programa, IdUsuario: Integer; Permissao: string): Boolean;
    function ExecutarPermissaoSolicitacao(IdUsuario, Tipo: Integer): Boolean;
    function ExecutarPermissaoChamado(IdUsuario, Tipo: Integer): Boolean;
    function ExecutarPermissaoAtividade(IdUsuario, Tipo: Integer): Boolean;
    function ExecutarPermissaoAgendamentoQuadro(IdUsuario: Integer): Boolean;
    procedure CadastrarUsuario;
    procedure ParametrosSistema;
    function PermissaoSiglas(IdUsuario: Integer; Sigla: string): Boolean;
    function RetornarFiltro(AFiltro: TFiltroUsuario): string;

  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string; overload;
    function Filtrar(Filtro: TFiltroUsuario; Campo, Texto, Ativo: string; Contem: Boolean = true): string; overload;
    function Filtrar(Filtro: TFiltroUsuario; IdUsuario: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True): string; overload;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean; overload;
    function LocalizarId(Id: integer): TUsuarioVO; overload;

    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer); overload;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo, IdUsuario: integer; AMensagem: Boolean = True); overload;
    procedure LocalizarUsuario(var Qry: TFDQuery; UserName, Password: string);
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function Salvar(AUsuario: TUsuarioVO): Integer; overload;
    function ProximoCodigo: Integer;
    function ProximoId: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    procedure LocalizarNome(var Qry: TFDQuery; Nome: string);
    function DiasTrabalhados(ADataInicial, ADataFinal: TDate): TObjectList<TUsuarioVO>;
    procedure IncluirManualmente();
    function ExisteUsuario(): Boolean;
    function Exportar(): TObjectList<TUsuarioVO>;

    function UsuarioADM(AIdUsuario: Integer): Boolean;
    function RetornaPermissaoUsuarioDepartamento(IdUsuario: Integer): string;
    function RetornaPermissaoUsuarioDepartamentoCodigo(IdUsuario: Integer): string;
    function RetornaPermissaoUsuarioModeloRelatorio(IdUsuario: integer): string;

    procedure PermissaoAcessar(Programa, IdUsuario: Integer);
    procedure PermissaoIncluir(Programa, IdUsuario: Integer);
    function PermissaoEditar(Programa, IdUsuario: Integer): Boolean;
    function PermissaoEditarADM(Programa, IdUsuario: Integer): Boolean;
    procedure PermissaoExcluir(Programa, IdUsuario: Integer);
    procedure PermissaoExcluirADM(Programa, IdUsuario: Integer);
    procedure PermissaoRelatorio(Programa, IdUsuario: Integer);

    function PermissaoSolicitacaoAbertura(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoAnalise(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaGeral(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnica(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaRegra(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoStatus(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoQuadro(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoTempo(IdUsuario: Integer): Boolean;
    function PermissaoConferenciaTempoGeral(IdUsuario: Integer): Boolean;

    function PermissaoChamadoAbertura(IdUsuario: integer): Boolean;
    function PermissaoChamadoOcorrencia(IdUsuario: integer): Boolean;
    function PermissaoChamadoStatus(IdUsuario: integer): Boolean;
    function PermissaoChamadoQuadro(IdUsuario: integer): Boolean;

    function PermissaoAtividadeAbertura(IdUsuario: integer): Boolean;
    function PermissaoAtividadeOcorrencia(IdUsuario: integer): Boolean;
    function PermissaoAtividadeStatus(IdUsuario: integer): Boolean;
    function PermissaoAtividadeQuadro(IdUsuario: integer): Boolean;
    function PermissaoAgendamentoQuadro(IdUsuario: Integer): Boolean;
    function PermissaoRecadoQuadro(IdUsuario: Integer): Boolean;

    function PermissaoChamadoOcorrenciaDataHora(IdUsuario: Integer): Boolean;
    function PermissaoChamadoOcorrenciaAlterar(IdUsuario: Integer): Boolean;
    function PermissaoChamadoOcorrenciaExcluir(IdUsuario: Integer): Boolean;

    function PermissaoAtividadeOcorrenciaDataHora(IdUsuario: Integer): Boolean;
    function PermissaoAtividadeOcorrenciaAlterar(IdUsuario: Integer): Boolean;
    function PermissaoAtividadeOcorrenciaExcluir(IdUsuario: Integer): Boolean;

    function PermissaoSolicitacaoOcorrenciaGeralAlterar(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaGeralExcluir(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaAlterar(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaExcluir(IdUsuario: Integer): Boolean;

    function PermissaoSolicitacaoOcorrenciaRegraAlterar(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaRegraExcluir(IdUsuario: Integer): Boolean;

    function PermissaoOrcamentoAlteracaoSituacao(IdUsuario: Integer): Boolean;

    function PermissaoUsuario(APrograma, AIdUsuario: Integer; AAcao: string): Boolean;
    function PermissaoOrcamentoUsuario(IdUsuario: Integer): Boolean;

    function RelatorioRendimento(ADataInicial, ADataFinal: string; AFiltro: TFiltroUsuario): string;

    function HorarioAcessoSistema(AUserName, ASenha: string; AIdUsuario: Integer = 0): Boolean;
  end;

implementation

{ TUsuario }

uses uGeral, uContaEmail, uContaEmailVO;

procedure TUsuario.CadastrarUsuario;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  try
    lQry.Connection := dm.Conexao;
    lQry.ExecSQL('EXECUTE Usuario_sp_Incluir');
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.DiasTrabalhados(ADataInicial,
  ADataFinal: TDate): TObjectList<TUsuarioVO>;
var
  obj: TFireDAC;
  sql: string;
  sDataInicial: string;
  sDataFinal: string;
  Model: TUsuarioVO;
  Lista: TObjectList<TUsuarioVO>;
begin
  sDataInicial := TFuncoes.DataIngles(DateToStr(ADataInicial));
  sDataFinal := TFuncoes.DataIngles(DateToStr(ADataFinal));

  sql := '';
  sql := sql + 'SELECT';
  sql := sql + ' Usu_Id,';
  sql := sql + ' dbo.UsuarioRendimentoDias(Usu_id, ' + sDataInicial + ',' + sDataFinal +')';
  sql := sql + ' FROM Usuario';

  Lista := TObjectList<TUsuarioVO>.create();
  obj := TFireDAC.create;
  try
    obj.OpenSQL(sql);
    while not obj.Model.Eof do
    begin
      Model := TUsuarioVO.Create;
      Model.Id := obj.Model.Fields[0].AsInteger;
      Model.QtdeDias := obj.Model.Fields[1].AsInteger;
      Lista.Add(Model);
      obj.Model.Next;
    end;

    Result := Lista;

  finally
    FreeAndNil(obj);
  end;
end;

function TUsuario.Editar(Programa, IdUsuario: Integer): Boolean;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    Result := usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TUsuario.Excluir(Programa, IdUsuario, Id: Integer);
begin
  PermissaoExcluir(Programa, Id);
  DM.ExecutarSQL('DELETE FROM Usuario WHERE Usu_Id = ' + IntToStr(Id));
end;

function TUsuario.ExecutarPermissao(Programa, IdUsuario: Integer;
  Permissao: string): Boolean;
var
//  lQry: TFDQuery;
  bPermissao: Boolean;
begin
  bPermissao := RetornaPermissao(Programa, IdUsuario, Permissao);

  if Permissao = 'Editar' then
    Result := bPermissao
  else begin
    if bPermissao = False then
      raise Exception.Create('Usu�rio sem Permiss�o');

//    if lQry.FieldByName(Permissao).AsBoolean = False then
//      raise Exception.Create('Usu�rio sem Permiss�o');
  end;

  Result := bPermissao;


//  Result := True;
//  lQry := TFDQuery.Create(Nil);
//  try
//    lQry.Connection := DM.Conexao;
//    lQry.SQL.Text := RetornaSQL;
//
//    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
//    lQry.ParamByName('Programa').AsInteger := Programa;
//    lQry.Open();
//
//    if lQry.IsEmpty then
//      raise Exception.Create('Programa n�o Encontrado!');
//
//    if Permissao = 'Editar' then
//      Result := lQry.FieldByName(Permissao).AsBoolean
//    else begin
//      if lQry.FieldByName(Permissao).AsBoolean = False then
//        raise Exception.Create('Usu�rio sem Permiss�o');
//    end;
//  finally
//    FreeAndNil(lQry);
//  end;
end;

function TUsuario.ExecutarPermissaoAgendamentoQuadro(
  IdUsuario: Integer): Boolean;
var
  lQry: TFDQuery;
begin
  Result := True;
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQLAgendamento;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Usu�rio n�o tem Departamento.');

    Result := lQry.FieldByName('Quadro').AsBoolean;

  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.ExecutarPermissaoAtividade(IdUsuario, Tipo: Integer): Boolean;
var
  lQry: TFDQuery;
begin
  Result := True;
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQLAtividade;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Usu�rio n�o tem Departamento.');

    case Tipo of
      1: Result := lQry.FieldByName('Abertura').AsBoolean;
      2: Result := lQry.FieldByName('Ocorrencia').AsBoolean;
      3: Result := lQry.FieldByName('Status').AsBoolean;
      4: Result := lQry.FieldByName('Quadro').AsBoolean;
    end;
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.ExecutarPermissaoChamado(IdUsuario, Tipo: Integer): Boolean;
var
  lQry: TFDQuery;
begin
  Result := True;
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQLChamado;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Usu�rio n�o tem Departamento.');

    case Tipo of
      1: Result := lQry.FieldByName('Abertura').AsBoolean;
      2: Result := lQry.FieldByName('Ocorrencia').AsBoolean;
      3: Result := lQry.FieldByName('Status').AsBoolean;
      4: Result := lQry.FieldByName('Quadro').AsBoolean;
    end;
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.ExecutarPermissaoSolicitacao(IdUsuario, Tipo: Integer): Boolean;
var
  lQry: TFDQuery;
begin
  Result := True;
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQLSolicitacao;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Usu�rio n�o tem Departamento.');

    case Tipo of
      1: Result := lQry.FieldByName('Abertura').AsBoolean;
      2: Result := lQry.FieldByName('Analise').AsBoolean;
      3: Result := lQry.FieldByName('OcorGeral').AsBoolean;
      4: Result := lQry.FieldByName('OcorTecnica').AsBoolean;
      5: Result := lQry.FieldByName('Status').AsBoolean;
      6: Result := lQry.FieldByName('Quadro').AsBoolean;
      7: Result := lQry.FieldByName('OcorRegra').AsBoolean;
    end;
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.ExisteUsuario: Boolean;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT COUNT(*) FROM Usuario');
    Result := (obj.Model.Fields[0].AsInteger > 0);
    obj.Model.Close();
  finally
    FreeAndNil(obj);
  end;
end;

function TUsuario.Exportar(): TObjectList<TUsuarioVO>;
var
  obj: TFireDAC;
  sb: TStringBuilder;
  model: TUsuarioVO;
  lista: TObjectList<TUsuarioVO>;
begin
  sb := TStringBuilder.Create;
  obj := TFireDAC.create;
  try
    sb.AppendLine('SELECT');
    sb.AppendLine(' Usu_Id,');
    sb.AppendLine('  Usu_Codigo ,');
    sb.AppendLine('  Usu_UserName ,');
    sb.AppendLine('  Usu_Nome ,');
    sb.AppendLine('  Usu_Password ,');
    sb.AppendLine('  Usu_Email ,');
    sb.AppendLine('  Usu_Revenda ,');
    sb.AppendLine('  Usu_Cliente ,');
    sb.AppendLine('  Usu_OnLine ,');
    sb.AppendLine('  Usu_Adm ,');
    sb.AppendLine('  Usu_Ativo ,');
    sb.AppendLine('  Usu_Notificar ,');
    sb.AppendLine('  Usu_Departamento ,');
    sb.AppendLine('  Usu_ContaEmail');
    sb.AppendLine(' FROM Usuario');
    sb.AppendLine(' WHERE Usu_Ativo = 1');
    obj.OpenSQL(sb.ToString());

    lista := TObjectList<TUsuarioVO>.Create();

    while not obj.Model.Eof do
    begin
      model := TUsuarioVO.Create;
      model.Id := obj.Model.FieldByName('Usu_Id').AsInteger;
      model.Codigo := obj.Model.FieldByName('Usu_Codigo').AsInteger;
      model.UserName := obj.Model.FieldByName('Usu_UserName').AsString;
      model.Nome := obj.Model.FieldByName('Usu_Nome').AsString;
      model.Password := obj.Model.FieldByName('Usu_Password').AsString;
      model.Email := obj.Model.FieldByName('Usu_Email').AsString;
      model.IdRevenda := obj.Model.FieldByName('Usu_Revenda').AsInteger;
      model.IdCliente := obj.Model.FieldByName('Usu_Cliente').AsInteger;
      model.OnLine := obj.Model.FieldByName('Usu_OnLine').AsBoolean;
      model.Adm := obj.Model.FieldByName('Usu_Adm').AsBoolean;
      model.Ativo := obj.Model.FieldByName('Usu_Ativo').AsBoolean;
      model.Notificar := obj.Model.FieldByName('Usu_Notificar').AsBoolean;
      model.IdDepartamento := obj.Model.FieldByName('Usu_Departamento').AsInteger;
      model.IdContaEmail := obj.Model.FieldByName('Usu_ContaEmail').AsInteger;
      obj.Model.Next;
      lista.Add(model);
    end;
    Result := lista;
  finally
    FreeAndNil(sb);
    FreeAndNil(obj);
  end;
end;

function TUsuario.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;
  if Ativo <> 'T' then
  begin
    if Ativo = 'A' then
      sConsulta := sConsulta + ' AND Usu_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Usu_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TUsuario.Filtrar(Filtro: TFiltroUsuario; Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;
  if Ativo <> 'T' then
  begin
    if Ativo = 'A' then
      sConsulta := sConsulta + ' AND Usu_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Usu_Ativo = 0';
  end;

  if Filtro.IdCliente <> '' then
    sConsulta := sConsulta + ' AND Usu_Cliente = ' + Filtro.IdCliente;

  if Filtro.IdRevenda <> '' then
    sConsulta := sConsulta + ' AND Usu_Revenda = ' + Filtro.IdRevenda;

  if Filtro.IdDepartamento <> '' then
    sConsulta := sConsulta + ' AND Usu_Departamento = ' + Filtro.IdDepartamento;

  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TUsuario.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE Usu_Codigo = ' + Codigo.ToString();
end;

function TUsuario.HorarioAcessoSistema(AUserName, ASenha: string; AIdUsuario: Integer = 0): Boolean;
var
  obj: TFireDAC;
  sb: TStringBuilder;
  horaInicial: string;
  horaFinal: string;
  horaAtual: string;
begin
  Result := True;
  sb := TStringBuilder.Create;
  obj := TFireDAC.create;
  try
    sb.AppendLine('SELECT Dep_HoraAtendeInicial, Dep_HoraAtendeFinal FROM Usuario Usu');
    sb.AppendLine(' INNER JOIN Departamento Dep ON Usu.Usu_Departamento = Dep.Dep_Id');

    if AIdUsuario = 0 then
      sb.AppendLine(' WHERE Usu_UserName = ' + QuotedStr(AUserName) + ' AND Usu_Password = ' + QuotedStr(ASenha))
    else
      sb.AppendLine(' WHERE Usu_Id = ' + IntToStr(AIdUsuario));

    obj.OpenSQL(sb.ToString());


    horaInicial := obj.Model.FieldByName('Dep_HoraAtendeInicial').AsString;
    horaFinal := obj.Model.FieldByName('Dep_HoraAtendeFinal').AsString;

    horaInicial := TimeToStr(StrToTimeDef(horaInicial,0));
    horaFinal := TimeToStr(StrToTimeDef(horaFinal,0));

    horaAtual := TimeToStr(Time);

    if (StrToTime(horaInicial) > 0) and (StrToTime(horaFinal) > 0) then
    begin
      if ((StrToTime(horaAtual) >= StrToTime(horaInicial)) and ((StrToTime(horaAtual) <= StrToTime(horaFinal))))  then
        Result := True
      else
        Result := False;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(sb);
  end;
end;

procedure TUsuario.IncluirManualmente;
var
  model: TUsuarioVO;
  Departamento: TDepartamento;
begin
  model := TUsuarioVO.Create;
  Departamento := TDepartamento.Create;
  try
    model.Id := 0;
    model.Codigo := 1;
    model.UserName := 'PERF';
    model.Nome := 'PERF';
    model.Password := '123';
    model.Email := 'email';
    model.IdRevenda := 0;
    model.IdCliente := 0;
    model.OnLine := False;
    model.Adm := True;
    model.Ativo := True;
    model.Notificar := False;
    model.IdDepartamento := Departamento.LocalizarUmRegistro();
    model.IdContaEmail := 0;
    Salvar(model);
  finally
    FreeAndNil(model);
    FreeAndNil(Departamento);
  end;
end;

procedure TUsuario.LocalizarCodigo(var Qry: TFDQuery; Codigo,
  IdUsuario: integer; AMensagem: Boolean = True);
var
  lQry: TFDQuery;
  InstrucaoSQL: string;
  obj: TUsuario;
begin
  obj := TUsuario.Create;
  try
    InstrucaoSQL := CConsulta;
    InstrucaoSQL := InstrucaoSQL + ' WHERE Usu_Codigo = ' + IntToStr(Codigo);
    InstrucaoSQL := InstrucaoSQL + obj.RetornaPermissaoUsuarioDepartamentoCodigo(IdUsuario);
  finally
    FreeAndNil(obj);
  end;

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := InstrucaoSQL;
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
      begin
        if AMensagem then
          raise Exception.Create(CRegistroNaoEncontrado);
      end;

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Usu_Ativo').AsBoolean = False then
      begin
        LocalizarId(Qry, 0);
        if AMensagem then
          raise Exception.Create(CRegistroInativo);
      end;
    end
    else
      LocalizarId(Qry, 0);
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.LocalizarId(Id: integer): TUsuarioVO;
var
  Qry: TFDQuery;
  Usuario: TUsuarioVO;
  ContaEmail: TContaEmail;
  ContaEmailVO: TContaEmailVO;
begin
  Usuario := TUsuarioVO.Create;
  ContaEmail := TContaEmail.Create;
//  ContaEmailVO := TContaEmailVO;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dm.Conexao;
    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' Usu_Id, Usu_Codigo, Usu_UserName, Usu_Nome, Usu_Password, Usu_Email,');
    Qry.SQL.Add(' Usu_Revenda, Usu_Cliente, Usu_OnLine, Usu_Adm, Usu_Ativo, Usu_Notificar,');
    Qry.SQL.Add(' Usu_Departamento, Usu_ContaEmail');
    Qry.SQL.Add(' FROM Usuario');
    Qry.SQL.Add(' WHERE Usu_Id = ' + IntToStr(Id));
    Qry.Open();

    Usuario.id := Qry.FieldByName('Usu_Id').AsInteger;
    Usuario.Codigo := Qry.FieldByName('Usu_Codigo').AsInteger;
    Usuario.UserName := Qry.FieldByName('Usu_UserName').AsString;
    Usuario.Nome := Qry.FieldByName('Usu_Nome').AsString;
    Usuario.Password := Qry.FieldByName('Usu_Password').AsString;
    Usuario.Email := Qry.FieldByName('Usu_Email').AsString;
    Usuario.OnLine := Qry.FieldByName('Usu_OnLine').AsBoolean;
    Usuario.Adm := Qry.FieldByName('Usu_Adm').AsBoolean;
    Usuario.Ativo := Qry.FieldByName('Usu_Ativo').AsBoolean;
    Usuario.Notificar := Qry.FieldByName('Usu_Notificar').AsBoolean;
    Usuario.ContaEmail.Id := Qry.FieldByName('Usu_ContaEmail').AsInteger;
    Usuario.IdRevenda := Qry.FieldByName('Usu_Revenda').AsInteger;

    ContaEmailVO := ContaEmail.LocalizarId(Usuario.ContaEmail.Id);

    Usuario.ContaEmail.Codigo := ContaEmailVO.Codigo;
    Usuario.ContaEmail.Nome := ContaEmailVO.Nome;
    Usuario.ContaEmail.Email := ContaEmailVO.Email;
    Usuario.ContaEmail.Senha := ContaEmailVO.Senha;
    Usuario.ContaEmail.SMTP := ContaEmailVO.SMTP;
    Usuario.ContaEmail.Porta := ContaEmailVO.Porta;
    Usuario.ContaEmail.Ativo := ContaEmailVO.Ativo;
    Usuario.ContaEmail.Autenticar := ContaEmailVO.Autenticar;
    Usuario.ContaEmail.AutenticarSSL := ContaEmailVO.AutenticarSSL;


//    Usuario.ContaEmail := ContaEmail.LocalizarId(Usuario.ContaEmail.Id);
//
//    Usuario.ContaEmail.Codigo := Usuario.ContaEmail.Codigo;
//    Usuario.ContaEmail.Nome := Usuario.ContaEmail.Nome;
//    Usuario.ContaEmail.Email := Usuario.ContaEmail.Email;
//    Usuario.ContaEmail.Senha := Usuario.ContaEmail.Senha;
//    Usuario.ContaEmail.SMTP := Usuario.ContaEmail.SMTP;
//    Usuario.ContaEmail.Porta := Usuario.ContaEmail.Porta;
//    Usuario.ContaEmail.Ativo := Usuario.ContaEmail.Ativo;
//    Usuario.ContaEmail.Autenticar := Usuario.ContaEmail.Autenticar;
//    Usuario.ContaEmail.AutenticarSSL := Usuario.ContaEmail.AutenticarSSL;

    Result := Usuario;

  finally
    FreeAndNil(Qry);
    FreeAndNil(ContaEmail);
    FreeAndNil(ContaEmailVO);
  end;
end;

procedure TUsuario.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Usu_Id, Usu_Ativo FROM Usuario WHERE Usu_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Usu_Ativo').AsBoolean = False then
      begin
        LocalizarId(Qry, 0);
        raise Exception.Create(CRegistroInativo);
      end;
    end
    else
      LocalizarId(Qry, 0);
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TUsuario.LocalizarNome(var Qry: TFDQuery; Nome: string);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Usu_Id FROM Usuario WHERE Usu_Nome = ' + QuotedStr(Nome);
    lQry.Open();

    LocalizarId(Qry, lQry.Fields[0].AsInteger);
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TUsuario.LocalizarUsuario(var Qry: TFDQuery; UserName, Password: string);
var
  lQry: TFDQuery;
begin

  if (UpperCase(UserName) = 'PERF') and (Password = '12') then
    CadastrarUsuario();

  ParametrosSistema();

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Usu_Id, Usu_Ativo FROM Usuario WHERE Usu_UserName = ' + QuotedStr(UserName) + ' AND Usu_Password = ' + QuotedStr(Password);
    lQry.Open();

    if (Trim(UserName) <> '') and (Trim(Password) <> '')  then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create('Usu�rio ou Senha n�o cadastrado.');

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if Qry.FieldByName('Usu_Ativo').AsBoolean = False then
      begin
        LocalizarId(Qry, 0);
        raise Exception.Create(CRegistroInativo);
      end;

      if not (HorarioAcessoSistema(UserName, Password)) then
        raise Exception.Create('Hor�rio n�o dipon�vel para usar o SIDomper!');
    end
    else
      LocalizarId(Qry, 0);
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TUsuario.Novo(Programa, IdUsuario: Integer);
begin
  //
end;

procedure TUsuario.ParametrosSistema;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  try
    lQry.Connection := dm.Conexao;
    lQry.ExecSQL('EXECUTE Parametros_sp_Incluir');
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TUsuario.PermissaoAcessar(Programa, IdUsuario: Integer);
begin
  ExecutarPermissao(Programa, IdUsuario, 'Acessar');
end;

function TUsuario.PermissaoAgendamentoQuadro(IdUsuario: Integer): Boolean;
begin
  Result := ExecutarPermissaoAgendamentoQuadro(IdUsuario);
end;

function TUsuario.PermissaoAtividadeAbertura(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoAtividade(IdUsuario, 1);
end;

function TUsuario.PermissaoAtividadeOcorrencia(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoAtividade(IdUsuario, 2);
end;

function TUsuario.PermissaoAtividadeOcorrenciaAlterar(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Atividade_Ocorr_Alt');
end;

function TUsuario.PermissaoAtividadeOcorrenciaDataHora(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Atividade_Ocorr_Alt_Data_Hora');
end;

function TUsuario.PermissaoAtividadeOcorrenciaExcluir(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Atividade_Ocorr_Exc');
end;

function TUsuario.PermissaoAtividadeQuadro(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoAtividade(IdUsuario, 4);
end;

function TUsuario.PermissaoAtividadeStatus(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoAtividade(IdUsuario, 3);
end;

function TUsuario.PermissaoChamadoAbertura(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoChamado(IdUsuario, 1);
end;

function TUsuario.PermissaoChamadoOcorrencia(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoChamado(IdUsuario, 2);
end;

function TUsuario.PermissaoChamadoOcorrenciaAlterar(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Chamado_Ocorr_Alt');
end;

function TUsuario.PermissaoChamadoOcorrenciaDataHora(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Chamado_Ocorr_Alt_Data_Hora');
end;

function TUsuario.PermissaoChamadoOcorrenciaExcluir(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Chamado_Ocorr_Exc');
end;

function TUsuario.PermissaoChamadoQuadro(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoChamado(IdUsuario, 4);
end;

function TUsuario.PermissaoChamadoStatus(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoChamado(IdUsuario, 3);
end;

function TUsuario.PermissaoConferenciaTempoGeral(IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Conferencia_Tempo_Geral');
end;

function TUsuario.PermissaoEditar(Programa, IdUsuario: Integer): Boolean;
begin
  Result := ExecutarPermissao(Programa, IdUsuario, 'Editar');
end;

function TUsuario.PermissaoEditarADM(Programa, IdUsuario: Integer): Boolean;
var
  lQry: TFDQuery;
begin
  Result := True;

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQL;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.ParamByName('Programa').AsInteger := Programa;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Programa n�o Encontrado!');

    if (lQry.FieldByName('Editar').AsBoolean = False) and (lQry.FieldByName('Usu_Adm').AsBoolean = False)  then
      Result := False;
//      raise Exception.Create('Usu�rio sem Permiss�o');

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TUsuario.PermissaoExcluir(Programa, IdUsuario: Integer);
begin
  ExecutarPermissao(Programa, IdUsuario, 'Excluir');
end;

procedure TUsuario.PermissaoExcluirADM(Programa, IdUsuario: Integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQL;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.ParamByName('Programa').AsInteger := Programa;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Programa n�o Encontrado!');

    if (lQry.FieldByName('Excluir').AsBoolean = False) and (lQry.FieldByName('Usu_Adm').AsBoolean = False) then
      raise Exception.Create('Usu�rio sem Permiss�o');

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TUsuario.PermissaoIncluir(Programa, IdUsuario: Integer);
begin
  ExecutarPermissao(Programa, IdUsuario, 'Incluir');
end;

function TUsuario.PermissaoOrcamentoAlteracaoSituacao(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Orcamento_Alt_Situacao');
end;

function TUsuario.PermissaoOrcamentoUsuario(IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Orcamento_Usuario');
end;

procedure TUsuario.PermissaoRelatorio(Programa, IdUsuario: Integer);
begin
  ExecutarPermissao(Programa, IdUsuario, 'Relatorio');
end;

function TUsuario.PermissaoSiglas(IdUsuario: Integer; Sigla: string): Boolean;
var
  lQry: TFDQuery;
  obj: TFireDAC;
  bResult: Boolean;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT Usu_Adm FROM Usuario WHERE Usu_Id = ' + IntToStr(IdUsuario));
    bResult := obj.Model.Fields[0].AsBoolean;

    if bResult = False then
    begin
      obj.Lista.Clear();
      obj.Lista.Add('SELECT UsuP_Id FROM Usuario_Permissao ');
      obj.Lista.Add(' WHERE UsuP_Usuario = ' + IntToStr(IdUsuario));
      obj.Lista.Add(' AND UsuP_Sigla = ' + QuotedStr(Sigla));
      obj.OpenSQL();
      bResult := (obj.Model.Fields[0].AsInteger > 0);
    end;

    Result := bResult;

  finally
    FreeAndNil(obj);
  end;

//  lQry := TFDQuery.Create(nil);
//  try
//    lQry.Connection := dm.Conexao;
//    lQry.SQL.Add('SELECT UsuP_Id FROM Usuario_Permissao ');
//    lQry.SQL.Add(' WHERE UsuP_Usuario = ' + IntToStr(IdUsuario));
//    lQry.SQL.Add(' AND UsuP_Sigla = ' + QuotedStr(Sigla));
//    lQry.Open();
//
//    Result := (lQry.Fields[0].AsInteger > 0);
//  finally
//    FreeAndNil(lQry);
//  end;
end;

function TUsuario.PermissaoSolicitacaoAbertura(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoSolicitacao(IdUsuario, 1);
end;

function TUsuario.PermissaoSolicitacaoAnalise(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoSolicitacao(IdUsuario, 2);
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaGeral(
  IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoSolicitacao(IdUsuario, 3);
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaGeralAlterar(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Solicitacao_Ocorr_Geral_Alt');
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaGeralExcluir(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Solicitacao_Ocorr_Geral_Exc');
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaRegra(
  IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoSolicitacao(IdUsuario, 7);
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaRegraAlterar(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Solicitacao_Ocorr_Regra_Alt');
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaRegraExcluir(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Solicitacao_Ocorr_Regra_Exc');
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaTecnica(
  IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoSolicitacao(IdUsuario, 4);
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Solicitacao_Ocorr_Tecnica_Alt');
end;

function TUsuario.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(
  IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Solicitacao_Ocorr_Tecnica_Exc');
end;

function TUsuario.PermissaoSolicitacaoQuadro(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoSolicitacao(IdUsuario, 6);
end;

function TUsuario.PermissaoSolicitacaoStatus(IdUsuario: integer): Boolean;
begin
  Result := ExecutarPermissaoSolicitacao(IdUsuario, 5);
end;

function TUsuario.PermissaoSolicitacaoTempo(IdUsuario: Integer): Boolean;
begin
  Result := PermissaoSiglas(IdUsuario, 'Lib_Solicitacao_Tempo');
end;

function TUsuario.PermissaoUsuario(APrograma, AIdUsuario: Integer;
  AAcao: string): Boolean;
begin
  Result := RetornaPermissao(APrograma, AIdUsuario, AAcao);
end;

function TUsuario.ProximoCodigo: Integer;
var
  Geral: TGeral;
begin
  Geral := TGeral.Create;
  try
    Result := Geral.ProximoCodigo('Usuario', 'Usu_Codigo');
  finally
    FreeAndNil(Geral);
  end;
end;

function TUsuario.ProximoId: Integer;
var
  Geral: TGeral;
begin
  Geral := TGeral.Create;
  try
    Result := Geral.ProximoId('Usuario');
  finally
    FreeAndNil(Geral);
  end;
end;

procedure TUsuario.Relatorio(Programa, IdUsuario: Integer);
begin
  PermissaoRelatorio(Programa, IdUsuario);
end;

function TUsuario.RelatorioRendimento(ADataInicial, ADataFinal: string;
  AFiltro: TFiltroUsuario): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;

  sb.AppendLine(' SELECT ');
  sb.AppendLine('	  ''CHAM'' AS Tipo,');
  sb.AppendLine('   Usu_Id, ');
  sb.AppendLine('	  Usu_Codigo, ');
  sb.AppendLine('	  Usu_Nome, ');
  sb.AppendLine('	  Rev_Codigo, ');
  sb.AppendLine('	  Rev_Nome, ');
  sb.AppendLine('	  Dep_Codigo, ');
  sb.AppendLine('	  Dep_Nome, ');
  sb.AppendLine('   0 AS Valor,');
  sb.AppendLine('	  COUNT(DISTINCT Cha_id) AS Qtde, ');
  sb.AppendLine('	  SUM(ChOco_TotalHoras) AS Horas ');
  sb.AppendLine(' FROM Chamado_Ocorrencia ');
  sb.AppendLine('	  INNER JOIN Chamado ON ChOco_Chamado = Cha_Id ');
  sb.AppendLine('	  INNER JOIN Usuario ON ChOco_Usuario = Usu_Id ');
  sb.AppendLine('   INNER JOIN Departamento ON Usu_Departamento = Dep_Id ');
  sb.AppendLine('   INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
  sb.AppendLine('	  LEFT JOIN Revenda ON Usu_Revenda = Rev_Id ');
  sb.AppendLine(' WHERE Cha_TipoMovimento = 1 ');
  sb.AppendLine(' AND ChOco_Data BETWEEN ' + TFuncoes.DataIngles(ADataInicial) + ' AND ' + TFuncoes.DataIngles(ADataFinal));
  sb.AppendLine( RetornarFiltro(AFiltro) );
  sb.AppendLine(' GROUP BY ');
  sb.AppendLine('   Usu_Id, ');
  sb.AppendLine('	  Usu_Codigo, ');
  sb.AppendLine('	  Usu_Nome, ');
  sb.AppendLine('	  Rev_Codigo, ');
  sb.AppendLine('	  Rev_Nome, ');
  sb.AppendLine('	  Dep_Codigo, ');
  sb.AppendLine('	  Dep_Nome ');

  sb.AppendLine('	UNION ');
  sb.AppendLine('	SELECT ');
  sb.AppendLine('	  ''CHAC'' AS Tipo, ');
  sb.AppendLine('	  Usu_Id, ');
  sb.AppendLine('	  Usu_Codigo, ');
  sb.AppendLine('	  Usu_Nome,');
  sb.AppendLine('	  Rev_Codigo,');
  sb.AppendLine('	  Rev_Nome,');
  sb.AppendLine('	  Dep_Codigo,');
  sb.AppendLine('	  Dep_Nome,');
  sb.AppendLine('	  0 AS Valor,');
  sb.AppendLine('	  0 AS Qtde,');
  sb.AppendLine('	  SUM(ChaOcol_TotalHoras) AS Horas ');
  sb.AppendLine('	FROM  Chamado_Ocorr_Colaborador ');
  sb.AppendLine('	  INNER JOIN Chamado_Ocorrencia ON ChaOCol_ChamadoOcorrencia = ChOco_Id ');
  sb.AppendLine('	  INNER JOIN Chamado ON ChOco_Chamado = Cha_Id ');
  sb.AppendLine('	  INNER JOIN Usuario ON ChaOCol_Usuario = Usu_Id ');
  sb.AppendLine('	  INNER JOIN Departamento ON Usu_Departamento = Dep_Id ');
  sb.AppendLine('   INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
  sb.AppendLine('	  LEFT JOIN Revenda ON Usu_Revenda = Rev_Id ');
  sb.AppendLine('	  WHERE Cha_TipoMovimento = 1 ');
  sb.AppendLine('	  AND ChOco_Data BETWEEN ' + TFuncoes.DataIngles(ADataInicial) + ' AND ' + TFuncoes.DataIngles(ADataFinal));
  sb.AppendLine( RetornarFiltro(AFiltro) );
  sb.AppendLine('	GROUP BY ');
  sb.AppendLine('	    Usu_Id, ');
  sb.AppendLine('	  	Usu_Codigo,');
  sb.AppendLine('	  	Usu_Nome,');
  sb.AppendLine('	  	Rev_Codigo,');
  sb.AppendLine('	  	Rev_Nome,');
  sb.AppendLine('	  	Dep_Codigo,');
  sb.AppendLine('	  	Dep_Nome ');

  sb.AppendLine('	UNION ');
  sb.AppendLine('	SELECT ');
  sb.AppendLine('		''ATIV'' AS Tipo,');
  sb.AppendLine('	  Usu_Id,');
  sb.AppendLine('		Usu_Codigo,');
  sb.AppendLine('		Usu_Nome,');
  sb.AppendLine('		Rev_Codigo,');
  sb.AppendLine('		Rev_Nome,');
  sb.AppendLine('		Dep_Codigo,');
  sb.AppendLine('		Dep_Nome,');
  sb.AppendLine('	  0 AS Valor,');
  sb.AppendLine('		COUNT(DISTINCT Cha_id) AS Qtde,');
  sb.AppendLine('		SUM(ChOco_TotalHoras) AS Horas ');
  sb.AppendLine('	FROM Chamado_Ocorrencia ');
  sb.AppendLine('	  INNER JOIN Chamado ON ChOco_Chamado = Cha_Id ');
  sb.AppendLine('		INNER JOIN Usuario ON ChOco_Usuario = Usu_Id ');
  sb.AppendLine('		INNER JOIN Departamento ON Usu_Departamento = Dep_Id ');
  sb.AppendLine('   INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
  sb.AppendLine('		LEFT JOIN Revenda ON Usu_Revenda = Rev_Id ');
  sb.AppendLine('	WHERE Cha_TipoMovimento = 2 ');
  sb.AppendLine('	AND ChOco_Data BETWEEN ' + TFuncoes.DataIngles(ADataInicial) + ' AND ' + TFuncoes.DataIngles(ADataFinal));
  sb.AppendLine( RetornarFiltro(AFiltro) );
  sb.AppendLine('	GROUP BY ');
  sb.AppendLine('	  Usu_Id,');
  sb.AppendLine('		Usu_Codigo,');
  sb.AppendLine('		Usu_Nome,');
  sb.AppendLine('		Rev_Codigo,');
  sb.AppendLine('		Rev_Nome,');
  sb.AppendLine('		Dep_Codigo,');
  sb.AppendLine('		Dep_Nome ');

  sb.AppendLine('	UNION ');
  sb.AppendLine('	SELECT ');
  sb.AppendLine('		''ATIC'' AS Tipo, ');
  sb.AppendLine('	  Usu_Id,');
  sb.AppendLine('		Usu_Codigo,');
  sb.AppendLine('		Usu_Nome,');
  sb.AppendLine('		Rev_Codigo,');
  sb.AppendLine('		Rev_Nome,');
  sb.AppendLine('		Dep_Codigo,');
  sb.AppendLine('		Dep_Nome,');
  sb.AppendLine('	  0 AS Valor,');
  sb.AppendLine('		0 AS Qtde,');
  sb.AppendLine('		SUM(ChaOcol_TotalHoras) AS Horas ');
  sb.AppendLine('	 FROM Chamado_Ocorr_Colaborador ');
  sb.AppendLine('		INNER JOIN Chamado_Ocorrencia ON ChaOCol_ChamadoOcorrencia = ChOco_Id ');
  sb.AppendLine('		INNER JOIN Chamado ON ChOco_Chamado = Cha_Id ');
  sb.AppendLine('		INNER JOIN Usuario ON ChaOCol_Usuario = Usu_Id ');
  sb.AppendLine('		INNER JOIN Departamento ON Usu_Departamento = Dep_Id ');
  sb.AppendLine('   INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
  sb.AppendLine('		LEFT JOIN Revenda ON Usu_Revenda = Rev_Id ');
  sb.AppendLine('	 WHERE Cha_TipoMovimento = 2 ');
  sb.AppendLine('	 AND ChOco_Data BETWEEN ' + TFuncoes.DataIngles(ADataInicial) + ' AND ' + TFuncoes.DataIngles(ADataFinal));
  sb.AppendLine( RetornarFiltro(AFiltro) );
  sb.AppendLine('	 GROUP BY ');
  sb.AppendLine('	  Usu_Id,');
  sb.AppendLine('		Usu_Codigo,');
  sb.AppendLine('		Usu_Nome,');
  sb.AppendLine('		Rev_Codigo,');
  sb.AppendLine('		Rev_Nome,');
  sb.AppendLine('		Dep_Codigo,');
  sb.AppendLine('		Dep_Nome ');

  sb.AppendLine('	 UNION ');
  sb.AppendLine('	 SELECT ');
  sb.AppendLine('		''VISI'' AS Tipo,');
  sb.AppendLine('	  Usu_Id,');
  sb.AppendLine('		Usu_Codigo,');
  sb.AppendLine('		Usu_Nome,');
  sb.AppendLine('		Rev_Codigo,');
  sb.AppendLine('		Rev_Nome,');
  sb.AppendLine('		Dep_Codigo,');
  sb.AppendLine('		Dep_Nome,');
  sb.AppendLine('	  SUM(Vis_Valor) AS Valor,');
  sb.AppendLine('		COUNT(Vis_id) AS Qtde,');
  sb.AppendLine('		SUM(Vis_TotalHoras) AS Horas ');
  sb.AppendLine('	 FROM Visita ');
  sb.AppendLine('		INNER JOIN Usuario ON Vis_Usuario = Usu_Id ');
  sb.AppendLine('		INNER JOIN Departamento ON Usu_Departamento = Dep_Id ');
  sb.AppendLine('   INNER JOIN Cliente ON Vis_Cliente = Cli_Id');
  sb.AppendLine('		LEFT JOIN Revenda ON Usu_Revenda = Rev_Id ');
  sb.AppendLine('	 WHERE Vis_Data BETWEEN ' + TFuncoes.DataIngles(ADataInicial) + ' AND ' + TFuncoes.DataIngles(ADataFinal));
  sb.AppendLine( RetornarFiltro(AFiltro) );
  sb.AppendLine('	 GROUP BY ');
  sb.AppendLine('	  Usu_Id,');
  sb.AppendLine('		Usu_Codigo,');
  sb.AppendLine('		Usu_Nome,');
  sb.AppendLine('		Rev_Codigo,');
  sb.AppendLine('		Rev_Nome,');
  sb.AppendLine('		Dep_Codigo,');
  sb.AppendLine('		Dep_Nome ');

  sb.AppendLine('	UNION');
  sb.AppendLine('	SELECT ');
  sb.AppendLine('	 	''TEMP'' AS Tipo,');
  sb.AppendLine('	   Usu_Id,');
  sb.AppendLine('	 	Usu_Codigo,');
  sb.AppendLine('	 	Usu_Nome,');
  sb.AppendLine('	 	Rev_Codigo,');
  sb.AppendLine('	 	Rev_Nome,');
  sb.AppendLine('	 	Dep_Codigo,');
  sb.AppendLine('	 	Dep_Nome,');
  sb.AppendLine('	   0 AS Valor,');
  sb.AppendLine('	 	0 AS Qtde,');
  sb.AppendLine('	 	SUM(STemp_TotalHoras) AS Horas ');
  sb.AppendLine('	FROM Solicitacao_Tempo ');
  sb.AppendLine('	INNER JOIN Usuario ON STemp_UsuarioOperacional = Usu_Id ');
  sb.AppendLine('	INNER JOIN Departamento ON Usu_Departamento = Dep_Id ');
  sb.AppendLine(' LEFT JOIN Cliente ON Usu_Cliente = Cli_Id');
  sb.AppendLine('	LEFT JOIN Revenda ON Usu_Revenda = Rev_Id ');
  sb.AppendLine('	WHERE STemp_Data BETWEEN ' + TFuncoes.DataIngles(ADataInicial) + ' AND ' + TFuncoes.DataIngles(ADataFinal));
  sb.AppendLine( RetornarFiltro(AFiltro) );
  sb.AppendLine('	GROUP BY ');
  sb.AppendLine('	   Usu_Id,');
  sb.AppendLine('	 	Usu_Codigo,');
  sb.AppendLine('	 	Usu_Nome,');
  sb.AppendLine('	 	Rev_Codigo,');
  sb.AppendLine('	 	Rev_Nome,');
  sb.AppendLine('	 	Dep_Codigo,');
  sb.AppendLine('	 	Dep_Nome ');

  Result := sb.ToString();
  FreeAndNil(sb);
end;

function TUsuario.RetornaPermissao(Programa, IdUsuario: Integer;
  Permissao: string): Boolean;
var
  lQry: TFDQuery;
begin
  Result := True;
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQL;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.ParamByName('Programa').AsInteger := Programa;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Programa n�o Encontrado!');

    Result := lQry.FieldByName(Permissao).AsBoolean;
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.RetornaPermissaoUsuarioDepartamento(IdUsuario: Integer): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.AppendLine(' AND EXISTS(');
    sb.AppendLine(' 	SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Usu_Revenda IS NULL))');
    sb.AppendLine(' 	AND Usu_Id = ' + IntToStr(IdUsuario) + ')');

    sb.AppendLine(' AND EXISTS(');
    sb.AppendLine(' 	SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cliente IS NULL))');
    sb.AppendLine(' 	AND Usu_Id = ' + IntToStr(IdUsuario) + ')');
    Result := sb.ToString();
  finally
    FreeAndNil(sb);
  end;
end;

function TUsuario.RetornaPermissaoUsuarioDepartamentoCodigo(
  IdUsuario: Integer): string;
var
  sConsulta: string;
begin
  sConsulta := '';
  sConsulta := sConsulta + ' AND EXISTS(';
  sConsulta := sConsulta + '    SELECT 1 FROM Usuario U2';
  sConsulta := sConsulta + '      WHERE ((U1.Usu_Revenda = U2.Usu_Revenda) OR (u2.Usu_Revenda IS NULL))';
  sConsulta := sConsulta + '      AND u2.Usu_Id = ' + IntToStr(IdUsuario);
  sConsulta := sConsulta + ' )';

  Result := sConsulta;
end;

function TUsuario.RetornaPermissaoUsuarioModeloRelatorio(IdUsuario: integer): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.AppendLine(' AND EXISTS(');
    sb.AppendLine(' 	SELECT 1 FROM Usuario  WHERE (ModR_Revenda = Usu_Revenda) AND (Usu_Id = ' + IntToStr(IdUsuario) + '))');
    sb.AppendLine(' OR EXISTS(	');
    sb.AppendLine(' SELECT 1 FROM Usuario WHERE (Usu_Revenda IS NULL) AND (ModR_Revenda IS NULL) AND (Usu_Id = ' + IntToStr(IdUsuario) + ')');
    sb.AppendLine(' 	)');

    Result := sb.ToString;
  finally
    FreeAndNil(sb);
  end;
end;

function TUsuario.RetornarFiltro(AFiltro: TFiltroUsuario): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;

  if AFiltro.IdCliente <> '' then
    sb.AppendLine(' AND Cli_Id IN ' + AFiltro.IdCliente);

  if AFiltro.IdRevenda <> '' then
    sb.AppendLine(' AND Rev_Id IN ' + AFiltro.IdRevenda);

  if AFiltro.IdDepartamento <> '' then
    sb.AppendLine(' AND Dep_Id IN ' + AFiltro.IdDepartamento);

  Result := sb.ToString();

  FreeAndNil(sb);
end;

function TUsuario.PermissaoRecadoQuadro(IdUsuario: Integer): Boolean;
var
  lQry: TFDQuery;
begin
  Result := True;
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := RetornaSQL;

    lQry.ParamByName('IdUsuario').AsInteger := IdUsuario;
    lQry.ParamByName('Programa').AsInteger := CRecadoPrograma;
    lQry.Open();

    if lQry.IsEmpty then
      raise Exception.Create('Programa n�o Encontrado!');

    Result := lQry.FieldByName('Acessar').AsBoolean;
  finally
    FreeAndNil(lQry);
  end;
end;

function TUsuario.RetornaSQL: string;
begin
  Result := 'SELECT'
                +'  DepAc_Acesso AS Acessar,'
                +'  DepAc_Editar AS Editar,'
                +'  DepAc_Excluir AS Excluir,'
                +'  DepAc_Incluir AS Incluir,'
                +'  DepAc_Relatorio AS Relatorio,'
                +'  Usu_Adm '
                +' FROM Usuario'
                +'  INNER JOIN Departamento ON Usu_Departamento = Dep_Id'
                +'  INNER JOIN Departamento_Acesso ON Dep_Id = DepAc_Departamento'
                +' WHERE Usu_Id = :IdUsuario'
                +' AND DepAc_Programa = :Programa';
end;

function TUsuario.RetornaSQLAgendamento: string;
begin
  Result := 'SELECT'
                +'  Dep_AgendamentoQuadro AS Quadro'
                +' FROM Usuario'
                +'  INNER JOIN Departamento ON Usu_Departamento = Dep_Id'
                +'  INNER JOIN Departamento_Acesso ON Dep_Id = DepAc_Departamento'
                +' WHERE Usu_Id = :IdUsuario';
end;

function TUsuario.RetornaSQLAtividade: string;
begin
  Result := 'SELECT'
                +'  Dep_AtividadeAbertura AS Abertura,'
                +'  Dep_AtividadeOcor AS Ocorrencia,'
                +'  Dep_AtividadeStatus AS Status,'
                +'  Dep_AtividadeQuadro AS Quadro,'
                +'  Usu_Adm '
                +' FROM Usuario'
                +'  INNER JOIN Departamento ON Usu_Departamento = Dep_Id'
                +'  INNER JOIN Departamento_Acesso ON Dep_Id = DepAc_Departamento'
                +' WHERE Usu_Id = :IdUsuario';
end;

function TUsuario.RetornaSQLChamado: string;
begin
  Result := 'SELECT'
                +'  Dep_ChamadoAbertura AS Abertura,'
                +'  Dep_ChamadoOcor AS Ocorrencia,'
                +'  Dep_ChamadoStatus AS Status,'
                +'  Dep_ChamadoQuadro AS Quadro,'
                +'  Usu_Adm '
                +' FROM Usuario'
                +'  INNER JOIN Departamento ON Usu_Departamento = Dep_Id'
                +'  INNER JOIN Departamento_Acesso ON Dep_Id = DepAc_Departamento'
                +' WHERE Usu_Id = :IdUsuario';
end;

function TUsuario.RetornaSQLSolicitacao: string;
begin
  Result := 'SELECT'
                +'  Dep_SolicitaAbertura AS Abertura,'
                +'  Dep_SolicitaAnalise AS Analise,'
                +'  Dep_SolicitaOcorGeral AS OcorGeral,'
                +'  Dep_SolicitaOcorTecnica AS OcorTecnica,'
                +'  Dep_SolicitaOcorRegra AS OcorRegra,'
                +'  Dep_SolicitaStatus AS Status,'
                +'  Dep_SolicitaQuadro AS Quadro,'
                +'  Usu_Adm '
                +' FROM Usuario'
                +'  INNER JOIN Departamento ON Usu_Departamento = Dep_Id'
                +'  INNER JOIN Departamento_Acesso ON Dep_Id = DepAc_Departamento'
                +' WHERE Usu_Id = :IdUsuario';
end;

function TUsuario.Salvar(AUsuario: TUsuarioVO): Integer;
begin
  if AUsuario.Codigo <= 0 then
    raise Exception.Create('Informe o C�digo');

  if AUsuario.UserName.Trim = '' then
    raise Exception.Create('Informe o UserName!');

  if AUsuario.Nome.Trim = '' then
    raise Exception.Create('Informe o Nome!');
  if AUsuario.Password.Trim = '' then
    raise Exception.Create('Informe o Password!');
  if AUsuario.Email.Trim = '' then
    raise Exception.Create('Informe o Email!');
  if AUsuario.IdDepartamento <= 0 then
    raise Exception.Create('Informe o Departamento!');

  Result := TGenericDAO.Save<TUsuarioVO>(AUsuario);
end;

procedure TUsuario.Salvar(Programa, IdUsuario: Integer);
begin
  // ver permissao para alterar
end;

function TUsuario.UsuarioADM(AIdUsuario: Integer): Boolean;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT Usu_Adm FROM Usuario WHERE Usu_Id = ' + IntToStr(AIdUsuario));
    Result := obj.Model.Fields[0].AsBoolean;
  finally
    FreeAndNil(obj);
  end;
end;

function TUsuario.Filtrar(Filtro: TFiltroUsuario; IdUsuario: Integer; Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;
  sConsulta := sConsulta + RetornaPermissaoUsuarioDepartamentoCodigo(IdUsuario);

  if Filtro.IdCliente <> '' then
    sConsulta := sConsulta + ' AND U1.Usu_Cliente = ' + Filtro.IdCliente;

  if Filtro.IdRevenda <> '' then
    sConsulta := sConsulta + ' AND U1.Usu_Revenda = ' + Filtro.IdRevenda;

  if Filtro.IdDepartamento <> '' then
    sConsulta := sConsulta + ' AND U1.Usu_Departamento = ' + Filtro.IdDepartamento;

  if Ativo <> 'T' then
  begin
    if Ativo = 'A' then
      sConsulta := sConsulta + ' AND Usu_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Usu_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

end.

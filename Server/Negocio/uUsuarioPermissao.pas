unit uUsuarioPermissao;

interface

uses System.Generics.Collections, Data.DB, FireDAC.Comp.Client, uDM, System.SysUtils,
  Data.DBXJSON, uUsuarioPermissaoVO, uFireDAC;

type
  TUsuarioPermissao = class
  private

  public
//    function PreencherLista: string; overload;
    function PreencherLista: TJSONArray; overload;
    procedure ExcluirLista(IdUsuario: integer);
    procedure Salvar(IdUsuario: Integer; Sigla: string);
    function Exportar(): TObjectList<TUsuarioPermissaoVO>;
  end;


implementation

{ TUsuarioPermissao }

procedure TUsuarioPermissao.ExcluirLista(IdUsuario: integer);
var
  Sql: TFDQuery;
begin
  Sql := TFDQuery.Create(nil);
  try
    Sql.Connection := dm.Conexao;
    Sql.SQL.Text := ' DELETE FROM Usuario_Permissao WHERE UsuP_Usuario = ' + IdUsuario.ToString();
    Sql.ExecSQL();
  finally
    FreeAndNil(Sql);
  end;
end;

//function TUsuarioPermissao.PreencherLista: string;
//var
//  lista: string;
//begin
//  lista :=  'Lib_Chamado_Ocorr_Alt_Data_Hora;' +
//            'Lib_Chamado_Ocorr_Alt;' +
//            'Lib_Chamado_Ocorr_Exc;' +
//            'Lib_Solicitacao_Ocorr_Geral_Alt;' +
//            'Lib_Solicitacao_Ocorr_Geral_Exc;' +
//            'Lib_Solicitacao_Ocorr_Tecnica_Alt;' +
//            'Lib_Solicitacao_Ocorr_Tecnica_Exc;';
//  Result := lista;
//end;

function TUsuarioPermissao.Exportar(): TObjectList<TUsuarioPermissaoVO>;
var
  model: TUsuarioPermissaoVO;
  obj: TFireDAC;
  lista: TObjectList<TUsuarioPermissaoVO>;
begin
  lista := TObjectList<TUsuarioPermissaoVO>.Create();
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT UsuP_Id, UsuP_Usuario, UsuP_Sigla FROM Usuario_Permissao');
    while not obj.Model.Eof do
    begin
      model := TUsuarioPermissaoVO.Create;

      model.Id := obj.Model.FieldByName('UsuP_Id').AsInteger;
      model.IdUsuario := obj.Model.FieldByName('UsuP_Usuario').AsInteger;
      model.Sigla := obj.Model.FieldByName('UsuP_Sigla').AsString;

      lista.Add(model);
      obj.Model.Next;
    end;
    Result := lista;
  finally
    FreeAndNil(obj);
  end;
end;

function TUsuarioPermissao.PreencherLista: TJSONArray;
var
  Lista: TJSONArray;
begin
  Lista := TJSONArray.Create;
  Lista.Add('Lib_Chamado_Ocorr_Alt_Data_Hora');
  Lista.Add('Lib_Chamado_Ocorr_Alt');
  Lista.Add('Lib_Chamado_Ocorr_Exc');
  Lista.Add('Lib_Solicitacao_Ocorr_Geral_Alt');
  Lista.Add('Lib_Solicitacao_Ocorr_Geral_Exc');
  Lista.Add('Lib_Solicitacao_Ocorr_Tecnica_Alt');
  Lista.Add('Lib_Solicitacao_Ocorr_Tecnica_Exc');
  Lista.Add('Lib_Solicitacao_Ocorr_Regra_Alt');
  Lista.Add('Lib_Solicitacao_Ocorr_Regra_Exc');
  Lista.Add('Lib_Atividade_Ocorr_Alt_Data_Hora');
  Lista.Add('Lib_Atividade_Ocorr_Alt');
  Lista.Add('Lib_Atividade_Ocorr_Exc');
  Lista.Add('Lib_Solicitacao_Tempo');
  Lista.Add('Lib_Conferencia_Tempo_Geral');
  Lista.Add('Lib_Orcamento_Alt_Situacao');
  Lista.Add('Lib_Orcamento_Usuario');

  Result := Lista;
end;

procedure TUsuarioPermissao.Salvar(IdUsuario: Integer; Sigla: string);
var
  Sql: TFDQuery;
begin
  Sql := TFDQuery.Create(nil);
  try
    Sql.Connection := dm.Conexao;
    Sql.SQL.Text := ' INSERT INTO Usuario_Permissao(UsuP_Usuario, UsuP_Sigla) VALUES (:IdUsuario, :Sigla)';
    Sql.ParamByName('IdUsuario').AsInteger := IdUsuario;
    Sql.ParamByName('Sigla').AsString := Sigla;
    Sql.ExecSQL();
  finally
    FreeAndNil(Sql);
  end;
end;

end.

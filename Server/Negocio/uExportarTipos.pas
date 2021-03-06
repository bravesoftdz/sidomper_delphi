unit uExportarTipos;

interface

uses
  System.SysUtils, System.Classes, uArquivoTexto, uDM, uFireDAC,
  uTipoVO, System.Generics.Collections, uGenericDAO;

type
  TExportarTipo = class
  private
    FArquivo: string;

  public
    procedure Exportar();
    function Importar(): TObjectList<TTipoVO>;

    constructor Create(); overload;
  end;


implementation

{ TExportarTipo }

constructor TExportarTipo.Create;
begin
  inherited Create;
  FArquivo := 'D:\DOMPER\SIDomper\Banco\Tipos.txt';
end;

procedure TExportarTipo.Exportar;
var
  obj: TFireDAC;
  Arq: TArquivoTexto;
begin
  obj := TFireDAC.create;
  Arq := TArquivoTexto.Create(FArquivo, tpExportar);
  try
    obj.OpenSQL('SELECT * FROM Tipo');
    while not obj.Model.Eof do
    begin
      Arq.ExportarInt(obj.Model.FieldByName('Tip_Codigo').AsInteger,      001, 005);
      Arq.ExportarString(obj.Model.FieldByName('Tip_Nome').AsString,      006, 050);
      Arq.ExportarBool(obj.Model.FieldByName('Tip_Ativo').AsBoolean);
      Arq.ExportarInt(obj.Model.FieldByName('Tip_Programa').AsInteger,    057, 005);
      Arq.ExportarString(obj.Model.FieldByName('Tip_Conceito').AsString,  062, 500);
      Arq.NovaLinha();
      obj.Model.Next;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Arq);
  end;
end;

function TExportarTipo.Importar: TObjectList<TTipoVO>;
var
  model: TTipoVO;
  lista: TObjectList<TTipoVO>;
  Arq: TArquivoTexto;
begin
  lista := TObjectList<TTipoVO>.Create();
  Arq := TArquivoTexto.Create(FArquivo, tpImportar);
  try
    while not (Arq.FimArquivo()) do
    begin
      Arq.ProximoRegistro();

      model := TTipoVO.Create;
      model.Id        := 0;
      model.Codigo    := Arq.ImportarInt(001, 005);
      model.Nome      := Arq.ImportarString(006, 050);
      model.Ativo     := Arq.ImportarBool(056, 001);
      model.Programa  := Arq.ImportarInt(057, 005);
      model.Conceito  := Arq.ImportarString(062, 500);

      lista.Add(model);
    end;
  finally
    FreeAndNil(Arq);
  end;
  Result := lista;

end;

end.

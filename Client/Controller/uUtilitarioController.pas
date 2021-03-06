unit uUtilitarioController;

interface

uses
  System.SysUtils, uRegras, uDM, Data.DB, uDMUtilitario;

type
  TUtilitarioController = class
  private
    FModel: TDMUtilitario;
  public
    procedure GerarBackup(Destino: string);
    procedure ListarTabelasBancoDados;
    procedure ListarCamposTabelaBancoDados(Tabela: string);
    procedure ExecutarSQL(ComandoSQL: string);
    procedure ExportarDadosBaseNova();
    procedure ImportarDadosBaseNova();

    property Model: TDMUtilitario read FModel write FModel;

    constructor Create();
    destructor  destroy; override;
  end;

implementation

{ TUtilitario }

constructor TUtilitarioController.Create;
begin
  inherited Create;
  FModel := TDMUtilitario.Create(nil);
end;

destructor TUtilitarioController.destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TUtilitarioController.ExecutarSQL(ComandoSQL: string);
var
  Negocio: TServerMethods1Client;
  iTipo: Integer;
begin
  iTipo := 1;
  if Copy(Trim(ComandoSQL.ToUpper),1,3) = 'SEL' then
    iTipo := 2;

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSInstrucaoSQL.Close;
      Negocio.InstrucaoSQL(ComandoSQL, iTipo);
      if iTipo = 2 then
        FModel.CDSInstrucaoSQL.Open;
      dm.Desconectar;
    except
      ON E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUtilitarioController.ExportarDadosBaseNova;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.ParametrosExportarDadosBaseNova();
      dm.Desconectar;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUtilitarioController.GerarBackup(Destino: string);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.Backup(Destino);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUtilitarioController.ImportarDadosBaseNova;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.ParametrosImportarDadosBaseNova();
      dm.Desconectar;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUtilitarioController.ListarCamposTabelaBancoDados(Tabela: string);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSListarCampos.Close;
    Negocio.ListarTabelasCamposBancoDados(Tabela);
    FModel.CDSListarCampos.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUtilitarioController.ListarTabelasBancoDados;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSListarTabelas.Close;
    Negocio.ListarTabelasBancoDados();
    FModel.CDSListarTabelas.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

end.

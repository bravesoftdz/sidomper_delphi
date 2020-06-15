unit uConfig;

interface

uses
  System.SysUtils, System.IniFiles, Vcl.Forms, Vcl.Dialogs;

type
  TConfig = class
  private
    FArquivo: string;
    FPorta: Integer;
    FDataBase: string;
    FServidor: string;
    FHostName: string;
    FUser_Name: string;
    FPassword: string;
    FEstiloTelas: string;
    FLifeCycle: string;
    FPortaStr: string;
    procedure SetEstiloTelas(const Value: string);
    procedure SetLifeCycle(const Value: string);

  public
    procedure Carregar;
    procedure Salvar;
    property Porta: Integer read FPorta write FPorta;
    property PortaStr: string read FPortaStr write FPortaStr;
    property DataBase: string read FDataBase write FDataBase;
    property Servidor: string read FServidor write FServidor;
    property HostName: string read FHostName write FHostName;
    property User_Name: string read FUser_Name write FUser_Name;
    property Password: string read FPassword write FPassword;
    property EstiloTelas: string read FEstiloTelas write SetEstiloTelas;
    property LifeCycle: string read FLifeCycle write SetLifeCycle;

    constructor create;
  end;

implementation

{ TConfig }

procedure TConfig.Carregar;
var
  ArqIni: TIniFile;
begin

  ArqIni := TIniFile.Create(FArquivo);
  try
    PortaStr := ArqIni.ReadString('Servidor', 'Porta', '');
    if UpperCase(PortaStr) = 'DOMPER' then
      FPorta := 211
    else
      FPorta        := ArqIni.ReadInteger('Servidor', 'Porta', 0);

    FDataBase     := ArqIni.ReadString('Servidor', 'DataBase', '');
    FServidor     := ArqIni.ReadString('Servidor', 'Servidor', '');
    FUser_Name    := ArqIni.ReadString('Servidor', 'User_Name', '');
    FLifeCycle    := ArqIni.ReadString('Servidor', 'LifeCycle', '');
    FHostName     := ArqIni.ReadString('Cliente', 'HostName', '');
    FEstiloTelas  := ArqIni.ReadString('Cliente', 'Stilo', '');

    if UpperCase(FHostName) = 'DOMPER' then
      FHostName := 'acesso.domper.com.br';
//      FHostName := '177.66.30.167';

    FPassword     := '12';
  finally
    FreeAndNil(ArqIni);
  end;
end;

constructor TConfig.create;
var
  sCaminho: string;
begin
  inherited create;
  sCaminho := ExtractFilePath(application.ExeName);
  sCaminho := sCaminho + 'Domper.ini';
  FArquivo := sCaminho;
end;

procedure TConfig.Salvar;
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(FArquivo);
  try
    if UpperCase(FPortaStr) = 'DOMPER' then
      ArqIni.WriteString('Servidor', 'Porta', FPortaStr)
    else
      ArqIni.WriteInteger('Servidor', 'Porta', FPorta);

    ArqIni.WriteString('Servidor', 'Servidor', FServidor);
    ArqIni.WriteString('Servidor', 'DataBase', FDataBase);
    ArqIni.WriteString('Servidor', 'User_Name', FUser_Name);

    if FHostName = '177.66.30.167' then
      FHostName := 'DOMPER';

    ArqIni.WriteString('Cliente', 'HostName', FHostName);
    ArqIni.WriteString('Cliente', 'Stilo', FEstiloTelas);
  finally
    FreeAndNil(ArqIni);
  end;

end;

procedure TConfig.SetEstiloTelas(const Value: string);
begin
  FEstiloTelas := Value;
end;

procedure TConfig.SetLifeCycle(const Value: string);
begin
  FLifeCycle := Value;
end;

end.

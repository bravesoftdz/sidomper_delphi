unit uDMRelEscala;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppProd, ppClass, ppReport, ppBands, ppVar, ppPrnabl,
  ppCtrls, ppCache, ppDesignLayer, ppParameter, uFuncoesSIDomper;

type
  TDMRelEscala = class(TDataModule)
    cdsRelatorio1: TClientDataSet;
    cdsRelatorio1Usu_Codigo: TIntegerField;
    cdsRelatorio1Usu_Nome: TWideStringField;
    cdsRelatorio1Esc_Usuario: TIntegerField;
    cdsRelatorio1Esc_Data: TDateField;
    cdsRelatorio1Esc_HoraFim: TTimeField;
    cdsRelatorio1Esc_HoraInicio: TTimeField;
    cdsRelatorio1Esc_TotalHoras: TFloatField;
    cdsRelatorio1TotalHoras: TFloatField;
    dsRelatorio1: TDataSource;
    DBRelatorio1: TppDBPipeline;
    Relatorio1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    lblTitulo1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    lblData1: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    cdsRelatorio1CHorasAtendimento: TStringField;
    cdsRelatorio1CHorasDisposicao: TStringField;
    cdsRelatorio1CDiaSemana: TStringField;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel8: TppLabel;
    lblRelatorio1A: TppLabel;
    lblRelatorio1b: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabel9: TppLabel;
    ppDBCalc2: TppDBCalc;
    lblRelatorio1C: TppLabel;
    lblRelatorio1D: TppLabel;
    ppLine2: TppLine;
    Relatorio1CalcTotalHoras1: TppDBCalc;
    Relatorio1CalcTotalAtend1: TppDBCalc;
    Relatorio1CalcTotalHoras2: TppDBCalc;
    Relatorio1CalcTotalAtend2: TppDBCalc;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    procedure cdsRelatorio1CalcFields(DataSet: TDataSet);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Impressao(AModelo: Integer; ADataInicial, ADataFinal: string);
  end;

var
  DMRelEscala: TDMRelEscala;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMRelEscala.cdsRelatorio1CalcFields(DataSet: TDataSet);
begin
  if cdsRelatorio1.State = dsInternalCalc then
  begin
    cdsRelatorio1CDiaSemana.AsString := FormatDateTime('dddd', cdsRelatorio1Esc_Data.AsDateTime);
    cdsRelatorio1CHorasDisposicao.AsString := TFuncoes.DecimalToHora(cdsRelatorio1Esc_TotalHoras.AsFloat);
    cdsRelatorio1CHorasAtendimento.AsString := TFuncoes.DecimalToHora(cdsRelatorio1TotalHoras.AsFloat);
  end;
end;

procedure TDMRelEscala.DataModuleCreate(Sender: TObject);
begin
  cdsRelatorio1.RemoteServer := dm.DSPConexao2;
end;

procedure TDMRelEscala.Impressao(AModelo: Integer; ADataInicial,
  ADataFinal: string);
begin
  if AModelo = 1 then
  begin
    lblData1.Caption := 'Per�odo de ' + ADataInicial + ' At� ' + ADataFinal;
    Relatorio1.Print;
  end;
end;

procedure TDMRelEscala.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  lblRelatorio1A.Caption := TFuncoes.DecimalToHora(Relatorio1CalcTotalHoras1.Value);
  lblRelatorio1B.Caption := TFuncoes.DecimalToHora(Relatorio1CalcTotalAtend1.Value);
end;

procedure TDMRelEscala.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  lblRelatorio1C.Caption := TFuncoes.DecimalToHora(Relatorio1CalcTotalHoras2.Value);
  lblRelatorio1D.Caption := TFuncoes.DecimalToHora(Relatorio1CalcTotalAtend2.Value);
end;

end.

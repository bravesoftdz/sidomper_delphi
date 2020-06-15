unit uDMRelVisita;

interface

uses
  System.SysUtils, System.Classes, uFuncoesSIDomper, uDM, Data.DB, Datasnap.DBClient,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppProd, ppClass, ppReport, ppDesignLayer,
  ppParameter, ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppStrtch, ppRichTx,
  System.Generics.Collections, uChamadoVO, ppMemo;

type
  TDMRelVisita = class(TDataModule)
    CDSRelVisitaModelo1: TClientDataSet;
    CDSRelVisitaModelo2: TClientDataSet;
    CDSRelVisitaModelo3: TClientDataSet;
    CDSRelVisitaModelo4: TClientDataSet;
    dsRelVisitaModelo1: TDataSource;
    dsRelVisitaModelo2: TDataSource;
    dsRelVisitaModelo3: TDataSource;
    dsRelVisitaModelo4: TDataSource;
    dbRelVisitaModelo1: TppDBPipeline;
    dbRelVisitaModelo2: TppDBPipeline;
    dbRelVisitaModelo3: TppDBPipeline;
    dbRelVisitaModelo4: TppDBPipeline;
    CDSRelVisitaModelo1Vis_Id: TAutoIncField;
    CDSRelVisitaModelo1Vis_Data: TDateField;
    CDSRelVisitaModelo1Vis_HoraInicio: TTimeField;
    CDSRelVisitaModelo1Vis_Dcto: TStringField;
    CDSRelVisitaModelo1Vis_HoraFim: TTimeField;
    CDSRelVisitaModelo1Vis_Contato: TStringField;
    CDSRelVisitaModelo1Vis_Descricao: TStringField;
    CDSRelVisitaModelo1Vis_TotalHoras: TFloatField;
    CDSRelVisitaModelo1Vis_FormaPagto: TStringField;
    CDSRelVisitaModelo1Tip_Nome: TWideStringField;
    CDSRelVisitaModelo1Sta_Nome: TWideStringField;
    CDSRelVisitaModelo1Cli_Codigo: TIntegerField;
    CDSRelVisitaModelo1Cli_Nome: TWideStringField;
    CDSRelVisitaModelo2Cli_Codigo: TIntegerField;
    CDSRelVisitaModelo2Cli_Nome: TWideStringField;
    CDSRelVisitaModelo2Rev_Codigo: TIntegerField;
    CDSRelVisitaModelo2Rev_Nome: TWideStringField;
    CDSRelVisitaModelo2QtdeChamados: TIntegerField;
    CDSRelVisitaModelo2TotalHoras: TFloatField;
    CDSRelVisitaModelo3Usu_Codigo: TIntegerField;
    CDSRelVisitaModelo3QtdeChamados: TIntegerField;
    CDSRelVisitaModelo3TotalHoras: TFloatField;
    CDSRelVisitaModelo4Tip_Codigo: TIntegerField;
    CDSRelVisitaModelo4Tip_Nome: TWideStringField;
    CDSRelVisitaModelo4Rev_Codigo: TIntegerField;
    CDSRelVisitaModelo4Rev_Nome: TWideStringField;
    CDSRelVisitaModelo4QtdeChamados: TIntegerField;
    CDSRelVisitaModelo4TotalHoras: TFloatField;
    RelVisitaModelo1: TppReport;
    RelVisitaModelo2: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    RelVisitaModelo3: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    RelVisitaModelo4: TppReport;
    ppParameterList3: TppParameterList;
    ppDesignLayers3: TppDesignLayers;
    ppParameterList4: TppParameterList;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    lblPeriodoModelo1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    CDSRelVisitaModelo1C_TotalHoras: TStringField;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBRichText1: TppDBRichText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBRichText2: TppDBRichText;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppLabel14: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppLabel16: TppLabel;
    ppDBText12: TppDBText;
    ppDBCalc3: TppDBCalc;
    sumSubTotalHorasModelo1: TppDBCalc;
    lblSubTotalHorasModelo1: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel15: TppLabel;
    lblPeriodoModelo2: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine8: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppLabel17: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    txtTotalHorasModelo2: TppDBText;
    lblTotalHorasModelo2: TppLabel;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText15: TppDBText;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    CDSRelVisitaModelo2TotalValor: TCurrencyField;
    CDSRelVisitaModelo1Vis_Valor: TCurrencyField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel19: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine4: TppLine;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel23: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    lblSubTotalHorasModelo2: TppLabel;
    ppDBCalc8: TppDBCalc;
    sumSubTotalHorasModelo2: TppDBCalc;
    lblTotalHorasGeralModelo2: TppLabel;
    sumTotalHorasModelo2: TppDBCalc;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    lblPeriodoModelo3: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppLabel29: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLine5: TppLine;
    ppSummaryBand3: TppSummaryBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    CDSRelVisitaModelo3TotalValor: TCurrencyField;
    lblTotalHorasModelo3: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    txtQtdeHorasModelo3: TppDBText;
    ppLabel31: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    lblTotalHorasGeralModelo3: TppLabel;
    sumTotalHorasModelo3: TppDBCalc;
    CDSRelVisitaModelo4TotalValor: TCurrencyField;
    lblPeriodoModelo4: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLine7: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppLabel37: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel32: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    txtQtdeHorasModelo4: TppDBText;
    lblTotalHorasModelo4: TppLabel;
    ppLabel38: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppLine9: TppLine;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    lblSubTotalHorasModelo4: TppLabel;
    ppLabel40: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    lblTotalHorasGeralModelo4: TppLabel;
    sumSubTotalHorasModelo4: TppDBCalc;
    sumTotalHorasModelo4: TppDBCalc;
    CDSRelVisitaModelo3Usu_Nome: TWideStringField;
    ppLine6: TppLine;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppDBText19: TppDBText;
    CDSRelVisitaModelo1Usu_Codigo: TIntegerField;
    CDSRelVisitaModelo1Usu_Nome: TWideStringField;
    ppLabel24: TppLabel;
    ppDBText20: TppDBText;
    ppDBText30: TppDBText;
    CDSRelVisitaModelo7: TClientDataSet;
    CDSRelVisitaModelo7Rev_Codigo: TIntegerField;
    CDSRelVisitaModelo7Rev_Nome: TStringField;
    CDSRelVisitaModelo7Cli_Codigo: TIntegerField;
    CDSRelVisitaModelo7Cli_Nome: TStringField;
    CDSRelVisitaModelo7Usu_Codigo: TIntegerField;
    CDSRelVisitaModelo7Usu_Nome: TStringField;
    CDSRelVisitaModelo7DiasSemVisita: TIntegerField;
    CDSRelVisitaModelo7DiasSemChamado: TIntegerField;
    CDSRelVisitaModelo7DataUltChamado: TStringField;
    dsRelVisitaModelo7: TDataSource;
    dbRelVisitaModelo7: TppDBPipeline;
    RelVisitaModelo7: TppReport;
    ppParameterList5: TppParameterList;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    lblPeriodoModelo7: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppLabel39: TppLabel;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable15: TppSystemVariable;
    ppLabel30: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLine10: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel48: TppLabel;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel49: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppSummaryBand5: TppSummaryBand;
    ppLabel50: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    CDSRelVisitaModelo7DiasSemVisitaStr: TStringField;
    CDSRelVisitaModelo7Cli_Perfil: TStringField;
    CDSRelVisitaModelo7Cid_Nome: TStringField;
    ppLabel51: TppLabel;
    ppDBText38: TppDBText;
    ppLabel52: TppLabel;
    ppDBText39: TppDBText;
    ppDBMemo1: TppDBMemo;
    CDSRelVisitaModelo8: TClientDataSet;
    dsRelVisitaModelo8: TDataSource;
    dbRelVisitaModelo8: TppDBPipeline;
    CDSRelVisitaModelo8Cli_Perfil: TStringField;
    CDSRelVisitaModelo8QtdeChamados: TIntegerField;
    CDSRelVisitaModelo8TotalHoras: TFloatField;
    CDSRelVisitaModelo8TotalValor: TCurrencyField;
    RelVisitaModelo8: TppReport;
    ppParameterList6: TppParameterList;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand6: TppDetailBand;
    ppDBText33: TppDBText;
    lblPeriodoModelo8: TppLabel;
    ppSystemVariable16: TppSystemVariable;
    ppLabel54: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppSystemVariable18: TppSystemVariable;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLine13: TppLine;
    ppSummaryBand6: TppSummaryBand;
    ppLine14: TppLine;
    ppLabel58: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    lblTotalHorasGeralModelo8: TppLabel;
    sumTotalHorasModelo8: TppDBCalc;
    txtQtdeHorasModelo8: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    lblTotalHorasModelo8: TppLabel;
    ppLabel59: TppLabel;
    lblPerc8: TppLabel;
    CDSRelVisitaModelo8Sum_TotalHoras: TAggregateField;
    procedure CDSRelVisitaModelo1CalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand4BeforePrint(Sender: TObject);
    procedure ppSummaryBand2BeforePrint(Sender: TObject);
    procedure ppSummaryBand3BeforePrint(Sender: TObject);
    procedure ppSummaryBand4BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppSummaryBand6BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImpressaoRelatorioModelo7(ALista: TObjectList<TRelChamadoVO>; APeriodo: string);
  end;

var
  DMRelVisita: TDMRelVisita;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMRelVisita.CDSRelVisitaModelo1CalcFields(DataSet: TDataSet);
begin
  if CDSRelVisitaModelo1.State = dsInternalCalc then
    CDSRelVisitaModelo1C_TotalHoras.AsString := TFuncoes.DecimalToHora(CDSRelVisitaModelo1Vis_TotalHoras.AsFloat);
end;

procedure TDMRelVisita.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao;
  end;

  CDSRelVisitaModelo7.CreateDataSet;
end;

procedure TDMRelVisita.ImpressaoRelatorioModelo7(
  ALista: TObjectList<TRelChamadoVO>; APeriodo: string);
var
  Item: TRelChamadoVO;
begin
  CDSRelVisitaModelo7.First;
  while not CDSRelVisitaModelo7.Eof do
    CDSRelVisitaModelo7.Delete;

  for Item in ALista do
  begin
    CDSRelVisitaModelo7.Append;
    CDSRelVisitaModelo7Rev_Codigo.AsInteger := Item.RevendaCodigo;
    CDSRelVisitaModelo7Rev_Nome.AsString := Item.RevendaNome;
    CDSRelVisitaModelo7Cli_Codigo.AsInteger := Item.ClienteCodigo;
    CDSRelVisitaModelo7Cli_Nome.AsString := Item.ClienteNome;
    CDSRelVisitaModelo7Usu_Codigo.AsInteger := Item.UsuCodigo;
    CDSRelVisitaModelo7Usu_Nome.AsString := Item.UsuNome;
    CDSRelVisitaModelo7DiasSemVisita.AsInteger := Item.QtdeDiasSemVisita;
    CDSRelVisitaModelo7DiasSemChamado.AsInteger := Item.QtdeDiasSemChamado;
    CDSRelVisitaModelo7DataUltChamado.AsString := Item.DataUltChamado;
    CDSRelVisitaModelo7Cli_Perfil.AsString := Item.Perfil;
    CDSRelVisitaModelo7Cid_Nome.AsString := Item.NomeCidade;

    if Item.QtdeDiasSemVisita = 0 then
      CDSRelVisitaModelo7DiasSemVisitaStr.AsString := 'Sem Visita'
    else
      CDSRelVisitaModelo7DiasSemVisitaStr.AsString := Item.QtdeDiasSemVisita.ToString();
    CDSRelVisitaModelo7.Post;
  end;

  lblPeriodoModelo7.Caption := 'Acima de ' + APeriodo + ' Dias';
  RelVisitaModelo7.Print;
end;

procedure TDMRelVisita.ppDetailBand2BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo2.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtTotalHorasModelo2.Text,0));
end;

procedure TDMRelVisita.ppDetailBand3BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo4.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtQtdeHorasModelo4.Text,0));
end;

procedure TDMRelVisita.ppDetailBand4BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo3.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtQtdeHorasModelo3.Text,0));
end;

procedure TDMRelVisita.ppDetailBand6BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo8.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtQtdeHorasModelo8.Text,0));
  try
    lblPerc8.Caption := FormatFloat(',##0.00', (CDSRelVisitaModelo8TotalHoras.Value / CDSRelVisitaModelo8Sum_TotalHoras.Value) * 100);
  except
    lblPerc8.Caption := '0,00';
  end;
end;

procedure TDMRelVisita.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  lblSubTotalHorasModelo1.Caption := TFuncoes.DecimalToHora(sumSubTotalHorasModelo1.Value);
end;

procedure TDMRelVisita.ppGroupFooterBand2BeforePrint(Sender: TObject);
begin
  lblSubTotalHorasModelo2.Caption := TFuncoes.DecimalToHora(sumSubTotalHorasModelo2.Value);
end;

procedure TDMRelVisita.ppGroupFooterBand4BeforePrint(Sender: TObject);
begin
  lblSubTotalHorasModelo4.Caption := TFuncoes.DecimalToHora(sumSubTotalHorasModelo4.Value);
end;

procedure TDMRelVisita.ppSummaryBand2BeforePrint(Sender: TObject);
begin
  lblTotalHorasGeralModelo2.Caption := TFuncoes.DecimalToHora(sumTotalHorasModelo2.Value);
end;

procedure TDMRelVisita.ppSummaryBand3BeforePrint(Sender: TObject);
begin
  lblTotalHorasGeralModelo3.Caption := TFuncoes.DecimalToHora(sumTotalHorasModelo3.Value);
end;

procedure TDMRelVisita.ppSummaryBand4BeforePrint(Sender: TObject);
begin
  lblTotalHorasGeralModelo4.Caption := TFuncoes.DecimalToHora(sumTotalHorasModelo4.Value);
end;

procedure TDMRelVisita.ppSummaryBand6BeforePrint(Sender: TObject);
begin
  lblTotalHorasGeralModelo8.Caption := TFuncoes.DecimalToHora(sumTotalHorasModelo8.Value);
end;

end.

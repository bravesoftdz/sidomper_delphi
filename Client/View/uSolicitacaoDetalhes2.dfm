object frmSolicitacaoDetalhes2: TfrmSolicitacaoDetalhes2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Detalhes da Solicita'#231#227'o'
  ClientHeight = 621
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    1018
    621)
  PixelsPerInch = 96
  TextHeight = 13
  object mmoObs: TRichEdit
    Left = 0
    Top = 0
    Width = 1018
    Height = 621
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object EditorDescLiberacao: TDBRichEdit
    Left = 8
    Top = 8
    Width = 992
    Height = 129
    Anchors = [akLeft, akTop, akRight]
    DataField = 'Sol_DescricaoLiberacao'
    DataSource = dsAbertura
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 1
    Visible = False
  end
  object EditorTecnico: TDBRichEdit
    Left = 8
    Top = 143
    Width = 992
    Height = 66
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DescricaoMemo'
    DataSource = dsTecnico
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 2
    Visible = False
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 96
    object cdsDadosTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object cdsDadosData: TDateField
      FieldName = 'Data'
    end
    object cdsDadosHora: TStringField
      FieldName = 'Hora'
      Size = 5
    end
    object cdsDadosOperador: TStringField
      FieldName = 'Operador'
      Size = 50
    end
    object cdsDadosAnexo: TStringField
      FieldName = 'Anexo'
      Size = 200
    end
    object cdsDadosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
    object cdsDadosStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object cdsDadosDescricaoMemo: TMemoField
      FieldName = 'DescricaoMemo'
      BlobType = ftMemo
    end
  end
  object dsAbertura: TDataSource
    Left = 480
    Top = 104
  end
  object dsTecnico: TDataSource
    DataSet = cdsDados
    Left = 568
    Top = 104
  end
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 80
    object cdsStatusData: TDateField
      FieldName = 'Data'
    end
    object cdsStatusStatus: TStringField
      FieldName = 'Status'
      Size = 100
    end
    object cdsStatusOperador: TStringField
      FieldName = 'Operador'
      Size = 100
    end
  end
end

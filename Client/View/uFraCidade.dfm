object FraCidade: TFraCidade
  Left = 0
  Top = 0
  Width = 769
  Height = 236
  TabOrder = 0
  object btnProc: TSpeedButton
    Left = 548
    Top = 11
    Width = 23
    Height = 22
    OnClick = btnProcClick
  end
  object edtCodigo: TEdit
    Left = 3
    Top = 11
    Width = 57
    Height = 21
    Hint = '[F9] - Pesquisar'
    CustomHint = BalloonHint1
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = edtCodigoKeyDown
  end
  object edtNome: TEdit
    Left = 66
    Top = 11
    Width = 479
    Height = 21
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 1
  end
  object dbTabela: TDBGrid
    Left = 3
    Top = 39
    Width = 763
    Height = 186
    DataSource = dsTabela
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbTabelaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 630
        Visible = True
      end>
  end
  object edtId: TEdit
    Left = 477
    Top = 11
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object dsTabela: TDataSource
    DataSet = CDSTabela
    Left = 392
    Top = 104
  end
  object CDSTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 104
    object CDSTabelaId: TIntegerField
      FieldName = 'Id'
    end
    object CDSTabelaCodigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Codigo'
      DisplayFormat = '0000'
    end
    object CDSTabelaNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 336
    Top = 80
  end
end

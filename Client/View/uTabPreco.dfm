inherited frmTabPreco: TfrmTabPreco
  Tag = 101
  ActiveControl = pgControl
  Caption = 'Tabela de Pre'#231'os'
  ClientHeight = 548
  ClientWidth = 994
  OnDestroy = FormDestroy
  ExplicitLeft = -211
  ExplicitWidth = 1000
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 994
    Height = 548
    ExplicitWidth = 994
    ExplicitHeight = 548
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 986
      ExplicitHeight = 519
      inherited Panel1: TPanel
        Width = 986
        Height = 478
        ExplicitWidth = 986
        ExplicitHeight = 478
        inherited GroupBox1: TGroupBox
          Width = 984
          ExplicitWidth = 984
        end
        inherited dbDados: TDBGrid
          Width = 984
          Height = 420
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Tab_Id'
              Title.Caption = 'Id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tab_Referencia'
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tab_Nome'
              Title.Caption = 'Nome'
              Width = 689
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 478
        Width = 986
        ExplicitTop = 478
        ExplicitWidth = 986
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 986
      ExplicitHeight = 519
      inherited Panel3: TPanel
        Width = 986
        Height = 478
        ExplicitWidth = 986
        ExplicitHeight = 478
        object Label4: TLabel
          Left = 24
          Top = 8
          Width = 13
          Height = 14
          Caption = 'Id'
        end
        object Label5: TLabel
          Left = 24
          Top = 56
          Width = 48
          Height = 14
          Caption = 'Nome *'
        end
        object Label6: TLabel
          Left = 87
          Top = 8
          Width = 42
          Height = 14
          Caption = 'Data *'
        end
        object Label7: TLabel
          Left = 24
          Top = 107
          Width = 50
          Height = 14
          Caption = 'Produto'
        end
        object Label8: TLabel
          Left = 24
          Top = 157
          Width = 41
          Height = 14
          Caption = 'Status'
        end
        object Label9: TLabel
          Left = 25
          Top = 205
          Width = 26
          Height = 14
          Caption = 'Tipo'
        end
        object Label10: TLabel
          Left = 214
          Top = 8
          Width = 66
          Height = 14
          Caption = 'Refer'#234'ncia'
        end
        object Label11: TLabel
          Left = 25
          Top = 253
          Width = 222
          Height = 14
          Caption = 'Valor Implanta'#231#227'o Simples Nacional'
        end
        object Label12: TLabel
          Left = 25
          Top = 301
          Width = 188
          Height = 14
          Caption = 'Valor Mensal Simples Nacional'
        end
        object Label13: TLabel
          Left = 25
          Top = 353
          Width = 211
          Height = 14
          Caption = 'Valor Implanta'#231#227'o Regime Normal'
        end
        object Label14: TLabel
          Left = 25
          Top = 405
          Width = 177
          Height = 14
          Caption = 'Valor Mensal Regime Normal'
        end
        object Label15: TLabel
          Left = 442
          Top = 334
          Width = 75
          Height = 14
          Caption = 'Observa'#231#227'o'
        end
        object btnProduto: TSpeedButton
          Left = 399
          Top = 127
          Width = 23
          Height = 22
          OnClick = btnProdutoClick
        end
        object btnStatus: TSpeedButton
          Left = 399
          Top = 177
          Width = 23
          Height = 22
          OnClick = btnStatusClick
        end
        object btnTipo: TSpeedButton
          Left = 399
          Top = 226
          Width = 23
          Height = 22
          OnClick = btnTipoClick
        end
        object Label16: TLabel
          Left = 442
          Top = 8
          Width = 52
          Height = 14
          Caption = 'M'#243'dulos'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 28
          Width = 57
          Height = 22
          TabStop = False
          DataField = 'Tab_Id'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 76
          Width = 369
          Height = 22
          DataField = 'Tab_Nome'
          DataSource = dsCad
          TabOrder = 3
        end
        object Ativo: TDBCheckBox
          Left = 25
          Top = 455
          Width = 50
          Height = 17
          Caption = 'Ativo'
          DataField = 'Tab_Ativo'
          DataSource = dsCad
          TabOrder = 16
        end
        object DBEdit1: TDBEdit
          Left = 87
          Top = 28
          Width = 121
          Height = 22
          DataField = 'Tab_Data'
          DataSource = dsCad
          TabOrder = 1
        end
        object edtCodProduto: TDBEdit
          Left = 24
          Top = 127
          Width = 56
          Height = 22
          DataField = 'Prod_Codigo'
          DataSource = dsCad
          TabOrder = 4
          OnExit = edtCodProdutoExit
          OnKeyDown = edtCodProdutoKeyDown
        end
        object DBEdit3: TDBEdit
          Left = 86
          Top = 127
          Width = 307
          Height = 22
          TabStop = False
          DataField = 'Prod_Nome'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit4: TDBEdit
          Left = 86
          Top = 177
          Width = 307
          Height = 22
          TabStop = False
          DataField = 'Sta_Nome'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 7
        end
        object edtCodStatus: TDBEdit
          Left = 24
          Top = 177
          Width = 56
          Height = 22
          DataField = 'Sta_Codigo'
          DataSource = dsCad
          TabOrder = 6
          OnExit = edtCodStatusExit
          OnKeyDown = edtCodProdutoKeyDown
        end
        object DBEdit6: TDBEdit
          Left = 89
          Top = 226
          Width = 304
          Height = 22
          TabStop = False
          DataField = 'Tip_Nome'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 9
        end
        object edtCodTipo: TDBEdit
          Left = 25
          Top = 225
          Width = 56
          Height = 22
          DataField = 'Tip_Codigo'
          DataSource = dsCad
          TabOrder = 8
          OnExit = edtCodTipoExit
          OnKeyDown = edtCodProdutoKeyDown
        end
        object edtReferencia: TDBEdit
          Left = 214
          Top = 28
          Width = 179
          Height = 22
          DataField = 'Tab_Referencia'
          DataSource = dsCad
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 25
          Top = 273
          Width = 222
          Height = 22
          DataField = 'Tab_ValorImplSimples'
          DataSource = dsCad
          TabOrder = 10
        end
        object DBEdit10: TDBEdit
          Left = 25
          Top = 321
          Width = 222
          Height = 22
          DataField = 'Tab_ValorMensalSimples'
          DataSource = dsCad
          TabOrder = 11
        end
        object DBEdit11: TDBEdit
          Left = 25
          Top = 373
          Width = 222
          Height = 22
          DataField = 'Tab_ValorImplRegNormal'
          DataSource = dsCad
          TabOrder = 12
        end
        object DBEdit12: TDBEdit
          Left = 25
          Top = 425
          Width = 222
          Height = 22
          DataField = 'Tab_ValorMensalRegNormal'
          DataSource = dsCad
          TabOrder = 13
        end
        object DBMemo1: TDBMemo
          Left = 440
          Top = 350
          Width = 528
          Height = 122
          DataField = 'Tab_Observacao'
          DataSource = dsCad
          ScrollBars = ssVertical
          TabOrder = 15
          OnEnter = DBMemo1Enter
          OnExit = DBMemo1Exit
          OnKeyUp = DBMemo1KeyUp
        end
        object dbItens: TDBGrid
          Left = 440
          Top = 28
          Width = 526
          Height = 287
          DataSource = dsItens
          TabOrder = 14
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnColExit = dbItensColExit
          OnDrawColumnCell = dbItensDrawColumnCell
          OnEditButtonClick = dbItensEditButtonClick
          OnEnter = dbItensEnter
          OnExit = dbItensExit
          OnKeyDown = dbItensKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'TabM_Id'
              Visible = False
            end
            item
              ButtonStyle = cbsEllipsis
              Expanded = False
              FieldName = 'Mod_Codigo'
              Title.Caption = 'C'#243'digo'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Mod_Nome'
              ReadOnly = True
              Title.Caption = 'M'#243'dulo'
              Width = 412
              Visible = True
            end>
        end
      end
      inherited Panel4: TPanel
        Top = 478
        Width = 986
        ExplicitTop = 478
        ExplicitWidth = 986
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 986
      ExplicitHeight = 519
      inherited Panel5: TPanel
        Width = 986
        Height = 478
        ExplicitWidth = 986
        ExplicitHeight = 478
        inherited PageControl2: TPageControl
          Width = 984
          Height = 476
          ExplicitWidth = 984
          ExplicitHeight = 476
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 976
            ExplicitHeight = 447
            inherited pnlGeral: TPanel
              Width = 976
              Height = 447
              ExplicitWidth = 976
              ExplicitHeight = 447
            end
          end
          object tsProduto: TTabSheet
            Caption = 'Produto'
            ImageIndex = 1
            OnShow = tsProdutoShow
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 976
              Height = 447
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraProduto: TFraProduto
                Left = 1
                Top = 1
                Width = 974
                Height = 445
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 974
                ExplicitHeight = 445
                inherited dbTabela: TDBGrid
                  Width = 835
                  Height = 476
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 550
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsStatus: TTabSheet
            Caption = 'Status'
            ImageIndex = 2
            OnShow = tsStatusShow
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 976
              Height = 447
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraStatus: TFraStatus
                Left = 1
                Top = 1
                Width = 974
                Height = 445
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 974
                ExplicitHeight = 445
                inherited btnProc: TSpeedButton
                  OnClick = FraStatusbtnProcClick
                end
                inherited edtCodigo: TEdit
                  OnEnter = FraStatusedtCodigoEnter
                end
                inherited dbTabela: TDBGrid
                  Width = 835
                  Height = 476
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 550
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsTipo: TTabSheet
            Caption = 'Tipo'
            ImageIndex = 3
            OnShow = tsTipoShow
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 976
              Height = 447
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraTipo: TFraTipo
                Left = 1
                Top = 1
                Width = 974
                Height = 445
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 974
                ExplicitHeight = 445
                inherited btnProc: TSpeedButton
                  OnClick = FraTipobtnProcClick
                end
                inherited edtCodigo: TEdit
                  OnEnter = FraTipoedtCodigoEnter
                end
                inherited dbTabela: TDBGrid
                  Width = 835
                  Height = 476
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 550
                      Visible = True
                    end>
                end
              end
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 478
        Width = 986
        ExplicitTop = 478
        ExplicitWidth = 986
        inherited btnImprimir: TBitBtn
          Left = 99
          Top = 7
          OnClick = btnImprimirClick
          ExplicitLeft = 99
          ExplicitTop = 7
        end
        inherited btnFecharFiltro: TBitBtn
          Left = 188
          Top = 7
          ExplicitLeft = 188
          ExplicitTop = 7
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMTabPreco.CDSConsulta
    Left = 564
    Top = 41
  end
  inherited dsCad: TDataSource
    DataSet = DMTabPreco.CDSCadastro
    Left = 592
    Top = 40
  end
  inherited BalloonHint1: TBalloonHint
    Left = 636
    Top = 41
  end
  object dsItens: TDataSource
    DataSet = DMTabPreco.CDSItens
    OnStateChange = dsItensStateChange
    Left = 684
    Top = 41
  end
end

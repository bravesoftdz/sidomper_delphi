﻿inherited frmOrcamento: TfrmOrcamento
  Tag = 101
  Caption = 'Or'#231'amento'
  ClientHeight = 671
  ClientWidth = 1018
  OnDestroy = FormDestroy
  ExplicitWidth = 1024
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 1018
    Height = 671
    ParentFont = False
    ExplicitWidth = 1018
    ExplicitHeight = 671
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 642
      inherited Panel1: TPanel
        Width = 1010
        Height = 601
        ExplicitWidth = 1010
        ExplicitHeight = 601
        inherited GroupBox1: TGroupBox
          Width = 1008
          ExplicitWidth = 1008
        end
        inherited dbDados: TDBGrid
          Width = 1008
          Height = 543
          DataSource = dsPesquisa
          PopupMenu = pmOrcamento
          OnMouseMove = dbDadosMouseMove
          Columns = <
            item
              Expanded = False
              FieldName = 'Orc_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Orc_Numero'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Orc_Data'
              Title.Alignment = taCenter
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pros_Nome'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Orc_RazaoSocial'
              Title.Caption = 'Cliente'
              Width = 422
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 173
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CSituacao'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Orc_EmailEnviado'
              Width = 92
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
        inherited btnNovo: TBitBtn
          TabOrder = 4
        end
        inherited btnEditar: TBitBtn
          TabOrder = 5
        end
        inherited btnExcluir: TBitBtn
          TabOrder = 6
        end
        inherited btnFiltrar: TBitBtn
          TabOrder = 7
        end
        inherited btnSair: TBitBtn
          TabOrder = 8
        end
        inherited btnAnterior: TBitBtn
          TabOrder = 1
        end
        inherited btnProximo: TBitBtn
          TabOrder = 2
        end
        inherited btnPrimeiro: TBitBtn
          TabOrder = 0
        end
        inherited btnUltimo: TBitBtn
          TabOrder = 3
        end
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 642
      inherited Panel3: TPanel
        Width = 1010
        Height = 601
        ExplicitWidth = 1010
        ExplicitHeight = 601
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 1008
          Height = 599
          ActivePage = tsItensOrcamento
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = PageControl1Change
          object tsPrincipal: TTabSheet
            Caption = 'Principal'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 16
                Top = 8
                Width = 57
                Height = 14
                Caption = 'N'#250'mero*'
              end
              object Label5: TLabel
                Left = 119
                Top = 8
                Width = 38
                Height = 14
                Caption = 'Data*'
              end
              object Label6: TLabel
                Left = 16
                Top = 56
                Width = 56
                Height = 14
                Caption = 'Usu'#225'rio*'
              end
              object Label18: TLabel
                Left = 16
                Top = 104
                Width = 44
                Height = 14
                Caption = 'Cliente'
              end
              object btnCliente: TSpeedButton
                Left = 567
                Top = 124
                Width = 23
                Height = 22
                OnClick = btnClienteClick
              end
              object Label7: TLabel
                Left = 16
                Top = 152
                Width = 87
                Height = 14
                Caption = 'Raz'#227'o Social*'
              end
              object Label21: TLabel
                Left = 16
                Top = 200
                Width = 93
                Height = 14
                Caption = 'Nome Fantasia'
              end
              object Label22: TLabel
                Left = 16
                Top = 248
                Width = 59
                Height = 14
                Caption = 'Endere'#231'o'
              end
              object Label23: TLabel
                Left = 16
                Top = 392
                Width = 148
                Height = 14
                Caption = 'Contato Compra/Venda'
              end
              object Label24: TLabel
                Left = 16
                Top = 440
                Width = 119
                Height = 14
                Caption = 'Contato Financeiro'
              end
              object Label25: TLabel
                Left = 316
                Top = 200
                Width = 60
                Height = 14
                Caption = 'CNPJ/CPF'
              end
              object Label26: TLabel
                Left = 333
                Top = 8
                Width = 34
                Height = 14
                Caption = 'Tipo*'
              end
              object btnTipo: TSpeedButton
                Left = 567
                Top = 27
                Width = 23
                Height = 22
                OnClick = btnTipoClick
              end
              object Label30: TLabel
                Left = 238
                Top = 8
                Width = 88
                Height = 14
                Caption = 'Data Situa'#231#227'o'
              end
              object Label20: TLabel
                Left = 359
                Top = 248
                Width = 37
                Height = 14
                Caption = 'Bairro'
              end
              object Label33: TLabel
                Left = 411
                Top = 296
                Width = 25
                Height = 14
                Caption = 'CEP'
              end
              object Label34: TLabel
                Left = 16
                Top = 296
                Width = 44
                Height = 14
                Caption = 'Cidade'
              end
              object btnCidade: TSpeedButton
                Left = 382
                Top = 316
                Width = 23
                Height = 22
                OnClick = btnCidadeClick
              end
              object Label35: TLabel
                Left = 534
                Top = 296
                Width = 16
                Height = 14
                Caption = 'UF'
              end
              object Label36: TLabel
                Left = 16
                Top = 344
                Width = 43
                Height = 14
                Caption = 'Fone 1'
              end
              object Label37: TLabel
                Left = 163
                Top = 344
                Width = 43
                Height = 14
                Caption = 'Fone 2'
              end
              object Label38: TLabel
                Left = 310
                Top = 344
                Width = 44
                Height = 14
                Caption = 'Celular'
              end
              object Label41: TLabel
                Left = 456
                Top = 344
                Width = 71
                Height = 14
                Caption = 'Outro Fone'
              end
              object Label42: TLabel
                Left = 411
                Top = 440
                Width = 31
                Height = 14
                Caption = 'Fone'
              end
              object Label43: TLabel
                Left = 460
                Top = 200
                Width = 89
                Height = 14
                Caption = 'Insc. Estadual'
              end
              object Label44: TLabel
                Left = 411
                Top = 392
                Width = 31
                Height = 14
                Caption = 'Fone'
              end
              object Label45: TLabel
                Left = 598
                Top = 56
                Width = 132
                Height = 14
                Caption = 'Representante Legal'
              end
              object Label46: TLabel
                Left = 598
                Top = 104
                Width = 24
                Height = 14
                Caption = 'CPF'
              end
              object edtCodigo: TDBEdit
                Left = 16
                Top = 28
                Width = 97
                Height = 22
                DataField = 'Orc_Numero'
                DataSource = dsCad
                TabOrder = 1
              end
              object edtNome: TDBEdit
                Left = 119
                Top = 28
                Width = 113
                Height = 22
                DataField = 'Orc_Data'
                DataSource = dsCad
                TabOrder = 2
                OnExit = edtNomeExit
              end
              object edtCodUsuario: TDBEdit
                Left = 16
                Top = 76
                Width = 57
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Codigo'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 6
              end
              object DBEdit2: TDBEdit
                Left = 79
                Top = 76
                Width = 482
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 7
              end
              object edtCodCliente: TDBEdit
                Left = 16
                Top = 124
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Cli_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 8
                OnExit = edtCodClienteExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit9: TDBEdit
                Left = 79
                Top = 124
                Width = 482
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Cli_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 9
              end
              object GroupBox3: TGroupBox
                Left = 735
                Top = 0
                Width = 258
                Height = 49
                Caption = 'Situa'#231#227'o: '
                TabOrder = 0
                object DBText1: TDBText
                  Left = 12
                  Top = 20
                  Width = 237
                  Height = 18
                  Alignment = taCenter
                  DataField = 'CSituacao'
                  DataSource = dsCad
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              object DBEdit4: TDBEdit
                Left = 16
                Top = 172
                Width = 545
                Height = 22
                DataField = 'Orc_RazaoSocial'
                DataSource = dsCad
                TabOrder = 10
              end
              object DBEdit5: TDBEdit
                Left = 16
                Top = 220
                Width = 294
                Height = 22
                DataField = 'Orc_Fantasia'
                DataSource = dsCad
                TabOrder = 11
              end
              object DBEdit10: TDBEdit
                Left = 16
                Top = 412
                Width = 389
                Height = 22
                DataField = 'Orc_ContatoCompraVenda'
                DataSource = dsCad
                TabOrder = 24
              end
              object DBGrid3: TDBGrid
                Left = 16
                Top = 488
                Width = 545
                Height = 81
                DataSource = dsEmail
                TabOrder = 28
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'OrcEm_Email'
                    Title.Caption = 'Email'
                    Width = 499
                    Visible = True
                  end>
              end
              object edtCNPJCPF: TDBEdit
                Left = 316
                Top = 220
                Width = 138
                Height = 22
                DataField = 'Orc_Dcto'
                DataSource = dsCad
                TabOrder = 12
                OnExit = edtCNPJCPFExit
              end
              object edtCodTipo: TDBEdit
                Left = 333
                Top = 28
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Tip_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnExit = edtCodTipoExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit11: TDBEdit
                Left = 396
                Top = 28
                Width = 165
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Tip_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 5
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 598
                Top = 152
                Width = 386
                Height = 122
                Caption = 'Tipo: '
                DataField = 'Orc_SubTipo'
                DataSource = dsCad
                Items.Strings = (
                  'Telefone Ativo'
                  'Telefone Passivo'
                  'Visita Cliente'
                  'e-mail'
                  'Site/Contato'
                  'Visita Domper')
                TabOrder = 31
                Values.Strings = (
                  '1'
                  '2'
                  '3'
                  '4'
                  '5'
                  '6')
              end
              object edtDataSituacao: TDBEdit
                Left = 238
                Top = 28
                Width = 88
                Height = 22
                TabStop = False
                DataField = 'Orc_DataSituacao'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 3
              end
              object DBEdit12: TDBEdit
                Left = 16
                Top = 268
                Width = 337
                Height = 22
                DataField = 'Orc_Logradouro'
                DataSource = dsCad
                TabOrder = 14
              end
              object DBEdit13: TDBEdit
                Left = 359
                Top = 268
                Width = 202
                Height = 22
                DataField = 'Orc_Bairro'
                DataSource = dsCad
                TabOrder = 15
              end
              object edtCodCidade: TDBEdit
                Left = 16
                Top = 316
                Width = 70
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Cid_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 16
                OnExit = edtCodCidadeExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit15: TDBEdit
                Left = 92
                Top = 316
                Width = 284
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Cid_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 17
              end
              object DBEdit16: TDBEdit
                Left = 411
                Top = 316
                Width = 117
                Height = 22
                DataField = 'Orc_CEP'
                DataSource = dsCad
                TabOrder = 18
              end
              object DBEdit17: TDBEdit
                Left = 534
                Top = 316
                Width = 27
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Cid_UF'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 19
              end
              object DBEdit18: TDBEdit
                Left = 16
                Top = 364
                Width = 141
                Height = 22
                DataField = 'Orc_Fone1'
                DataSource = dsCad
                TabOrder = 20
              end
              object DBEdit19: TDBEdit
                Left = 163
                Top = 364
                Width = 141
                Height = 22
                DataField = 'Orc_Fone2'
                DataSource = dsCad
                TabOrder = 21
              end
              object DBEdit20: TDBEdit
                Left = 310
                Top = 364
                Width = 141
                Height = 22
                DataField = 'Orc_Celular'
                DataSource = dsCad
                TabOrder = 22
              end
              object DBEdit21: TDBEdit
                Left = 457
                Top = 364
                Width = 104
                Height = 22
                DataField = 'Orc_FoneOutro'
                DataSource = dsCad
                TabOrder = 23
              end
              object DBEdit22: TDBEdit
                Left = 16
                Top = 460
                Width = 389
                Height = 22
                DataField = 'Orc_ContatoFinanceiro'
                DataSource = dsCad
                TabOrder = 26
              end
              object DBEdit23: TDBEdit
                Left = 411
                Top = 460
                Width = 150
                Height = 22
                DataField = 'Orc_ContatoFinanceiroFone'
                DataSource = dsCad
                TabOrder = 27
              end
              object DBEdit24: TDBEdit
                Left = 460
                Top = 220
                Width = 101
                Height = 22
                DataField = 'Orc_IE'
                DataSource = dsCad
                TabOrder = 13
              end
              object DBEdit25: TDBEdit
                Left = 411
                Top = 412
                Width = 150
                Height = 22
                DataField = 'Orc_ContatoCompraVendaFone'
                DataSource = dsCad
                TabOrder = 25
              end
              object DBEdit26: TDBEdit
                Left = 598
                Top = 76
                Width = 386
                Height = 22
                DataField = 'Orc_RepreLegal'
                DataSource = dsCad
                TabOrder = 29
              end
              object edtCPF: TDBEdit
                Left = 598
                Top = 124
                Width = 210
                Height = 22
                DataField = 'Orc_RepreLegalCPF'
                DataSource = dsCad
                TabOrder = 30
              end
              object DBRadioGroup2: TDBRadioGroup
                Left = 598
                Top = 280
                Width = 386
                Height = 81
                Caption = 'Enquadramento:'
                DataField = 'Orc_Enquadramento'
                DataSource = dsCad
                Items.Strings = (
                  'Simples'
                  'Lucro Presumido'
                  'Lucro Real'
                  'N'#227'o Definido')
                TabOrder = 32
                TabStop = True
                Values.Strings = (
                  '01'
                  '02'
                  '03'
                  '00')
              end
              object dbContatos: TDBGrid
                Left = 567
                Top = 367
                Width = 417
                Height = 202
                DataSource = dsContato
                TabOrder = 33
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDrawColumnCell = dbContatosDrawColumnCell
                OnEnter = dbContatosEnter
                OnExit = dbContatosExit
                OnKeyDown = dbContatosKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Cont_Nome'
                    Title.Caption = 'Nome do Contato'
                    Width = 166
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Fone1'
                    Width = 108
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Fone2'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Depto'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Email'
                    Width = 64
                    Visible = True
                  end>
              end
            end
          end
          object tsItensOrcamento: TTabSheet
            Caption = 'Itens'
            ImageIndex = 4
            OnShow = tsItensOrcamentoShow
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object GroupBox2: TGroupBox
                Left = 1
                Top = 1
                Width = 998
                Height = 618
                Align = alTop
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                object Label13: TLabel
                  Left = 658
                  Top = 527
                  Width = 67
                  Height = 16
                  Caption = 'Sub Total'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label16: TLabel
                  Left = 784
                  Top = 527
                  Width = 68
                  Height = 16
                  Caption = 'Desconto'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label17: TLabel
                  Left = 943
                  Top = 527
                  Width = 36
                  Height = 16
                  Caption = 'Total'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label47: TLabel
                  Left = 760
                  Top = 3
                  Width = 149
                  Height = 14
                  Caption = 'Observa'#231#227'o do Produto'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                end
                object Label48: TLabel
                  Left = 3
                  Top = 259
                  Width = 655
                  Height = 18
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'M'#243'dulos'
                  Color = clWhite
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object Label49: TLabel
                  Left = 752
                  Top = 271
                  Width = 144
                  Height = 14
                  Caption = 'Observa'#231#227'o do M'#243'dulo'
                end
                object dbItens: TDBGrid
                  Left = 3
                  Top = 20
                  Width = 655
                  Height = 230
                  DataSource = dsItens
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
                  TitleFont.Style = []
                  OnCellClick = dbItensCellClick
                  OnDrawColumnCell = dbItensDrawColumnCell
                  OnEnter = dbItensEnter
                  OnExit = dbItensExit
                  OnKeyDown = dbItensKeyDown
                  OnKeyUp = dbItensKeyUp
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'OrcIte_Id'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'Prod_Codigo'
                      Title.Caption = 'C'#243'digo'
                      Width = 57
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Prod_Nome'
                      ReadOnly = True
                      Title.Caption = 'Produto'
                      Width = 235
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OrcIte_ValorLicencaImpl'
                      Title.Caption = 'Vlr Inicial'
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OrcIte_ValorDescImpl'
                      Title.Caption = 'Desc. Inicial'
                      Width = 81
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OrcIte_ValorLicencaMensal'
                      Title.Caption = 'Vlr Mensal'
                      Width = 74
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OrcIte_ValorDescMensal'
                      Title.Caption = 'Desc Mensal'
                      Width = 82
                      Visible = True
                    end>
                end
                object edtTotal: TDBEdit
                  Left = 604
                  Top = 544
                  Width = 121
                  Height = 24
                  TabStop = False
                  DataField = 'TotalImpl'
                  DataSource = dsItens
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 1
                end
                object DBEdit6: TDBEdit
                  Left = 731
                  Top = 544
                  Width = 121
                  Height = 24
                  TabStop = False
                  DataField = 'TotalDescontoImpl'
                  DataSource = dsItens
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object DBEdit7: TDBEdit
                  Left = 858
                  Top = 544
                  Width = 121
                  Height = 24
                  TabStop = False
                  DataField = 'TotalLiquido'
                  DataSource = dsItens
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Verdana'
                  Font.Style = [fsBold]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object mmObsItens: TDBMemo
                  Left = 664
                  Top = 20
                  Width = 331
                  Height = 230
                  DataField = 'OrcIte_Descricao'
                  DataSource = dsItens
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = dbItensExit
                  OnKeyDown = mmObsItensKeyDown
                end
                object dbModulo: TDBGrid
                  Left = 3
                  Top = 291
                  Width = 656
                  Height = 230
                  DataSource = dsModulo
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
                  TitleFont.Style = []
                  OnEnter = dbModuloEnter
                  OnExit = dbModuloExit
                  OnKeyDown = dbModuloKeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Mod_Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Mod_Nome'
                      Title.Caption = 'Descri'#231#227'o'
                      Width = 523
                      Visible = True
                    end>
                end
                object mmModuloObs: TDBMemo
                  Left = 665
                  Top = 291
                  Width = 330
                  Height = 230
                  DataField = 'OrcIteMod_Descricao'
                  DataSource = dsModulo
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Verdana'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 6
                  OnExit = dbModuloExit
                end
              end
            end
          end
          object tsObservacao: TTabSheet
            Caption = 'Observa'#231#245'es'
            ImageIndex = 1
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label9: TLabel
                Left = 416
                Top = 267
                Width = 112
                Height = 14
                Caption = 'Observa'#231#227'o Email'
              end
              object Label8: TLabel
                Left = 432
                Top = 16
                Width = 75
                Height = 14
                Caption = 'Observa'#231#227'o'
              end
              object DBMemo1: TDBMemo
                Left = 16
                Top = 292
                Width = 977
                Height = 225
                DataField = 'Orc_ObservacaoEmail'
                DataSource = dsCad
                ScrollBars = ssVertical
                TabOrder = 2
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object EditorObs: TDBRichEdit
                Left = 16
                Top = 36
                Width = 977
                Height = 225
                DataField = 'Orc_Observacao'
                DataSource = dsCad
                ParentFont = True
                ScrollBars = ssVertical
                TabOrder = 1
                OnChange = EditorObsChange
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object btnFormatarTexto: TBitBtn
                Left = 16
                Top = 2
                Width = 152
                Height = 28
                Hint = 'Formata'#231#227'o'
                Caption = 'Formatar Texto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Bell MT'
                Font.Style = [fsBold]
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TabStop = False
                OnClick = btnFormatarTextoClick
              end
              object editorObs2: TRichEdit
                Left = 16
                Top = 523
                Width = 977
                Height = 69
                ScrollBars = ssVertical
                TabOrder = 3
                Visible = False
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
            end
          end
          object tsVenctos: TTabSheet
            Caption = 'Vencimentos'
            ImageIndex = 3
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Hint = '[F9] - Pesquisar'
              CustomHint = BalloonHint1
              Align = alClient
              BevelOuter = bvLowered
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object Label14: TLabel
                Left = 174
                Top = 509
                Width = 102
                Height = 16
                CustomHint = BalloonHint1
                Caption = 'Total Parcelas'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label15: TLabel
                Left = 16
                Top = 509
                Width = 121
                Height = 16
                CustomHint = BalloonHint1
                Caption = 'Total Or'#231'amento'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label19: TLabel
                Left = 16
                Top = 8
                Width = 143
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Forma de Pagamento*'
              end
              object btnForma: TSpeedButton
                Left = 532
                Top = 27
                Width = 23
                Height = 22
                CustomHint = BalloonHint1
                OnClick = btnFormaClick
              end
              object dbVenctos: TDBGrid
                Left = 16
                Top = 70
                Width = 977
                Height = 433
                CustomHint = BalloonHint1
                DataSource = dsVencimento
                TabOrder = 2
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnColExit = dbVenctosColExit
                OnDrawColumnCell = dbVenctosDrawColumnCell
                OnEnter = dbVenctosEnter
                OnExit = dbVenctosExit
                OnKeyDown = dbVenctosKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'OrcVect_Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'OrcVect_Parcela'
                    ReadOnly = True
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OrcVect_Data'
                    Width = 95
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OrcVect_Valor'
                    Title.Alignment = taRightJustify
                    Width = 98
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OrcVect_Descricao'
                    Width = 657
                    Visible = True
                  end>
              end
              object edtTotalParcelas: TDBEdit
                Left = 155
                Top = 531
                Width = 121
                Height = 24
                CustomHint = BalloonHint1
                TabStop = False
                DataField = 'TotalParcelas'
                DataSource = dsVencimento
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object edtTotalOrcamento: TDBEdit
                Left = 16
                Top = 531
                Width = 121
                Height = 24
                CustomHint = BalloonHint1
                TabStop = False
                DataField = 'TotalLiquido'
                DataSource = dsItens
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object edtCodForma: TDBEdit
                Left = 16
                Top = 28
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Fpg_Codigo'
                DataSource = dsCad
                TabOrder = 0
                OnExit = edtCodFormaExit
                OnKeyDown = edtCodFormaKeyDown
              end
              object DBEdit8: TDBEdit
                Left = 79
                Top = 28
                Width = 450
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Fpg_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 1
              end
            end
          end
          object tsOcorrencia: TTabSheet
            Caption = 'Ocorr'#234'ncia'
            ImageIndex = 2
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label10: TLabel
                Left = 16
                Top = 236
                Width = 56
                Height = 14
                Caption = 'Usu'#225'rio*'
              end
              object Label11: TLabel
                Left = 16
                Top = 284
                Width = 38
                Height = 14
                Caption = 'Data*'
              end
              object Label12: TLabel
                Left = 16
                Top = 336
                Width = 60
                Height = 14
                Caption = 'Descri'#231#227'o'
              end
              object dbOcorrencia: TDBGrid
                Left = 16
                Top = 16
                Width = 977
                Height = 214
                DataSource = dsOcorrencia
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDrawColumnCell = dbOcorrenciaDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'OrcOco_Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'OrcOco_Data'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Usu_Codigo'
                    Width = 64
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Usu_Nome'
                    Width = 771
                    Visible = True
                  end>
              end
              object DBEdit1: TDBEdit
                Left = 16
                Top = 256
                Width = 57
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Codigo'
                DataSource = dsOcorrencia
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit3: TDBEdit
                Left = 79
                Top = 256
                Width = 634
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsOcorrencia
                ReadOnly = True
                TabOrder = 2
              end
              object edtDataOcorrencia: TDBEdit
                Left = 16
                Top = 304
                Width = 113
                Height = 22
                DataField = 'OrcOco_Data'
                DataSource = dsOcorrencia
                TabOrder = 3
              end
              object DBMemo2: TDBMemo
                Left = 16
                Top = 356
                Width = 977
                Height = 174
                DataField = 'OrcOco_Descricao'
                DataSource = dsOcorrencia
                ScrollBars = ssVertical
                TabOrder = 4
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object btnNovoOco: TBitBtn
                Left = 519
                Top = 536
                Width = 90
                Height = 25
                Hint = 'Insert'
                Caption = 'Novo'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnClick = btnNovoOcoClick
              end
              object btnEditarOco: TBitBtn
                Left = 615
                Top = 536
                Width = 90
                Height = 25
                Hint = 'F2'
                Caption = 'Editar'
                TabOrder = 6
                OnClick = btnEditarOcoClick
              end
              object btnSalvarOco: TBitBtn
                Left = 807
                Top = 536
                Width = 90
                Height = 25
                Hint = 'F8'
                Caption = 'Salvar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 8
                OnClick = btnSalvarOcoClick
              end
              object btnExcluirOco: TBitBtn
                Left = 711
                Top = 536
                Width = 90
                Height = 25
                Hint = 'CTRL + DEL'
                Caption = 'Excluir'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                OnClick = btnExcluirOcoClick
              end
              object btnCancelarOco: TBitBtn
                Left = 903
                Top = 536
                Width = 90
                Height = 25
                Hint = 'Esc'
                Caption = 'Cancelar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnClick = btnCancelarOcoClick
              end
            end
          end
        end
      end
      inherited Panel4: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 642
      inherited Panel5: TPanel
        Width = 1010
        Height = 601
        ExplicitWidth = 1010
        ExplicitHeight = 601
        inherited PageControl2: TPageControl
          Width = 1008
          Height = 599
          ActivePage = tsUsuario
          ExplicitWidth = 1008
          ExplicitHeight = 599
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 1000
            ExplicitHeight = 570
            inherited pnlGeral: TPanel
              Width = 1000
              Height = 570
              ExplicitWidth = 1000
              ExplicitHeight = 570
              inherited Situação: TLabel
                Left = 545
                Visible = False
                ExplicitLeft = 545
              end
              object Label39: TLabel [1]
                Left = 17
                Top = 15
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object Label40: TLabel [2]
                Left = 16
                Top = 63
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              object Label28: TLabel [3]
                Left = 19
                Top = 111
                Width = 50
                Height = 14
                Caption = 'SubTipo'
              end
              object Label29: TLabel [4]
                Left = 281
                Top = 112
                Width = 87
                Height = 14
                Caption = 'Email Enviado'
              end
              object Label31: TLabel [5]
                Left = 121
                Top = 15
                Width = 128
                Height = 14
                Caption = 'Data Situa'#231#227'o Inicial'
              end
              object Label32: TLabel [6]
                Left = 120
                Top = 63
                Width = 121
                Height = 14
                Caption = 'Data Situa'#231#227'o Final'
              end
              object lbl1: TLabel [7]
                Left = 488
                Top = 111
                Width = 49
                Height = 14
                Caption = 'N'#250'mero'
              end
              inherited cbbSituacao: TComboBox
                Left = 544
                Width = 77
                TabOrder = 3
                Visible = False
                ExplicitLeft = 544
                ExplicitWidth = 77
              end
              object edtDataInicial: TMaskEdit
                Left = 17
                Top = 35
                Width = 87
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object edtDataFinal: TMaskEdit
                Left = 16
                Top = 83
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 4
                Text = '  /  /    '
              end
              object GroupBox4: TGroupBox
                Left = 1
                Top = 168
                Width = 998
                Height = 401
                Align = alBottom
                Caption = '  Relat'#243'rios:  '
                TabOrder = 9
                object Label27: TLabel
                  Left = 18
                  Top = 32
                  Width = 52
                  Height = 14
                  Caption = 'Modelos'
                end
                object cbbModeloRel: TComboBox
                  Left = 18
                  Top = 52
                  Width = 287
                  Height = 22
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 0
                  Text = '01 - Or'#231'amento Por Tipo'
                  Items.Strings = (
                    '01 - Or'#231'amento Por Tipo'
                    '02 - Or'#231'amento Por Usu'#225'rio'
                    '03 - Or'#231'amento n'#227'o Aprovado')
                end
              end
              object cbbSubTipo: TComboBox
                Left = 19
                Top = 131
                Width = 230
                Height = 22
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 6
                Text = 'Todos'
                Items.Strings = (
                  'Todos'
                  '01 - Telefone Ativo'
                  '02 - Telefone Passivo'
                  '03 - Visita Cliente'
                  '04 - e-mail'
                  '05 - Site/Contato'
                  '06 - Visita Domper')
              end
              object cbbEmailEnviado: TComboBox
                Left = 280
                Top = 131
                Width = 185
                Height = 22
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 7
                Text = 'Todos'
                Items.Strings = (
                  'Todos'
                  'Sim'
                  'N'#227'o')
              end
              object edtDataSituacaoInicial: TMaskEdit
                Left = 121
                Top = 35
                Width = 128
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
              end
              object edtDataSituacaoFinal: TMaskEdit
                Left = 120
                Top = 83
                Width = 129
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 5
                Text = '  /  /    '
              end
              object GroupBox5: TGroupBox
                Left = 280
                Top = 10
                Width = 185
                Height = 96
                Caption = 'Situa'#231#227'o:'
                TabOrder = 0
                object chkAnalise: TCheckBox
                  Left = 16
                  Top = 24
                  Width = 81
                  Height = 17
                  Caption = 'An'#225'lise'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object chkAprovado: TCheckBox
                  Left = 16
                  Top = 39
                  Width = 97
                  Height = 17
                  Caption = 'Aprovados'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
                object chkNaoAprovado: TCheckBox
                  Left = 16
                  Top = 54
                  Width = 113
                  Height = 17
                  Caption = 'N'#227'o Aprovados'
                  TabOrder = 2
                end
                object chkFaturado: TCheckBox
                  Left = 16
                  Top = 70
                  Width = 97
                  Height = 17
                  Caption = 'Faturado'
                  TabOrder = 3
                end
              end
              object edtNumeroFiltro: TEdit
                Left = 488
                Top = 131
                Width = 81
                Height = 22
                Alignment = taCenter
                NumbersOnly = True
                TabOrder = 8
                OnExit = edtNumeroFiltroExit
              end
            end
          end
          object tsUsuario: TTabSheet
            Caption = 'Usu'#225'rio'
            ImageIndex = 1
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraUsuario: TFraUsuario
                Left = 1
                Top = 1
                Width = 998
                Height = 568
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
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Width = 992
                  Height = 529
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 860
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsCliente: TTabSheet
            Caption = 'Cliente'
            ImageIndex = 3
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraCliente: TFraCliente
                Left = 1
                Top = 1
                Width = 998
                Height = 568
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
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited dbCliente: TDBGrid
                  Width = 992
                  Height = 529
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Cli_Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Cli_Nome'
                      Width = 860
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsCidade: TTabSheet
            Caption = 'Cidade'
            ImageIndex = 4
            object Panel15: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraCidade: TFraCidade
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited edtCodigo: TEdit
                  Height = 22
                  ExplicitHeight = 22
                end
                inherited edtNome: TEdit
                  Height = 22
                  ExplicitHeight = 22
                end
                inherited dbTabela: TDBGrid
                  Width = 992
                  Height = 529
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
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
                      Width = 860
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  Height = 22
                  ExplicitHeight = 22
                end
              end
            end
          end
          object tsTipo: TTabSheet
            Caption = 'Tipo'
            ImageIndex = 3
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraTipo: TFraTipo
                Left = 1
                Top = 1
                Width = 998
                Height = 568
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
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited btnProc: TSpeedButton
                  OnClick = FraTipobtnProcClick
                end
                inherited edtCodigo: TEdit
                  TabOrder = 0
                  OnEnter = FraTipoedtCodigoEnter
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Width = 992
                  Height = 529
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
                      Width = 860
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMOrcamento.CDSConsulta
    Left = 452
    Top = 17
  end
  inherited dsCad: TDataSource
    DataSet = DMOrcamento.CDSCadastro
    Left = 512
    Top = 8
  end
  inherited BalloonHint1: TBalloonHint
    Left = 204
    Top = 129
  end
  object dsItens: TDataSource
    DataSet = DMOrcamento.CDSItens
    Left = 665
    Top = 11
  end
  object dsOcorrencia: TDataSource
    AutoEdit = False
    DataSet = DMOrcamento.CDSOcorrencia
    OnStateChange = dsOcorrenciaStateChange
    Left = 400
    Top = 16
  end
  object dsVencimento: TDataSource
    DataSet = DMOrcamento.CDSVenctos
    OnStateChange = dsVencimentoStateChange
    Left = 584
    Top = 16
  end
  object pmOrcamento: TPopupMenu
    Left = 252
    Top = 129
    object Situao1: TMenuItem
      Caption = 'Situa'#231#227'o'
      object pmAnalise: TMenuItem
        Caption = 'Em An'#225'lise'
        OnClick = pmAnaliseClick
      end
      object pmAprovado: TMenuItem
        Caption = 'Aprovado'
        OnClick = pmAprovadoClick
      end
      object pmNaoAprovado: TMenuItem
        Caption = 'N'#227'o Aprovado'
        OnClick = pmNaoAprovadoClick
      end
      object pmFaturado: TMenuItem
        Caption = 'Faturado'
        OnClick = pmFaturadoClick
      end
    end
    object Impresso1: TMenuItem
      Caption = 'Impress'#227'o'
      OnClick = Impresso1Click
    end
    object EnviodeEmail1: TMenuItem
      Caption = 'Envio de Email'
      OnClick = EnviodeEmail1Click
    end
    object mmDuplicar: TMenuItem
      Caption = 'Replicar'
      OnClick = mmDuplicarClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Ocorrncia1: TMenuItem
      Caption = 'Ocorr'#234'ncia'
      OnClick = Ocorrncia1Click
    end
  end
  object dsEmail: TDataSource
    DataSet = DMOrcamento.CDSEmail
    OnStateChange = dsEmailStateChange
    Left = 416
    Top = 560
  end
  object dsContato: TDataSource
    DataSet = DMOrcamento.CDSContato
    Left = 881
    Top = 163
  end
  object dsModulo: TDataSource
    DataSet = DMOrcamento.CDSItensModulo
    Left = 432
    Top = 112
  end
end

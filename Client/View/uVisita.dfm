﻿inherited frmVisita: TfrmVisita
  Tag = 2
  Caption = 'Visitas'
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
          inherited Label2: TLabel
            Left = 295
            ExplicitLeft = 295
          end
          object lblMensagem: TLabel [2]
            Left = 574
            Top = 36
            Width = 260
            Height = 14
            Caption = 'Pesquisar data em formato: AAAA-MM-DD'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          inherited Label3: TLabel
            Left = 213
            Top = 8
            ExplicitLeft = 213
            ExplicitTop = 8
          end
          inherited cbbCampos: TComboBox
            OnChange = cbbCamposChange
          end
          inherited edtDescricao: TEdit
            Left = 295
            ExplicitLeft = 295
          end
          inherited cbbPesquisa: TComboBox
            Width = 74
            ExplicitWidth = 74
          end
        end
        inherited dbDados: TDBGrid
          Width = 1008
          Height = 543
          DataSource = dsPesquisa
          PopupMenu = pmConsulta
          Columns = <
            item
              Expanded = False
              FieldName = 'Vis_Id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vis_Data'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vis_Dcto'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Nome'
              Width = 341
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Fantasia'
              Width = 139
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 215
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
          Left = 144
          TabOrder = 4
          ExplicitLeft = 144
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
          ActivePage = tsPrincipal
          Align = alClient
          TabOrder = 0
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
                Left = 24
                Top = 5
                Width = 14
                Height = 14
                Caption = 'ID'
              end
              object Label5: TLabel
                Left = 25
                Top = 61
                Width = 71
                Height = 14
                Caption = 'Documento'
              end
              object Label6: TLabel
                Left = 101
                Top = 5
                Width = 42
                Height = 14
                Caption = 'Data *'
              end
              object Label7: TLabel
                Left = 201
                Top = 5
                Width = 82
                Height = 14
                Caption = 'Hora Inicial *'
              end
              object Label8: TLabel
                Left = 289
                Top = 5
                Width = 75
                Height = 14
                Caption = 'Hora Final *'
              end
              object Label9: TLabel
                Left = 24
                Top = 157
                Width = 56
                Height = 14
                Caption = 'Cliente *'
              end
              object btnCliente: TSpeedButton
                Left = 499
                Top = 173
                Width = 23
                Height = 22
                OnClick = btnClienteClick
              end
              object Label10: TLabel
                Left = 24
                Top = 109
                Width = 61
                Height = 14
                Caption = 'Consultor'
              end
              object Label11: TLabel
                Left = 25
                Top = 302
                Width = 51
                Height = 14
                Caption = 'Contato'
              end
              object Label12: TLabel
                Left = 24
                Top = 203
                Width = 38
                Height = 14
                Caption = 'Tipo *'
              end
              object btnTipo: TSpeedButton
                Left = 499
                Top = 221
                Width = 23
                Height = 22
                OnClick = btnTipoClick
              end
              object Label13: TLabel
                Left = 24
                Top = 251
                Width = 53
                Height = 14
                Caption = 'Status *'
              end
              object btnStatus: TSpeedButton
                Left = 499
                Top = 269
                Width = 23
                Height = 22
                OnClick = btnStatusClick
              end
              object Label14: TLabel
                Left = 24
                Top = 355
                Width = 72
                Height = 14
                Caption = 'Descri'#231#227'o *'
              end
              object Label15: TLabel
                Left = 532
                Top = 517
                Width = 39
                Height = 14
                Caption = 'Anexo'
              end
              object btnAnexar: TSpeedButton
                Left = 951
                Top = 537
                Width = 23
                Height = 22
                Hint = 'Anexar Arquivo'
                CustomHint = BalloonHint1
                ParentShowHint = False
                ShowHint = True
                OnClick = btnAnexarClick
              end
              object btnVisualizar: TSpeedButton
                Left = 971
                Top = 537
                Width = 23
                Height = 22
                Hint = 'Visualizar Arquivo'
                CustomHint = BalloonHint1
                ParentShowHint = False
                ShowHint = True
                OnClick = btnVisualizarClick
              end
              object Label16: TLabel
                Left = 532
                Top = 3
                Width = 31
                Height = 14
                Caption = 'Valor'
              end
              object Label17: TLabel
                Left = 532
                Top = 51
                Width = 135
                Height = 14
                Caption = 'Forma de Pagamento'
              end
              object Label18: TLabel
                Left = 399
                Top = 297
                Width = 43
                Height = 14
                Caption = 'Vers'#227'o'
              end
              object edtCodigo: TDBEdit
                Left = 24
                Top = 25
                Width = 71
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Vis_Id'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 25
                Top = 81
                Width = 222
                Height = 22
                DataField = 'Vis_Dcto'
                DataSource = dsCad
                TabOrder = 4
              end
              object edtData: TDBEdit
                Left = 101
                Top = 25
                Width = 94
                Height = 22
                DataField = 'Vis_Data'
                DataSource = dsCad
                TabOrder = 1
              end
              object DBEdit2: TDBEdit
                Left = 201
                Top = 25
                Width = 82
                Height = 22
                DataField = 'Vis_HoraInicio'
                DataSource = dsCad
                TabOrder = 2
              end
              object DBEdit3: TDBEdit
                Left = 289
                Top = 25
                Width = 84
                Height = 22
                DataField = 'Vis_HoraFim'
                DataSource = dsCad
                TabOrder = 3
              end
              object edtCodCliente: TDBEdit
                Left = 24
                Top = 173
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Cli_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                OnExit = edtCodClienteExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit5: TDBEdit
                Left = 101
                Top = 173
                Width = 396
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Cli_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 8
              end
              object edtCodUsuario: TDBEdit
                Left = 24
                Top = 125
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 5
                OnExit = edtCodUsuarioExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit7: TDBEdit
                Left = 101
                Top = 125
                Width = 396
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 6
              end
              object DBEdit8: TDBEdit
                Left = 25
                Top = 319
                Width = 368
                Height = 22
                CharCase = ecUpperCase
                DataField = 'Vis_Contato'
                DataSource = dsCad
                TabOrder = 13
              end
              object edtCodTipo: TDBEdit
                Left = 24
                Top = 221
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Tip_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnExit = edtCodTipoExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit10: TDBEdit
                Left = 101
                Top = 221
                Width = 396
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Tip_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 10
              end
              object edtCodStatus: TDBEdit
                Left = 24
                Top = 269
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Sta_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                OnExit = edtCodStatusExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit12: TDBEdit
                Left = 101
                Top = 269
                Width = 396
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Sta_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 12
              end
              object DBMemo1: TDBMemo
                Left = 25
                Top = 375
                Width = 472
                Height = 184
                DataField = 'Vis_Descricao'
                DataSource = dsCad
                MaxLength = 2000
                TabOrder = 15
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object edtNomeArquivo: TDBEdit
                Left = 532
                Top = 537
                Width = 413
                Height = 22
                DataField = 'Vis_Anexo'
                DataSource = dsCad
                TabOrder = 18
              end
              object DBEdit4: TDBEdit
                Left = 532
                Top = 23
                Width = 157
                Height = 22
                DataField = 'Vis_Valor'
                DataSource = dsCad
                TabOrder = 16
              end
              object DBMemo2: TDBMemo
                Left = 532
                Top = 71
                Width = 461
                Height = 440
                DataField = 'Vis_FormaPagto'
                DataSource = dsCad
                MaxLength = 500
                ScrollBars = ssVertical
                TabOrder = 17
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object DBEdit1: TDBEdit
                Left = 399
                Top = 319
                Width = 98
                Height = 22
                CharCase = ecUpperCase
                DataField = 'Vis_Versao'
                DataSource = dsCad
                TabOrder = 14
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
        inherited btnSalvar: TBitBtn
          Left = 10
          ExplicitLeft = 10
        end
      end
    end
    inherited tsFiltro: TTabSheet
      OnShow = tsFiltroShow
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
                Left = 280
                Top = 65
                Visible = False
                ExplicitLeft = 280
                ExplicitTop = 65
              end
              object lblDataInicial: TLabel [1]
                Left = 16
                Top = 16
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object lblDataFinal: TLabel [2]
                Left = 15
                Top = 64
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              object lbl1: TLabel [3]
                Left = 128
                Top = 16
                Width = 13
                Height = 14
                Caption = 'Id'
              end
              object lblAcimaDias: TLabel [4]
                Left = 128
                Top = 116
                Width = 62
                Height = 14
                Caption = 'Qtde Dias'
              end
              object Label19: TLabel [5]
                Left = 129
                Top = 64
                Width = 31
                Height = 14
                Caption = 'Perfil'
              end
              inherited cbbSituacao: TComboBox
                Left = 279
                Top = 84
                TabOrder = 5
                Visible = False
                ExplicitLeft = 279
                ExplicitTop = 84
              end
              object edtDataInicial: TMaskEdit
                Left = 16
                Top = 36
                Width = 88
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object edtDataFinal: TMaskEdit
                Left = 15
                Top = 84
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object GroupBox2: TGroupBox
                Left = 16
                Top = 232
                Width = 977
                Height = 337
                Caption = 'Relat'#243'rios:'
                TabOrder = 6
                object Label23: TLabel
                  Left = 13
                  Top = 32
                  Width = 52
                  Height = 14
                  Caption = 'Modelos'
                end
                object lblOrdemRelatorio: TLabel
                  Left = 13
                  Top = 88
                  Width = 122
                  Height = 14
                  Caption = 'Ordem do Relat'#243'rio'
                  Visible = False
                end
                object cbbModelo: TComboBox
                  Left = 13
                  Top = 52
                  Width = 340
                  Height = 22
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 0
                  Text = '01 - Visitas por Cliente'
                  OnClick = cbbModeloClick
                  Items.Strings = (
                    '01 - Visitas por Cliente'
                    '02 - Resumo de Horas por Cliente'
                    '03 - Resumo de Visitas por Consultor'
                    '04 - Resumo de Horas por Tipo '
                    '05 - Resumo de Visitas por Consultor M'#234's'
                    '06 - Resumo de Horas por Tipo M'#234's'
                    '07 - Clientes sem Visitas'
                    '08 - Resumo de Visitas por Perfil de Cliente')
                end
                object cbbOrdemRelatorio: TComboBox
                  Left = 13
                  Top = 108
                  Width = 340
                  Height = 22
                  Style = csDropDownList
                  TabOrder = 1
                  Visible = False
                end
              end
              object edtIdFiltro: TEdit
                Left = 128
                Top = 36
                Width = 81
                Height = 22
                Alignment = taCenter
                NumbersOnly = True
                TabOrder = 2
                OnExit = edtIdFiltroExit
              end
              object edtDias: TEdit
                Left = 128
                Top = 132
                Width = 81
                Height = 22
                NumbersOnly = True
                TabOrder = 4
              end
              object edtPerfil: TEdit
                Left = 128
                Top = 84
                Width = 81
                Height = 22
                TabOrder = 3
              end
            end
          end
          object tsFiltroCliente: TTabSheet
            Caption = 'Cliente'
            ImageIndex = 1
            object Panel8: TPanel
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
                  Left = 0
                  Width = 998
                  Height = 529
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Cli_Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Cli_Nome'
                      Width = 857
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsFiltroUsuario: TTabSheet
            Caption = 'Consultor'
            ImageIndex = 2
            object Panel9: TPanel
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
                inherited dbTabela: TDBGrid
                  Left = 0
                  Width = 998
                  Height = 529
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 851
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsFiltroTipo: TTabSheet
            Caption = 'Tipo'
            ImageIndex = 3
            object Panel10: TPanel
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
                  OnEnter = FraTipoedtCodigoEnter
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Width = 998
                  Height = 529
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 853
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsFiltroStatus: TTabSheet
            Caption = 'Status'
            ImageIndex = 4
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraStatus: TFraStatus
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
                  OnClick = FraStatusbtnProcClick
                end
                inherited edtCodigo: TEdit
                  OnEnter = FraStatusedtCodigoEnter
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Width = 998
                  Height = 529
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 854
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsRevenda: TTabSheet
            Caption = 'Revenda'
            ImageIndex = 5
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraRevenda: TFraRevenda
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
                inherited dbTabela: TDBGrid
                  Left = 0
                  Width = 998
                  Height = 529
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 853
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsCidade: TTabSheet
            Caption = 'Cidade'
            ImageIndex = 6
            object Panel13: TPanel
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
                  Left = 0
                  Width = 998
                  Height = 529
                  Align = alBottom
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 853
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
        end
      end
      inherited Panel6: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
        inherited btnImprimir: TBitBtn
          Left = 95
          OnClick = btnImprimirClick
          ExplicitLeft = 95
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMVisita.CDSConsulta
    Left = 652
    Top = 209
  end
  inherited dsCad: TDataSource
    DataSet = DMVisita.CDSCadastro
    Left = 696
    Top = 192
  end
  inherited BalloonHint1: TBalloonHint
    Left = 540
    Top = 129
  end
  object dlgAbrirArquivo: TOpenDialog
    Left = 825
    Top = 7
  end
  object pmConsulta: TPopupMenu
    Left = 412
    Top = 193
    object EnviodeEmail1: TMenuItem
      Caption = 'Envio de Email'
      OnClick = EnviodeEmail1Click
    end
  end
end

object frmMain: TfrmMain
  Left = 207
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1058#1072#1073#1077#1083#1100' '#1091#1095#1077#1090#1072' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1074#1088#1077#1084#1077#1085#1080
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 387
    Top = 8
    Width = 42
    Height = 13
    Caption = #1055#1077#1088#1080#1086#1076':'
  end
  object Label1: TLabel
    Left = 40
    Top = 343
    Width = 54
    Height = 13
    Caption = 'Select day:'
  end
  object pcMain: TPageControl
    Left = 23
    Top = 32
    Width = 865
    Height = 305
    ActivePage = tsPersonal
    TabOrder = 0
    object tsPersonal: TTabSheet
      Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081
      ExplicitLeft = -20
      ExplicitWidth = 825
      object Label3: TLabel
        Left = 10
        Top = 6
        Width = 23
        Height = 13
        Caption = #1060#1048#1054
      end
      object Label4: TLabel
        Left = 10
        Top = 27
        Width = 55
        Height = 13
        Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
      end
      object Label5: TLabel
        Left = 10
        Top = 48
        Width = 66
        Height = 13
        Caption = #1041#1072#1079#1086#1074#1099#1081' '#1050#1058#1059
      end
    end
    object tsGeneral: TTabSheet
      Caption = #1054#1073#1097#1080#1081
      ImageIndex = 1
      ExplicitWidth = 785
      ExplicitHeight = 165
    end
  end
  object dtpDate: TDateTimePicker
    Left = 451
    Top = 5
    Width = 97
    Height = 21
    Date = 42678.864441122690000000
    Time = 42678.864441122690000000
    TabOrder = 1
    OnChange = dtpDateChange
  end
  object edtDay: TEdit
    Left = 40
    Top = 362
    Width = 54
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = '1'
  end
  object udDay: TUpDown
    Left = 94
    Top = 362
    Width = 16
    Height = 21
    Associate = edtDay
    Min = 1
    Max = 31
    Position = 1
    TabOrder = 3
  end
  object btnSetColor: TButton
    Left = 40
    Top = 389
    Width = 71
    Height = 25
    Caption = 'Set color'
    TabOrder = 4
    OnClick = btnSetColorClick
  end
  object rdbRed: TRadioButton
    Left = 126
    Top = 348
    Width = 60
    Height = 17
    Caption = 'Red'
    Checked = True
    TabOrder = 5
    TabStop = True
  end
  object rdbGreen: TRadioButton
    Left = 126
    Top = 372
    Width = 60
    Height = 17
    Caption = 'Green'
    TabOrder = 6
  end
  object rdbGrey: TRadioButton
    Left = 126
    Top = 395
    Width = 60
    Height = 17
    Caption = 'Grey'
    TabOrder = 7
  end
end

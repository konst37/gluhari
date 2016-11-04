unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls;

type TDayType = (dtRed, dtGreen, dtGrey);

type
  TfrmMain = class(TForm)
    pcMain: TPageControl;
    tsPersonal: TTabSheet;
    tsGeneral: TTabSheet;
    dtpDate: TDateTimePicker;
    Label2: TLabel;
    Label1: TLabel;
    edtDay: TEdit;
    udDay: TUpDown;
    btnSetColor: TButton;
    rdbRed: TRadioButton;
    rdbGreen: TRadioButton;
    rdbGrey: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure spbClick(Sender: TObject);
    procedure btnSetColorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
  private
    { Private declarations }
    procedure setDayColor(day: Integer; dayType: TDayType);
  public
    { Public declarations }
    procedure generateCalendar(aDate: TDate);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}
{$R Glyphs.res}

uses DateUtils;

const COLOR_NAMES: array[TDayType] of String = ('RED', 'GREEN', 'GREY');

procedure TfrmMain.btnSetColorClick(Sender: TObject);
var
  day: Integer;
  dayType: TDayType;
begin
  day := udDay.Position;

  if rdbRed.Checked then
    dayType := dtRed
  else if rdbGreen.Checked then
    dayType := dtGreen
  else
    dayType := dtGrey;

  setDayColor(day, dayType);
end;

procedure TfrmMain.dtpDateChange(Sender: TObject);
begin
  generateCalendar(dtpDate.Date);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  dtpDate.Date := EncodeDate(YearOf(Today), MonthOf(Today), 1);
  generateCalendar(dtpDate.Date);
end;

procedure TfrmMain.generateCalendar(aDate: TDate);
var
  i, x, y, md, dx, daysInARow: Integer;
  spb: TSpeedButton;
  lbl: TLabel;
  tmpSpb, tmpLbl: TComponent;
begin
  //if FindComponent('spb1') <> nil then
  //  Exit;

  //daysInARow := 7;
  daysInARow := 10;

  with tsPersonal do
  begin
    for i := 1 to 31 do
    begin
      tmpSpb := FindComponent('spb' + IntToStr(i));
      if tmpSpb <> nil then
      begin
        RemoveComponent(tmpSpb);
        tmpSpb.Free;
        tmpSpb := nil;
      end;

      tmpLbl := FindComponent('lbl' + IntToStr(i));
      if tmpLbl <> nil then
      begin
        RemoveComponent(tmpLbl);
        tmpLbl.Free;
        tmpLbl := nil;
      end;
    end;

    x := 10;
    y := 80;

    //for i := 1 to 31 do
    //  ShowMessage(Format('%d mod 7: %d', [i, i mod 7]));

    for i := 1 to DaysInMonth(aDate) do
    begin
      //spb := TSpeedButton.Create(Self);
      spb := TSpeedButton.Create(tsPersonal);
      spb.Width := 33;
      spb.Height := 33;

      //spb.Caption := IntToStr(i);

      md := (i mod daysInARow);
      if md = 0 then
        md := daysInARow;

      spb.Left := x + (md - 1) * (spb.Width + 10);
      spb.Top := y;

      if md = daysInARow then
        y := y + spb.Height + 15;

      spb.Name := 'spb' + IntToStr(i);

      //spb.Glyph.LoadFromFile('Glyphs\grey.bmp');
      spb.Glyph.LoadFromResourceName(HInstance, 'GREY');

      //spb.Glyph.Canvas.TextOut(5, 5, IntToStr(i));
      //spb.Glyph.Canvas.TextOut(5, 7, '10.5');

      spb.Tag := i;
      spb.OnClick := spbClick;

      dx := 2;
      if i >= 10 then
        dx := 5;

      //lbl := TLabel.Create(Self);
      lbl := TLabel.Create(tsPersonal);
      lbl.Left := spb.Left + (spb.Width div 2) - dx;
      lbl.Top := spb.Top - 12;
      lbl.Caption := IntToStr(i);
      lbl.Name := 'lbl' + IntToStr(i);

      InsertControl(lbl);
      InsertControl(spb);
    end;

  end;
end;

procedure TfrmMain.setDayColor(day: Integer; dayType: TDayType);
var spb: TComponent;
begin
  spb := tsPersonal.FindComponent('spb' + IntToStr(Day));
  if (spb is TSpeedButton) then
    (spb as TSpeedButton).Glyph.LoadFromResourceName(HInstance, COLOR_NAMES[dayType]);
end;

procedure TfrmMain.spbClick(Sender: TObject);
begin
  ShowMessage(IntToStr((Sender as TSpeedButton).Tag) + ', name: ' +
              (Sender as TSpeedButton).Name);
end;

end.

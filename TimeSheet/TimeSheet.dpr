program TimeSheet;

uses
  ExceptionLog,
  Forms,
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'TimeSheet';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

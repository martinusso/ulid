program UnitTestULID;

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  ULID in '..\ULID.pas',
  ULIDTests in 'ULIDTests.pas';

{$R *.RES}

begin
  {$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutDown := DebugHook <> 0;
  {$WARN SYMBOL_PLATFORM ON}

  DUnitTestRunner.RunRegisteredTests;
  ReadLn;
end.


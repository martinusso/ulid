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
  DUnitTestRunner.RunRegisteredTests;
  ReadLn;
end.


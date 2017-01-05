unit ULIDTests;

interface

uses
  TestFramework,
  ULID;

type
  TULIDTests = class(TTestCase)
  published
    procedure TestCreateULID;
    procedure TestEncodeTime;
  end;

implementation

{ TULIDTests }

procedure TULIDTests.TestCreateULID;
var
  Ulid: string;
begin
  Ulid := CreateULID;
  CheckEquals(Length(Ulid), 26);
end;

procedure TULIDTests.TestEncodeTime;
var
  Got: string;
begin
  Got := EncodeTime(1469918176385);
  CheckEquals('01ARYZ6S41', Got);
end;

initialization
  RegisterTest(TULIDTests.Suite);

end.
